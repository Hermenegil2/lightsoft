package py.lightsoft.api.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import py.lightsoft.api.dao.ContatoDAO;
import py.lightsoft.api.model.Contato;

@RestController
@Transactional
@RequestMapping("/contatos")
public class ContatoController {

	@Autowired
	private ContatoDAO dao;
	
	@RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Contato>> buscarTodos() {

		// obtemos la lista de productos
		List<Contato> contatos = dao.getLista();

		return new ResponseEntity<List<Contato>>(contatos, HttpStatus.OK);
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
	
	
	// Buscar un producto por Id
		@RequestMapping(method = RequestMethod.GET, value = "/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
		// asigna el valor a la variable id
		public ResponseEntity<Contato> buscarPorId(@PathVariable Integer id) {

			System.out.println("Buscado "+id);
			Contato contatoBuscado = dao.buscar(id);

			System.out.println("Encontrado "+contatoBuscado);
			return new ResponseEntity<Contato>(contatoBuscado, HttpStatus.OK);
		}
	
	
	
}
