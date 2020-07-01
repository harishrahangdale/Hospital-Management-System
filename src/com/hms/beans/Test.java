package com.hms.beans;

public class Test {

	private long patient_id;
	private int test_id, test_charges;
	private String test_name;

	@Override
	public String toString() {
		return "Test [patient_id=" + patient_id + ", test_id=" + test_id + ", test_charges=" + test_charges
				+ ", test_name=" + test_name + "]";
	}

	public long getPatient_id() {
		return patient_id;
	}

	public void setPatient_id(long patient_id) {
		this.patient_id = patient_id;
	}

	public int getTest_id() {
		return test_id;
	}

	public void setTest_id(int test_id) {
		this.test_id = test_id;
	}

	public int getTest_charges() {
		return test_charges;
	}

	public void setTest_charges(int test_charges) {
		this.test_charges = test_charges;
	}

	public String getTest_name() {
		return test_name;
	}

	public void setTest_name(String test_name) {
		this.test_name = test_name;
	}

}
