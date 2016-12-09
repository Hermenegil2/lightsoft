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

import py.lightsoft.api.dao.ProveedorDAO;
import py.lightsoft.api.modeldos.Proveedor;

@RestController
@Transactional
@RequestMapping("/proveedor")
public class ProveedorController {
	@Autowired
	private ProveedorDAO proveedorDAO;
	
											//anotacion que permite cargar los datos
											//al objeto proveedor
	//registra un proveedor
	@RequestMapping(method=RequestMethod.POST,consumes=MediaType.APPLICATION_JSON_VALUE,produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Proveedor> registrar(@RequestBody Proveedor proveedor){
		
		proveedorDAO.guardar(proveedor, proveedor.getId());
		
		return new ResponseEntity<Proveedor>(proveedor, HttpStatus.OK);
	}
	
	//Obtiene la lista de proveedors
	@RequestMapping(method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Proveedor>> buscarTodos(){
		
		//obtemos la lista de proveedors
		List<Proveedor> proveedors= proveedorDAO.getLista();
		
		return new ResponseEntity<List<Proveedor>>(proveedors,HttpStatus.OK);
	}
	//Buscar un proveedor por Id
	@RequestMapping(method=RequestMethod.GET,value="/{id}",consumes=MediaType.APPLICATION_JSON_VALUE,produces=MediaType.APPLICATION_JSON_VALUE)
											//asigna el valor a la variable id	
	public ResponseEntity<Proveedor> buscarPorId(@PathVariable Integer id){
		
		Proveedor proveedorBuscado=proveedorDAO.buscar(id);
	
		
		return new ResponseEntity<Proveedor>(proveedorBuscado,HttpStatus.OK);
	}
	
	//Metodo para eliminar
	
	
	@RequestMapping(method=RequestMethod.DELETE,value="/{id}",consumes=MediaType.APPLICATION_JSON_VALUE,produces=MediaType.APPLICATION_JSON_VALUE)	
	public ResponseEntity<Proveedor> eliminar(@PathVariable Integer id){
		
		Proveedor proveedorAEliminar=proveedorDAO.buscar(id);
		
		if(proveedorAEliminar==null){
			
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		proveedorDAO.eliminar(proveedorAEliminar);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	
	@RequestMapping(method = RequestMethod.POST,value="/eliminar_masivo", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Proveedor>> excluirMasivo(@RequestBody List<Proveedor> proveedores) {
		
		for (Proveedor pro:proveedores) {
			proveedorDAO.eliminar(pro);;
			
		}
		return new ResponseEntity<>( HttpStatus.OK);
	}
	
	
	
	
	
}
