package py.lightsoft.api.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import py.lightsoft.api.dao.ContatoDAO;
import py.lightsoft.api.dao.OperadoraDAO;
import py.lightsoft.api.model.Contato;
import py.lightsoft.api.model.Operadora;

@RestController
@Transactional
@RequestMapping("/contatos")
public class ContatoController {

	@Autowired
	private ContatoDAO dao;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getLista(){
		
		ModelAndView model=new ModelAndView("");
		
		model.addObject("contatos", dao.getLista());
		
		return model;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ResponseEntity<Contato> guardar(@RequestBody Contato contato){
		
		dao.guardar(contato, contato.getId());
		
		return new ResponseEntity<Contato>(contato, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/eliminar",method=RequestMethod.POST)
	public ResponseEntity<List<Contato>> eliminar(@RequestBody List<Contato> contatos){
		
		for(Contato con:contatos){
			dao.eliminar(con);
		}
		
		
	return new ResponseEntity<List<Contato>>(contatos, HttpStatus.OK);
	}
	
	
	
	
}
