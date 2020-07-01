package com.hms.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.beans.Patient;
import com.hms.beans.Test;
import com.hms.beans.User;
import com.hms.services.DiagnosticianService;

@WebServlet("/DiagnosticianController")
public class DiagnosticianController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd;
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("currentUser");
		if (currentUser == null) {
			rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}
		if (currentUser != null && !currentUser.getWorkGroup().contentEquals("diagnostician")) {
			rd = request.getRequestDispatcher("Dashboard.jsp");
			rd.forward(request, response);
		}
		String action = "";
		action = request.getParameter("action");
		switch (action) {
		case "addDiagnostic":
			rd = request.getRequestDispatcher("diagnosticianJSPs/addDiagnostic.jsp");
			rd.forward(request, response);
			break;

		case "about":
			rd = request.getRequestDispatcher("about.jsp");
			rd.forward(request, response);
			break;
		default:
			rd = request.getRequestDispatcher("Dashboard.jsp");
			rd.forward(request, response);
			break;
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd;
		String action = "";
		action = request.getParameter("action");
		switch (action) {
		case "addDiagnostic":
			try {
				String actionType = "";
				actionType = (String) request.getParameter("actionType");

				if (actionType.contentEquals("find")) {
					Long patient_id = Long.parseLong(request.getParameter("patient_id"));
					Patient patient = null;
					List<Test> tests = null;
					patient = DiagnosticianService.getPatient(patient_id);
					if (patient != null) {
						tests = DiagnosticianService.getAllTests(patient_id);
						request.setAttribute("actionType", "show");
						request.setAttribute("patient", patient);
						request.setAttribute("tests", tests);
						HttpSession session = request.getSession();
						if (session.getAttribute("availableTests") == null) {
							List<Test> availableTests = null;
							availableTests = DiagnosticianService.getAllAvailableTests();
							session.setAttribute("availableTests", availableTests);
						}
					} else {
						request.setAttribute("actionType", "error");
					}
					rd = request.getRequestDispatcher("diagnosticianJSPs/addDiagnostic.jsp");
					rd.forward(request, response);
				} else if (actionType.contentEquals("check")) {
					Long patient_id = Long.parseLong(request.getParameter("patient_id"));
					int test_id = Integer.parseInt(request.getParameter("test_id"));
					if (!DiagnosticianService.checkAlreadyTested(patient_id, test_id)) {
						if (DiagnosticianService.addTest(patient_id, test_id)) {
							request.setAttribute("msg", "success");
						} else {
							request.setAttribute("msg", "failed");
						}
					} else {
						request.setAttribute("msg", "already");
					}
					Patient patient = null;
					List<Test> tests = null;

					patient = DiagnosticianService.getPatient(patient_id);
					if (patient != null) {
						tests = DiagnosticianService.getAllTests(patient_id);
						request.setAttribute("actionType", "show");
						request.setAttribute("patient", patient);
						request.setAttribute("tests", tests);
						HttpSession session = request.getSession();
						if (session.getAttribute("availableTests") == null) {
							List<Test> availableTests = null;
							availableTests = DiagnosticianService.getAllAvailableTests();
							session.setAttribute("availableTests", availableTests);
						}
						rd = request.getRequestDispatcher("diagnosticianJSPs/addDiagnostic.jsp");
						rd.forward(request, response);
					}
				}
			} catch (Exception e) {
			}
			break;
		default:
			rd = request.getRequestDispatcher("Dashboard.jsp");
			rd.forward(request, response);
			break;
		}
	}

}