package py.lightsoft.api.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import py.lightsoft.api.dao.OperadoraDAO;
import py.lightsoft.api.model.Operadora;

@RestController
@Transactional
@RequestMapping("/operadoras")
public class OperadoraController {

	@Autowired
	private OperadoraDAO dao;
	
	@RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Operadora>> buscarTodos() {

		// obtemos la lista de productos
		List<Operadora> operadoras = dao.getLista();

		return new ResponseEntity<List<Operadora>>(operadoras, HttpStatus.OK);
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ResponseEntity<Operadora> guardar(@RequestBody Operadora operadora){
		
		dao.guardar(operadora, operadora.getCodigo());
		
		return new ResponseEntity<Operadora>(operadora, HttpStatus.CREATED);
	}
	
	
	
	
}
