package com.hms.services;

import java.util.List;

import com.hms.beans.Patient;
import com.hms.beans.Test;
import com.hms.dao.HospitalDAO;

public class DiagnosticianService {

	public static Patient getPatient(Long patient_id) throws Exception {
		HospitalDAO dao = new HospitalDAO();
		return dao.getPatient(patient_id);
	}

	public static List<Test> getAllTests(Long patient_id) throws Exception {
		HospitalDAO dao = new HospitalDAO();
		return dao.getAllTests(patient_id);
	}

	public static List<Test> getAllAvailableTests() throws Exception {
		HospitalDAO dao = new HospitalDAO();
		return dao.getAllAvailableTests();
	}

	public static boolean checkAlreadyTested(Long patient_id, int test_id) throws Exception {
		HospitalDAO dao = new HospitalDAO();
		return dao.checkAlreadyTested(patient_id, test_id);
	}

	public static boolean addTest(Long patient_id, int test_id) throws Exception {
		HospitalDAO dao = new HospitalDAO();
		return dao.addTest(patient_id, test_id);
	}

}
