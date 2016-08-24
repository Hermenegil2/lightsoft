package py.lightsoft.api.validation;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import py.lightsoft.api.model.Cliente;

public class ClienteValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return Cliente.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "celular", "fiel.required");
		
		Cliente cliente=(Cliente) target;
		
		if(cliente.getNombre().length()<2){
		
	errors.rejectValue("nombre", "field.required");		
		}
		
	}
	
	

}
