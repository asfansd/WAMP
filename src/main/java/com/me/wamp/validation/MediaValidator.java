package com.me.wamp.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.me.wamp.pojo.Media;

public class MediaValidator implements Validator {
	@Override
    public boolean supports(Class<?> type) {
        return Media.class.isAssignableFrom(type);        
    }

    @Override
    public void validate(Object o, Errors errors) {
        
    }
}
