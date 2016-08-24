package py.lightsoft.api.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	
	@RequestMapping("/")
	public ModelAndView index(){
		
		System.out.println("Ingrese en el inicio");
		ModelAndView modelAndView =new ModelAndView("/inicio/index");
				return modelAndView;	
	}
	
	@RequestMapping("/login")
	public ModelAndView login(){
ModelAndView modelAndView =new ModelAndView("auth/login");
				return modelAndView;	
	}
	
	
	@RequestMapping(value="pantalla_informe",method=RequestMethod.GET)
	public ModelAndView getPantallaInforme(){
		ModelAndView model=new ModelAndView("/inicio/pantalla_informe");
		
		
		
		return model;
	}
	
	
//	@RequestMapping("/form")
//	public ModelAndView  form(Product product){
//ModelAndView modelAndView =
//	new ModelAndView("products/form");
//	modelAndView.addObject("types", BookType.values());
//	return modelAndView;
//	}

}
