package py.lightsoft.api.controller;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import py.lightsoft.api.dao.ProductoDAO;
import py.lightsoft.api.model.Producto;


@Controller
@Transactional
@RequestMapping("/productos")
@RestController
public class ProductoController {
	
	
	@Autowired
	private ProductoDAO productoDAO;
	
	@RequestMapping(method=RequestMethod.POST,name="saveProducto")
	public ModelAndView save(Producto producto,RedirectAttributes redirectAttributes){
		
		
		productoDAO.guardar(producto, producto.getId());
		redirectAttributes.addFlashAttribute("ok", "Producto registrado con exito");
		return new ModelAndView("redirect:productos");
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView lista(){
		ModelAndView modelAndView=new ModelAndView("/productos/lista");
		modelAndView.addObject("productos", productoDAO.getLista());
		return modelAndView;
	}
	
	
	@RequestMapping("/formulario")
	public ModelAndView formulario(){
		ModelAndView modelAndView=new ModelAndView("/productos/formulario");
		return modelAndView;
	}
	
	@RequestMapping("/listajson")
	public ModelAndView listajson(){
		return new ModelAndView("productos/listajson");
	}
	
	@RequestMapping("/{id}")
	public ModelAndView show(@PathVariable Long id){
		ModelAndView modelAndView=new ModelAndView("productos/show");
		
		Producto producto=productoDAO.buscar(id);
		
	
		modelAndView.addObject("producto", producto);
		
		return modelAndView;
	}
	@RequestMapping(value="eliminar/{id}",name="eliminar")
	public String eliminar(@PathVariable Long id){
		Producto producto=new Producto();
		producto.setId(id);
		productoDAO.eliminar(producto);
	
		return "redirect:/productos";
	}
	
	@RequestMapping(method = RequestMethod.GET,value="json")
	@ResponseBody
	public List<Producto> listJson() {
	return productoDAO.getLista();
	}
	
	@RequestMapping(method=RequestMethod.POST,value="/jsone")
	public ResponseEntity<Producto> update(@RequestBody Producto producto){
		
		System.out.println("Convertido a objeto"+producto.toString());

		productoDAO.guardar(producto, producto.getId());
		
		return new ResponseEntity<Producto>(producto, HttpStatus.OK);
	}
	@RequestMapping(value="/jeliminar",method=RequestMethod.POST)
	public  ResponseEntity<List<Producto>> eliminarmasivo(@RequestBody List<Producto> productos){
		
		System.out.println("LLegue hasta aqui"+productos.toString());
		for (Producto pro:productos) {
			System.out.println(pro.toString());
			productoDAO.eliminar(pro);
			
		}
		
		
		
		return new ResponseEntity<List<Producto>>(productos,HttpStatus.OK);
	}
	
	
	
	
	
	
	
	
	@RequestMapping(method=RequestMethod.GET,value="/jsone")
	public ResponseEntity<Producto> get(){
		Producto pro=new Producto();
		pro.setId(5l);
		pro.setCantidad(43);
		pro.setPrecio(4500d);
		pro.setFechaVencimiento(new Date());
		pro.setDescripcion("Celular");
		
		return new ResponseEntity<Producto>(pro, HttpStatus.OK);
	}
	
	@RequestMapping(value="/form")
	public ModelAndView form(){
		ModelAndView modelAndView=new ModelAndView("productos/form");
		return modelAndView;
	}
}
