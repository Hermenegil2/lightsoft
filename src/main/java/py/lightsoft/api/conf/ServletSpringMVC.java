package py.lightsoft.api.conf;

import javax.servlet.Filter;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration.Dynamic;
import org.springframework.core.env.AbstractEnvironment;
import org.springframework.orm.jpa.support.OpenEntityManagerInViewFilter;
import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;
public class ServletSpringMVC extends AbstractAnnotationConfigDispatcherServletInitializer {

	
	//Clases a ser cargadas por el contairner del propio Spring
	@Override
	protected Class<?>[] getRootConfigClasses() {
		// TODO Auto-generated method stub
		return new Class[]{AppWebConfiguration.class,JPAConfiguration.class,JPAProductionConfiguration.class};
	}

	
	@Override
	protected Class<?>[] getServletConfigClasses() {
		// Tem que colocar aqui para ser adicionado no carregamento da servlet
		// base
		return new Class[] {};
	}

	//ServletMappings utilizado anteriormente en el web.xml
	@Override
	protected String[] getServletMappings() {
		// TODO Auto-generated method stub
		return new String[] {"/"};
	}
	
	/*Local donde sera almacenado los archivos enviados por el usuario
	en este caso el servidor web decide donde almacenar los archivos temporales
	*/
	@Override
	protected void customizeRegistration(Dynamic registration) {
		//super.customizeRegistration(registration);
		registration.setMultipartConfig(new MultipartConfigElement(""));
		
	}
	

	// Tener habilitado en el EntityManager durante las requisiciones.
	@Override
	protected Filter[] getServletFilters() {
	return new Filter[]{
	new OpenEntityManagerInViewFilter()};
	}

	
	
	//Al iniciar el servidor activamos un profile 
	//para que pueda ser encontrado el DataSource
	
	@Override
	public void onStartup(ServletContext servletContext)
			throws ServletException {
		super.onStartup(servletContext);
		servletContext.addListener(RequestContextListener.class);
		servletContext.setInitParameter(
				AbstractEnvironment.DEFAULT_PROFILES_PROPERTY_NAME, "dev");

	}

	
	
}
