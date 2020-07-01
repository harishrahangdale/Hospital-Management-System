package com.hms.services;

import java.util.List;

import com.hms.beans.Medicine;
import com.hms.beans.Patient;
import com.hms.dao.HospitalDAO;

public class PharmacistServices {

	public static Patient getPatient(Long patient_id) throws Exception {
		HospitalDAO dao = new HospitalDAO();
		return dao.getPatient(patient_id);
	}

	public static List<Medicine> getAllMedicinesIssued(Long patient_id) throws Exception {
		HospitalDAO dao = new HospitalDAO();
		return dao.getAllMedicinesIssued(patient_id);

	}

	public static List<Medicine> getAllMedicines() throws Exception {
		HospitalDAO dao = new HospitalDAO();
		return dao.getAllMedicines();
	}

	public static int checkAvailability(int medicineId) throws Exception {
		HospitalDAO dao = new HospitalDAO();
		return dao.checkAvailability(medicineId);
	}

	public static boolean addMedicine(Long patient_id, int medicineId, int reqQuantity) throws Exception {
		HospitalDAO dao = new HospitalDAO();
		return dao.addMedicine(patient_id, medicineId, reqQuantity);
	}

}
