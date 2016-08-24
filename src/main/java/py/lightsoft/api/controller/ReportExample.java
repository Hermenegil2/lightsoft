package py.lightsoft.api.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
//import miaplicacion.beans.reports.Recibo;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.AbstractController;
 
/**
 *
 * @author Quintanar
 */
//@Controller
//public class ReportExample extends AbstractController {
// 
//    @RequestMapping(value = "pdf/recibo", method = RequestMethod.GET)
//    public String reciboPdf(ModelMap modelMap, HttpServletResponse response) {
//        logger.info("exec reciboPdf() .:. RM= pdf/recibo");
//        try {
//            List<Recibo> lista = new ArrayList<Recibo>(1);
//            Recibo recibo = new Recibo();
//            recibo.setMonto("123.34");
//            lista.add(recibo);
//            JRBeanCollectionDataSource jrbean = new JRBeanCollectionDataSource(lista, false);
//            modelMap.put("reciboKey", jrbean);
//            return ("reciboPago");
// 
//        } catch (Exception e) {
//            logger.error("Ocurrio un error al generar el PDF.", e);
//        }
// 
//    }
//}
