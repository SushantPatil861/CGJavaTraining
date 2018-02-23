package com.cg.assetmanagement.dto;

import java.sql.Date;
import java.time.LocalDate;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;
@Converter
public class LocalDateConverter implements AttributeConverter<LocalDate, Date> {

	@Override
	public Date convertToDatabaseColumn(LocalDate arg0) {
		if (arg0 == null) {
			return null;
		} else {
			return Date.valueOf(arg0);
		}
	}

	@Override
	public LocalDate convertToEntityAttribute(Date arg0) {
		if (arg0 == null) {
			return null;
		} else {
			return arg0.toLocalDate();
		}
	}

}
