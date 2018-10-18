package com.zgc.tool;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class ConvertDate implements Converter<String, Date> {

	public Date convert(String source) {
		// TODO Auto-generated method stub
		SimpleDateFormat simp=new SimpleDateFormat("yyyy-MM-dd");		
		try {
			return simp.parse(source);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}	
}
