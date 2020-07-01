package com.hms.beans;

public class Patient {
	private long patient_SSN, patient_id;
	private String patient_name, patient_date_of_admission, type_of_room, address, city, state, status;
	private int patient_age;

	@Override
	public String toString() {
		return "Patient [patient_SSN=" + patient_SSN + ", patient_id=" + patient_id + ", patient_name=" + patient_name
				+ ", patient_date_of_admission=" + patient_date_of_admission + ", type_of_room=" + type_of_room
				+ ", address=" + address + ", city=" + city + ", state=" + state + ", status=" + status
				+ ", patient_age=" + patient_age + "]";
	}

	public long getPatient_SSN() {
		return patient_SSN;
	}

	public void setPatient_SSN(long patient_SSN) {
		this.patient_SSN = patient_SSN;
	}

	public long getPatient_id() {
		return patient_id;
	}

	public void setPatient_id(long patient_id) {
		this.patient_id = patient_id;
	}

	public String getPatient_name() {
		return patient_name;
	}

	public void setPatient_name(String patient_name) {
		this.patient_name = patient_name;
	}

	public String getPatient_date_of_admission() {
		return patient_date_of_admission;
	}

	public void setPatient_date_of_admission(String patient_date_of_admission) {
		this.patient_date_of_admission = patient_date_of_admission;
	}

	public String getType_of_room() {
		return type_of_room;
	}

	public void setType_of_room(String type_of_room) {
		this.type_of_room = type_of_room;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getPatient_age() {
		return patient_age;
	}

	public void setPatient_age(int patient_age) {
		this.patient_age = patient_age;
	}

}
