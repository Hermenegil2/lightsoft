package py.lightsoft.api.controller;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import py.lightsoft.api.dao.ClienteDAO;
import py.lightsoft.api.model.Cliente;

@Controller
@Transactional
@RequestMapping("/clientes")
@RestController
public class ClienteController {
	
	@Autowired
	private ClienteDAO clienteDAO;
	
	
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		
//binder.setValidator(new ProductValidator());		
	}
	
	
//	@RequestMapping(method=RequestMethod.POST,name="saveCliente")
//	//@CacheEvict(value="books", allEntries=true)
//	public ModelAndView save(@ModelAttribute("cliente") @Valid Cliente cliente,BindingResult bindingResult,
//			RedirectAttributes redirectAttributes){
//		
//	if(bindingResult.hasErrors()){
//		//return "produtos/form";
//		System.out.println("Encontre algun error");
//		return formulario(cliente);
//	}
//		
//		
//		clienteDAO.guardar(cliente, cliente.getId());
//		redirectAttributes.addFlashAttribute("sucesso","Producto cadastrado con exito");
//		//return "redirect:produtos";
//		return new ModelAndView("redirect:clientes");
//	}
	
	
	
	
	
	@RequestMapping("/formulario")
	public ModelAndView  formulario(Cliente cliente){
ModelAndView modelAndView =new ModelAndView("clientes/formulario");

	return modelAndView;
	}
	
	@RequestMapping("/form")
	public ModelAndView  form(){
ModelAndView modelAndView =new ModelAndView("clientes/form");

	return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView lista(){
		ModelAndView modelAndView =new ModelAndView("clientes/lista");	
		
		modelAndView.addObject("clientes", clienteDAO.getLista());
		
		
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ResponseEntity<Cliente> guardar(@RequestBody Cliente cliente){
		
		System.out.println(cliente.toString());
		clienteDAO.guardar(cliente, cliente.getId());
		
		return new ResponseEntity<Cliente>(cliente, HttpStatus.OK);
	}

	@RequestMapping(method=RequestMethod.POST,name="saveCliente",value="registro")
	//@CacheEvict(value="books", allEntries=true)
	public ModelAndView save(@ModelAttribute("cliente") @Valid Cliente cliente,BindingResult bindingResult,
			RedirectAttributes redirectAttributes){
		
	if(bindingResult.hasErrors()){
		//return "produtos/form";
		System.out.println("Encontre algun error");
		return formulario(cliente);
	}
		
		
		clienteDAO.guardar(cliente, cliente.getId());
		redirectAttributes.addFlashAttribute("sucesso","Producto cadastrado con exito");
		//return "redirect:produtos";
		return new ModelAndView("redirect:clientes");
	}


	
	
	
}
