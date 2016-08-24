package py.lightsoft.api.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.jasperreports.JasperReportsMultiFormatView;
import org.springframework.web.servlet.view.jasperreports.JasperReportsPdfView;
import org.springframework.web.servlet.view.jasperreports.JasperReportsViewResolver;

import com.fasterxml.jackson.annotation.JsonIgnoreType;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import py.lightsoft.api.dao.IngresoGastoDAO;
import py.lightsoft.api.model.IngresoGasto;
@Controller
@RestController
@Transactional
@RequestMapping("/ingresogastos")
public class IngresoGastoController {
	
	   private static final String FILE_FORMAT = "format";

	    private static final String DATASOURCE = "dev";

	@Autowired
	private IngresoGastoDAO ingresoGastoDao;
	
	@Autowired
	private DataSource dataSource;
	

	@Autowired @Qualifier("helloWorldReport2")
	private JasperReportsPdfView helloReport;
	
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView getIngresoGasto(){
		ModelAndView model=new ModelAndView();
		System.out.println(ingresoGastoDao.getLista());
		
		model.addObject("ingresoGastos",ingresoGastoDao.getLista());
		return model;
	}
	@RequestMapping(method=RequestMethod.POST)
	public ResponseEntity<IngresoGasto> registrar(@RequestBody IngresoGasto ingresoGasto){
		
		System.out.println(ingresoGasto);
		ingresoGastoDao.guardar(ingresoGasto, ingresoGasto.getId());
		
		
		return new ResponseEntity<IngresoGasto>(ingresoGasto, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/form",method=RequestMethod.GET)
	public ModelAndView form(){
		ModelAndView model=new ModelAndView("/ingresogastos/form");
		
		return model;
	}
	
	
	@RequestMapping(value="eliminarMasivo",method=RequestMethod.POST)
	public ResponseEntity<List<IngresoGasto>> eliminarMasivo(@RequestBody List<IngresoGasto> ingresos){
		
		for (IngresoGasto i:ingresos) {
			
			ingresoGastoDao.eliminar(i);
		}
		
		
		return new ResponseEntity<List<IngresoGasto>>(ingresos, HttpStatus.OK);
	}
	
	@RequestMapping(value="/reporte", method=RequestMethod.GET)
	  @ResponseBody
	  public void getRpt1(HttpServletResponse response,HttpServletRequest req) throws JRException, IOException, SQLException {
		
		String path = req.getSession().getServletContext().getRealPath("").toString();
    	System.out.println("Lugar: "+path);
    	File fichero = new File(path + "/"+"reportes/reporteIngreso.jasper");
    	System.out.println("Fichero"+fichero.getAbsolutePath());
		
		System.out.println("locaciion"+this.getClass().getResourceAsStream("/reportes/reporteIngreso.jasper"));
	   InputStream jasperStream = this.getClass().getResourceAsStream("/reportes/reporteIngreso.jasper");
	   Map<String,Object> params = new HashMap();
	   
	   
	   //Ver la forma de cargar el reporte
	//   JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jasperStream);
	   
	  // JasperReport jasperReport=JasperCompileManager.compileReport(fichero.getAbsolutePath());
	  
	   JasperReport jasperReport = (JasperReport) JRLoader.loadObject(fichero);
	   
	   JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource.getConnection());//

	    response.setContentType("application/x-pdf");
	    response.setHeader("Content-disposition", "inline; filename=helloWorldReport.pdf");

	    final java.io.OutputStream outStream = response.getOutputStream();
	    JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);
	  }
	
	
	

	@RequestMapping(value = "/helloReport2", method = RequestMethod.GET)
	public ModelAndView getRpt2(ModelMap modelMap,ModelAndView modelAndView) throws SQLException {
		modelMap.put("dev", dataSource);
		  modelMap.put("format", "pdf");
		
		
	  Map<String, Object> parameterMap = new HashMap<>();
	  parameterMap.put("dev", dataSource);//
	  modelAndView = new ModelAndView(helloReport,modelMap);
	  return modelAndView;
	}
	
	@RequestMapping(value="helloReport4", method = RequestMethod.GET)
	public ModelAndView getRpt4(ModelMap modelMap, ModelAndView modelAndView) {//, ModelAndView modelAndView
	  modelMap.put("dev", dataSource);
	  modelMap.put("format", "xls");
 modelAndView = new ModelAndView("reporteIngreso", modelMap);
	  return modelAndView;
	}
	
	//,headers ="Accept=application/json"
	//@PathVariable("reportname")final String reportname, {reportname} headers = {"content-type=application/json"}
	 
	@RequestMapping(value="{reportname}", method=RequestMethod.GET)
	    public  ModelAndView getRptByParam(
	    		@PathVariable("reportname")final String reportname,
	    		@RequestParam(value="format",required=false)
	    final String format, @RequestParam(value="fecha_inicio",required=false)
	    final Date fecha_inicio,@RequestParam(value="fecha_fin",required=false) final Date fecha_fin) {
		
	ModelMap modelMap=new ModelMap();
	        modelMap.put("dev", dataSource);
	        modelMap.put("format",format);
	        modelMap.put("fecha_inicio", fecha_inicio);
	        modelMap.put("fecha_fin", fecha_fin);
	        
	        System.out.println("Fecha Inicio "+fecha_inicio);
	        System.out.println("Fecha Fin "+fecha_fin );
	        
	      //  Map<String, Object> parameterMap = new HashMap<>();
	  	 // parameterMap.put("dev", dataSource);//
	        
	        
	        
	     ModelAndView   modelAndView=new ModelAndView();
	     //modelAndView.clear();
	     //modelAndView.setView(new JasperReportsMultiFormatView());
	  //   modelAndView=new ModelAndView(new JasperReportsMultiFormatView(),modelMap);
	        modelAndView = new ModelAndView(reportname, modelMap);
	        
	       // System.out.println(modelAndView.getViewName());
	      // System.out.println(modelAndView.getView().getContentType());
	        
	       // response.setContentType("text/html");
	        
	        
	        return modelAndView;
	    }
	//{report2}?format={format}&id={id}&reportname=report2.jasper
	 //{report2}?format=pdf&id={id}&reportname=report2
	 
	 
	 /*@RequestMapping(value="{reportname}", method=RequestMethod.GET)
	    public ModelAndView getRptByParam(final ModelMap modelMap, ModelAndView modelAndView, @PathVariable("reportname")
	    final String reportname, @RequestParam("format")
	    final String format, @RequestParam("fecha_inicio")
	    final Date fecha_inicio,@RequestParam("fecha_fin") final Date fecha_fin) {
		 System.out.println("El formato es"+format);

	        List<String> paramMap = new ArrayList<>();
	      //  paramMap.add(id);
	        // connecting to mysql
	        modelMap.put("dev", dataSource);
	        modelMap.put("format",format);
	        modelMap.put("fecha_inicio", fecha_inicio);
	        modelMap.put("fecha_fin", fecha_fin);
	        
	        System.out.println("Fecha Inicio "+fecha_inicio);
	        System.out.println("Fecha Fin "+fecha_fin );
	        
	      //  Map<String, Object> parameterMap = new HashMap<>();
	  	 // parameterMap.put("dev", dataSource);//
	        
	        
	        
	        modelAndView = new ModelAndView(reportname, modelMap);
	        return modelAndView;
	    }*/
	
}
