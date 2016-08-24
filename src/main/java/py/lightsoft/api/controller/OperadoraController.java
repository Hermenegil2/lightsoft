package py.lightsoft.api.controller;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import py.lightsoft.api.dao.OperadoraDAO;
import py.lightsoft.api.model.Operadora;

@RestController
@Transactional
@RequestMapping("/operadoras")
public class OperadoraController {

	@Autowired
	private OperadoraDAO dao;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getLista(){
		
		ModelAndView model=new ModelAndView("");
		
		model.addObject("operadoras", dao.getLista());
		
		return model;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ResponseEntity<Operadora> guardar(@RequestBody Operadora operadora){
		
		dao.guardar(operadora, operadora.getCodigo());
		
		return new ResponseEntity<Operadora>(operadora, HttpStatus.CREATED);
	}
	
	
	
	
}
