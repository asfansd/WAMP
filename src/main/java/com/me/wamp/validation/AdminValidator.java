package com.me.wamp.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.me.wamp.pojo.User;

public class AdminValidator implements Validator {
	@Override
    public boolean supports(Class<?> type) {
        return User.class.isAssignableFrom(type);        
    }

    @Override
    public void validate(Object o, Errors errors) {
        
    }
}
