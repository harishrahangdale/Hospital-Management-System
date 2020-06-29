package com.hms.beans;

public class Medicine {
	private String medicineName;
	private int medicineId, quantityIssued, quantityAvailable;
	private long patient_id;
	private float medicinePrice;

	@Override
	public String toString() {
		return "Medicine [medicineName=" + medicineName + ", medicineId=" + medicineId + ", quantityIssued="
				+ quantityIssued + ", medicinePrice=" + medicinePrice + ", quantityAvailable=" + quantityAvailable
				+ ", patient_id=" + patient_id + "]";
	}

	public String getMedicineName() {
		return medicineName;
	}

	public void setMedicineName(String medicineName) {
		this.medicineName = medicineName;
	}

	public int getMedicineId() {
		return medicineId;
	}

	public void setMedicineId(int medicineId) {
		this.medicineId = medicineId;
	}

	public int getQuantityIssued() {
		return quantityIssued;
	}

	public void setQuantityIssued(int quantityIssued) {
		this.quantityIssued = quantityIssued;
	}

	public float getMedicinePrice() {
		return medicinePrice;
	}

	public void setMedicinePrice(float medicinePrice) {
		this.medicinePrice = medicinePrice;
	}

	public long getPatient_id() {
		return patient_id;
	}

	public void setPatient_id(long patient_id) {
		this.patient_id = patient_id;
	}

	public int getQuantityAvailable() {
		return quantityAvailable;
	}

	public void setQuantityAvailable(int quantityAvailable) {
		this.quantityAvailable = quantityAvailable;
	}

}
