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

import py.lightsoft.api.dao.DescripcionIGDAO;
import py.lightsoft.api.model.DescripcionIG;

@RestController
@Transactional
@RequestMapping("/descripcionigs")
public class DescripcionIGController {
	@Autowired
	private DescripcionIGDAO descripcionIGDAO;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView lista(){
		
		ModelAndView model=new ModelAndView();
		model.addObject("descripcion",descripcionIGDAO.getLista());
		
		return model;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ResponseEntity<DescripcionIG> registrar(@RequestBody DescripcionIG descripcionIG){
		
		descripcionIGDAO.guardar(descripcionIG, descripcionIG.getId());
		
		return new ResponseEntity<DescripcionIG>(descripcionIG, HttpStatus.CREATED);
		
	}
	
	@RequestMapping(value="/form",method=RequestMethod.GET)
	public ModelAndView form(){
		
		ModelAndView model=new ModelAndView("/descripcionigs/form");
		
		return model;
	}
	
	@RequestMapping(value="/eliminar",method=RequestMethod.POST)
	public ResponseEntity<DescripcionIG> eliminar(@RequestBody DescripcionIG descripcionIG){
		
		descripcionIGDAO.eliminar(descripcionIG);
		
		return new ResponseEntity<DescripcionIG>(descripcionIG,HttpStatus.OK);
	}
	
	
	
	
	
	
	

}
