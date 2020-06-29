package com.hms.services;

import com.hms.beans.User;
import com.hms.dao.HospitalDAO;

public class Login {

	public User isValidUser(User user) throws Exception {
		HospitalDAO loginDao = new HospitalDAO();
		User currentUser = null;
		currentUser = loginDao.isValidUser(user);
		return currentUser;
	}
}
