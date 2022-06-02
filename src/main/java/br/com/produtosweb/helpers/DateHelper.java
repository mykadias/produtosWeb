package br.com.produtosweb.helpers;


import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class DateHelper {
	
	public static String formatToString(Date data) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");
		return sdf.format(data);

	}
	
	public static Date formatToDate(String data) {

		int ano = Integer.parseInt(data.substring(0, 4));
		int mes = Integer.parseInt(data.substring(5, 7));
		int dia = Integer.parseInt(data.substring(8, 10));

		Calendar calendar = new GregorianCalendar(ano, mes - 1, dia);
		return calendar.getTime();

	}
}
