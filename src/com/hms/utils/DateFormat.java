package com.hms.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;

public class DateFormat {

	public static String formatedDate(String actualDate) throws ParseException {

		SimpleDateFormat month_date = new SimpleDateFormat("MMMM yyyy", Locale.ENGLISH);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date = sdf.parse(actualDate);
		String month_name = month_date.format(date);
		SimpleDateFormat d = new SimpleDateFormat("dd", Locale.ENGLISH);
		String dd = d.format(date);
		return dd + " " + month_name;

	}

	public static String today() {
		java.util.Date date = new java.util.Date();
		SimpleDateFormat DateFor = new SimpleDateFormat("yyyy-MM-dd");
		String today = DateFor.format(date);
		return today;
	}

}