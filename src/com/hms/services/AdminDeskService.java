package com.hms.services;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

import com.hms.beans.Medicine;
import com.hms.beans.Patient;
import com.hms.beans.Test;
import com.hms.dao.HospitalDAO;

public class AdminDeskService {

	public static List<Patient> getPatients(int currentPage, int recordsPerPage) throws Exception {
		HospitalDAO dao = new HospitalDAO();
		int start = currentPage * recordsPerPage - recordsPerPage;
		return dao.getPatients(start, recordsPerPage);

	}

	public static String createPatient(Patient newPatient) throws Exception {
		HospitalDAO dao = new HospitalDAO();
		return dao.createPatient(newPatient);

	}

	public static Patient getPatient(Long patient_id) throws Exception {
		HospitalDAO dao = new HospitalDAO();
		return dao.getPatient(patient_id);
	}

	public static boolean updatePatient(Patient patient) throws Exception {
		HospitalDAO dao = new HospitalDAO();
		return dao.updatePatient(patient);

	}

	public static boolean deletePatient(Long patient_id) throws Exception {
		HospitalDAO dao = new HospitalDAO();
		return dao.deletePatient(patient_id);
	}

	public static int getNoOfRows(String tableName) throws Exception {
		HospitalDAO dao = new HospitalDAO();
		return dao.getNoOfRows(tableName);
	}

	public static int calculateDays(String patient_date_of_admission) throws ParseException {
		String[] date = patient_date_of_admission.split("-");
		String d = date[0] + '/' + date[1] + '/' + date[2];
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		LocalDateTime now = LocalDateTime.now();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd", Locale.ENGLISH);
		Date firstDate = sdf.parse(d);
		Date secondDate = sdf.parse(dtf.format(now));

		long diffInMillies = Math.abs(secondDate.getTime() - firstDate.getTime());
		long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
		return (int) diff + 1;
	}

	public static boolean updateStatus(Long patient_id) throws Exception {
		HospitalDAO dao = new HospitalDAO();
		return dao.updateStatus(patient_id);
	}

	public static long calculateRoom(int numberOfDays, String type_of_room) {
		int price = 0;
		switch (type_of_room) {
		case "General Ward":
			price = 2000;
			break;
		case "Semi-Sharing":
			price = 4000;
			break;
		case "Single Room":
			price = 8000;
			break;
		}
		return (long) numberOfDays * price;
	}

	public static float calculateMedicine(List<Medicine> medicines) {
		float amount = 0;
		for (Medicine m : medicines) {
			amount = (float) (amount + m.getMedicinePrice() * m.getQuantityIssued());
		}
		return amount;
	}

	public static long calculateTest(List<Test> tests) {
		long amount = 0;
		for (Test t : tests) {
			amount = (long) (amount + t.getTest_charges());
		}
		return amount;
	}

}
