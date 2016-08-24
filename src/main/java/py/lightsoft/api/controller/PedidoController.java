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

import py.lightsoft.api.dao.PedidoDAO;
import py.lightsoft.api.model.Pedido;

@RestController
@Transactional
@RequestMapping("/pedido")
public class PedidoController {

	@Autowired
	private PedidoDAO pedidoDAO;
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView lista(){
		ModelAndView model=new ModelAndView();
		model.addObject("pedidos",pedidoDAO.getLista());
		
	return model;	
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ResponseEntity<Pedido> registrar(@RequestBody Pedido pedido){
		pedidoDAO.guardar(pedido, pedido.getId());
	return new ResponseEntity<Pedido>(pedido, HttpStatus.OK);	
	}
	
	@RequestMapping(value="/form",method=RequestMethod.GET)
	public ModelAndView form(){
		
		ModelAndView model=new ModelAndView("/pedidos/form");
		
	return model;
		
	}
	
	
	
}
