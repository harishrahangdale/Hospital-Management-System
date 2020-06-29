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
import com.hms.beans.User;
import com.hms.beans.Medicine;
import com.hms.services.PharmacistServices;

@WebServlet(description = "pharmacist request reseiver", urlPatterns = { "/PharmacistController" })
public class PharmacistController extends HttpServlet {
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
		if (currentUser != null && !currentUser.getWorkGroup().contentEquals("pharmacist")) {
			rd = request.getRequestDispatcher("Dashboard.jsp");
			rd.forward(request, response);
		}
		String action = "";
		action = (String) request.getParameter("action");

		switch (action) {
		case "issueMedicines":
			rd = request.getRequestDispatcher("pharmacistJSPs/issueMedicines.jsp");
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
		action = (String) request.getParameter("action");

		switch (action) {
		case "issueMedicines":
			try {
				String actionType = "";
				actionType = (String) request.getParameter("actionType");

				if (actionType.contentEquals("find")) {
					Long patient_id = Long.parseLong(request.getParameter("patient_id"));
					Patient patient = null;
					List<Medicine> medicines_issued = null;
					if (request.getParameter("msg") != null) {
						String msg = (String) request.getParameter("msg");
						request.setAttribute("msg", msg);
					}
					patient = PharmacistServices.getPatient(patient_id);
					if (patient != null) {
						medicines_issued = PharmacistServices.getAllMedicinesIssued(patient_id);
						request.setAttribute("actionType", "show");
						request.setAttribute("patient", patient);
						request.setAttribute("medicines", medicines_issued);
						HttpSession session = request.getSession();
						if (session.getAttribute("availableMedicines") == null) {
							List<Medicine> availableMedicines = null;
							availableMedicines = PharmacistServices.getAllMedicines();
							session.setAttribute("availableMedicines", availableMedicines);
						}
					} else {
						request.setAttribute("actionType", "error");
					}
					rd = request.getRequestDispatcher("pharmacistJSPs/issueMedicines.jsp");
					rd.forward(request, response);
				} else if (actionType.contentEquals("check")) {
					Long patient_id = Long.parseLong(request.getParameter("patient_id"));
					int medicineId = Integer.parseInt(request.getParameter("medicineId"));
					int reqQuantity = Integer.parseInt(request.getParameter("quantity"));
					int availableQuantity = PharmacistServices.checkAvailability(medicineId);
					if (availableQuantity == 0) {
						request.setAttribute("msg", "Medicine not available!");
					} else if (availableQuantity - reqQuantity < 0) {
						request.setAttribute("msg", "Only " + availableQuantity + " medicines available!");
					} else {
						if (PharmacistServices.addMedicine(patient_id, medicineId, reqQuantity)) {
							request.setAttribute("msg", "success");
						} else {
							request.setAttribute("msg", "failed");
						}
					}
					Patient patient = null;
					List<Medicine> medicines_issued = null;
					if (request.getParameter("msg") != null) {
						String msg = (String) request.getParameter("msg");
						request.setAttribute("msg", msg);
					}
					patient = PharmacistServices.getPatient(patient_id);
					if (patient != null) {
						medicines_issued = PharmacistServices.getAllMedicinesIssued(patient_id);
						request.setAttribute("actionType", "show");
						request.setAttribute("patient", patient);
						request.setAttribute("medicines", medicines_issued);
						HttpSession session = request.getSession();
						if (session.getAttribute("availableMedicines") == null) {
							List<Medicine> availableMedicines = null;
							availableMedicines = PharmacistServices.getAllMedicines();
							session.setAttribute("availableMedicines", availableMedicines);
						}
						rd = request.getRequestDispatcher("pharmacistJSPs/issueMedicines.jsp");
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
