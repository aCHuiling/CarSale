package com.zgc.tool;

import org.springframework.core.convert.converter.Converter;

public class ConvertDouble implements Converter<String, Double> {

	public Double convert(String resource) {
		// TODO Auto-generated method stub
		return resource==null?0:(resource.equals("")?0:Double.parseDouble(resource));
		
	}

	
}
