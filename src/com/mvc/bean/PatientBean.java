package com.mvc.bean;

public class PatientBean
{
	private int ID, SSNID, Age;
	
	private String Name, DateOfAdmission, Address, City, State, TypeOfBed, Status;
	
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		this.ID = iD;
	}
	public int getSSNID() {
		return SSNID;
	}
	public void setSSNID(int sSNID) {
		this.SSNID = sSNID;
	}
	public int getAge() {
		return Age;
	}
	public void setAge(int age) {
		this.Age = age;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		this.Name = name;
	}
	public String getDateOfAdmission() {
		return DateOfAdmission;
	}
	public void setDateOfAdmission(String dateOfAdmission) {
		this.DateOfAdmission = dateOfAdmission;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		this.Address = address;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		this.City = city;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		this.State = state;
	}
	public String getTypeOfBed() {
		return TypeOfBed;
	}
	public void setTypeOfBed(String typeOfBed) {
		this.TypeOfBed = typeOfBed;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		this.Status = status;
	}
}