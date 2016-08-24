package py.lightsoft.api.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;

public class GenerarPdf implements Controller {
	 
    JasperReport jasperReport;
    JasperPrint jasperPrint;
    
    @Autowired
    private DataSource ds;
 
   // protected final Log logger = LogFactory.getLog(getClass());
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, JRException {
 
     //   logger.info("Generando Reporte.");
    	
    	String path = request.getSession().getServletContext().getRealPath("").toString();
    	System.out.println("Lugar: "+path);
    	File fichero = new File(path + "/directorio/..." +"reportes/reporteIngreso.jrxml");
 
        jasperReport = JasperCompileManager.compileReport("reportes/reporteIngreso.jrxml");
        Map parametros = new HashMap();
        //parametros.put("usuario", "Usuario");
        //parametros.put("contrasena", "Contraseña");
        byte[] reporte = null;
 
        try {
            reporte = JasperRunManager.runReportToPdf(jasperReport, parametros, ds.getConnection());
        } catch (SQLException ex) {
       //     logger.error("Error generando Reporte.");
            ex.printStackTrace();
        }
        response.setContentType("application/pdf");
        response.setHeader("Content-disposition", "inline; filename=informeDemo.pdf");
        response.setHeader("Cache-Control", "max-age=30");
        response.setHeader("Pragma", "No-cache");
        response.setDateHeader("Expires", 0);
        response.setContentLength(reporte.length);
        ServletOutputStream out = response.getOutputStream();
        out.write(reporte, 0, reporte.length);
        out.flush();
        out.close();
 
        return new ModelAndView("index");
    }
 
    public void setDataSource(DataSource dataSource) {
        this.ds = dataSource;
    }
}