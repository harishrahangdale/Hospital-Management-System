package com.hms.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hms.beans.Medicine;
import com.hms.beans.Patient;
import com.hms.beans.User;
import com.hms.utils.DBConnection;
import com.mysql.jdbc.Connection;

public class HospitalDAO {
	public User isValidUser(User user) throws Exception {
		User new_User = null;
		Connection con = (Connection) DBConnection.getConnection();
		String query = "call is_user(?, ?);";
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ps.setString(1, user.getUserName());
		ps.setString(2, user.getPassword());
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			if (rs.getInt(1) != 0)
				new_User = new User(rs.getString(2), null, rs.getString(4), rs.getInt(1));
		}
		DBConnection.closeConnection();
		ps.close();
		return new_User;
	}

	public String createPatient(Patient patient) throws Exception {
		String patient_id = null;
		Connection con = (Connection) DBConnection.getConnection();
		String query = "SELECT * FROM patient WHERE `patient_SSN`= ?;";
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ps.setLong(1, patient.getPatient_SSN());
		ResultSet rs = ps.executeQuery();
		if (rs.next())
			return null;
		query = "INSERT INTO patient(patient_SSN,patient_name, patient_age, type_of_room, address, city, state) VALUES (?, ?, ?, ?, ?, ?, ?);";
		ps = (PreparedStatement) con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
		ps.setLong(1, patient.getPatient_SSN());
		ps.setString(2, patient.getPatient_name());
		ps.setInt(3, patient.getPatient_age());
		ps.setString(4, patient.getType_of_room());
		ps.setString(5, patient.getAddress());
		ps.setString(6, patient.getCity());
		ps.setString(7, patient.getState());
		ps.executeUpdate();
		rs = ps.getGeneratedKeys();
		if (rs.next())
			patient_id = rs.getLong(1) + "";
		DBConnection.closeConnection();
		ps.close();
		return patient_id;

	}

	public Patient getPatient(Long patient_id) throws Exception {
		Patient patient = null;
		Connection con = (Connection) DBConnection.getConnection();
		String query = "SELECT * FROM patient WHERE `patient_id`= ?;";
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ps.setLong(1, patient_id);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			patient = new Patient();
			patient.setPatient_id(patient_id);
			patient.setPatient_name(rs.getString(3));
			patient.setPatient_age(rs.getInt(4));
			patient.setPatient_date_of_admission(rs.getString(5));
			patient.setType_of_room(rs.getString(6));
			patient.setAddress(rs.getString(7));
			patient.setCity(rs.getString(8));
			patient.setState(rs.getString(9));
			patient.setStatus(rs.getString(10));
		}
		DBConnection.closeConnection();
		ps.close();
		return patient;
	}

	public boolean updatePatient(Patient patient) throws Exception {
		Connection con = (Connection) DBConnection.getConnection();
		String query = "UPDATE patient SET patient_name = ?, patient_age=?, type_of_room=?,address =?, city=?, state=? WHERE patient_id = ?;";
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ps.setString(1, patient.getPatient_name());
		ps.setInt(2, patient.getPatient_age());
		ps.setString(3, patient.getType_of_room());
		ps.setString(4, patient.getAddress());
		ps.setString(5, patient.getCity());
		ps.setString(6, patient.getState());
		ps.setLong(7, patient.getPatient_id());
		int row = ps.executeUpdate();
		DBConnection.closeConnection();
		ps.close();
		if (row == 1) {
			return true;
		}
		return false;
	}

	public boolean deletePatient(Long patient_id) throws Exception {
		Connection con = (Connection) DBConnection.getConnection();
		String query = "DELETE FROM patient WHERE patient_id = ?;";
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ps.setLong(1, patient_id);
		int row = ps.executeUpdate();
		DBConnection.closeConnection();
		ps.close();
		if (row == 1) {
			return true;
		}
		return false;
	}

	public List<Patient> getPatients(int start, int recordsPerPage) throws Exception {
		List<Patient> patients = new ArrayList<Patient>();
		Patient patient = null;
		Connection con = (Connection) DBConnection.getConnection();
		String query = "SELECT * FROM patient LIMIT ?,?";
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ps.setInt(1, start);
		ps.setInt(2, recordsPerPage);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			patient = new Patient();
			patient.setPatient_SSN(rs.getLong(1));
			patient.setPatient_id(rs.getLong(2));
			patient.setPatient_name(rs.getString(3));
			patient.setPatient_age(rs.getInt(4));
			patient.setPatient_date_of_admission(rs.getString(5));
			patient.setType_of_room(rs.getString(6));
			patient.setAddress(rs.getString(7));
			patient.setCity(rs.getString(8));
			patient.setState(rs.getString(9));
			patient.setStatus(rs.getString(10));
			patients.add(patient);
		}
		DBConnection.closeConnection();
		ps.close();
		return patients;
	}

	public int getNoOfRows(String tableName) throws Exception {
		int rows = 0;
		Connection con = (Connection) DBConnection.getConnection();
		String query = "SELECT COUNT(patient_id) FROM " + tableName + ";";
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ResultSet rs = ps.executeQuery();
		if (rs.next())
			rows = rs.getInt(1);
		DBConnection.closeConnection();
		ps.close();
		return rows;
	}

	public List<Medicine> getAllMedicinesIssued(Long patient_id) throws Exception {
		List<Medicine> medicines = new ArrayList<Medicine>();
		Medicine medicine = null;
		Connection con = (Connection) DBConnection.getConnection();
		String query = "SELECT medicine_issued.medicine_id,medicine_master.medicine_name,medicine_issued.quantity_issued,medicine_master.price FROM medicine_master INNER JOIN medicine_issued ON medicine_master.medicine_id = medicine_issued.medicine_id WHERE patient_id=?;";
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ps.setLong(1, patient_id);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			medicine = new Medicine();
			medicine.setMedicineId(rs.getInt(1));
			medicine.setMedicineName(rs.getString(2));
			medicine.setQuantityIssued(rs.getInt(3));
			medicine.setMedicinePrice(rs.getFloat(4));
			medicines.add(medicine);
		}
		DBConnection.closeConnection();
		rs.close();
		return medicines;
	}

	public List<Medicine> getAllMedicines() throws Exception {
		List<Medicine> medicines = new ArrayList<Medicine>();
		Medicine medicine = null;
		Connection con = (Connection) DBConnection.getConnection();
		String query = "SELECT medicine_id,medicine_name,price FROM medicine_master; ";
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ResultSet rs = ps.executeQuery();		
		while (rs.next()) {
			medicine = new Medicine();
			medicine.setMedicineId(rs.getInt(1));
			medicine.setMedicineName(rs.getString(2));
			medicine.setMedicinePrice(rs.getFloat(3));
			medicines.add(medicine);
		}
		DBConnection.closeConnection();
		rs.close();
		return medicines;
	}

	public int checkAvailability(int medicineId) throws Exception {
		int Quantity = 0;
		Connection con = (Connection) DBConnection.getConnection();
		String query = "SELECT quantity_available FROM medicine_master WHERE medicine_id =?;";
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ps.setLong(1, medicineId);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			Quantity = rs.getInt(1);
		}
		return Quantity;
	}

	public boolean addMedicine(Long patient_id, int medicineId, int reqQuantity) throws Exception {
		int row = 0;
		Connection con = (Connection) DBConnection.getConnection();
		String query = "call add_medicine(?,?,?);";
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		ps.setLong(1, patient_id);
		ps.setInt(2, medicineId);
		ps.setInt(3, reqQuantity);
		row = ps.executeUpdate();
		DBConnection.closeConnection();
		ps.close();
		if (row == 0)
			return false;
		return true;

	}
}