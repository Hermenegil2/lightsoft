package py.lightsoft.api.conf;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.guava.GuavaCacheManager;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.format.datetime.DateFormatterRegistrar;
import org.springframework.format.support.DefaultFormattingConversionService;
import org.springframework.format.support.FormattingConversionService;
import org.springframework.web.accept.ContentNegotiationManager;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.jasperreports.JasperReportsMultiFormatView;
import org.springframework.web.servlet.view.jasperreports.JasperReportsPdfView;
import org.springframework.web.servlet.view.jasperreports.JasperReportsViewResolver;

import com.google.common.cache.CacheBuilder;

import py.lightsoft.api.controller.HomeController;
import py.lightsoft.api.dao.ClienteDAO;
import py.lightsoft.api.viewresolver.JsonViewResolver;


//Revisar ..recien realize el extends ??

@Configuration
@EnableWebMvc
@ComponentScan(basePackageClasses={HomeController.class,ClienteDAO.class})
@EnableCaching
public class AppWebConfiguration extends WebMvcConfigurerAdapter {
	
	@Autowired
	private DataSource dataSource;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LocaleChangeInterceptor());
	}
	
	@Bean
	public LocaleResolver localeResolver(){
		return new CookieLocaleResolver();
	}
	
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
	
//	@Bean
//	public InternalResourceViewResolver internalResourceViewResolver() {
//	InternalResourceViewResolver resolver =new InternalResourceViewResolver();
//	resolver.setPrefix("/WEB-INF/views/");
//	resolver.setSuffix(".jsp");
//	return resolver;
//	}
	
	@Bean(name="messageSource")
	public MessageSource messageSource(){
	ReloadableResourceBundleMessageSource bundle =new ReloadableResourceBundleMessageSource();
	bundle.setBasename("/WEB-INF/messages");
	bundle.setDefaultEncoding("UTF-8");
	bundle.setCacheSeconds(1);
	return bundle;
	}
	
	//para que la configuracion siempre sea realizada con este formato de fecha
	@Bean
	public FormattingConversionService mvcConversionService() {
	DefaultFormattingConversionService conversionService =
	new DefaultFormattingConversionService(true);
	DateFormatterRegistrar registrar =
	new DateFormatterRegistrar();
	registrar.setFormatter(new DateFormatter("yyyy-MM-dd"));
	registrar.registerFormatters(conversionService);
	return conversionService;
	}
	
	//A interface MultipartResolver � a que define os m�todos necess�rios
	//para o tratamento inicial de um request cujo modo de envio,
	@Bean
	public MultipartResolver multipartResolver(){
	return new StandardServletMultipartResolver();
	}
	
	@Bean
	public JasperReportsViewResolver getJasperReportsViewResolver() {
	  JasperReportsViewResolver resolver = new JasperReportsViewResolver();
	  resolver.setPrefix("classpath:/reportes/");
	  resolver.setSuffix(".jasper");
	  resolver.setReportDataKey("dev");//datasource
	  resolver.setViewNames("report*");//rpt_*
	  resolver.setViewClass(JasperReportsMultiFormatView.class);
	  resolver.setOrder(0);
	  return resolver;
	} 
	
	
	@Bean
	public InternalResourceViewResolver
	internalResourceViewResolver() {
	InternalResourceViewResolver resolver =
	new InternalResourceViewResolver();
	resolver.setPrefix("/WEB-INF/views/");
	resolver.setSuffix(".jsp");
	resolver.setOrder(1);
	//passamos o exato nome da classe que será registrada
	//resolver.setExposedContextBeanNames("shoppingCart");
	return resolver;
	}
	
	
	@Bean
	public RestTemplate restTemplate(){
	return new RestTemplate();
	}
	
//	@Bean
//	public CacheManager cacheManager(){
//	return new ConcurrentMapCacheManager();
//	}
//	
	@Bean
	public CacheManager cacheManager() {
	CacheBuilder<Object, Object> builder =
	CacheBuilder.newBuilder()
	.maximumSize(100)
	.expireAfterAccess(5, TimeUnit.MINUTES);
	GuavaCacheManager cacheManager = new GuavaCacheManager();
	cacheManager.setCacheBuilder(builder);
	return cacheManager;
	}
	
	@Bean
	public ViewResolver contentNegotiatingViewResolver(
	ContentNegotiationManager manager) {
	List<ViewResolver> resolvers =new ArrayList<ViewResolver>();
	resolvers.add(internalResourceViewResolver());
	resolvers.add(getJasperReportsViewResolver());
	resolvers.add(new JsonViewResolver());
	
	ContentNegotiatingViewResolver resolver =
	new ContentNegotiatingViewResolver();
	resolver.setViewResolvers(resolvers);

	resolver.setContentNegotiationManager(manager);
	return resolver;
	}
	
	
//	@Bean
//	public MailSender mailSender() {
//	JavaMailSenderImpl javaMailSenderImpl =
//	new JavaMailSenderImpl();
//	javaMailSenderImpl.setHost("smtp.gmail.com");
//	javaMailSenderImpl.setPassword("daniel456");
//	javaMailSenderImpl.setPort(587);
//	javaMailSenderImpl.setUsername("magzoaa@gmail.com");
//	Properties mailProperties = new Properties();
//	mailProperties.put("mail.smtp.auth", true);
//	mailProperties.put("mail.smtp.starttls.enable", true);
//	javaMailSenderImpl.setJavaMailProperties(mailProperties);
//	return javaMailSenderImpl;
//	}
	
	@Bean @Qualifier("helloWorldReport2")
	public JasperReportsPdfView getHelloWorldReport() {
		
		//JasperReportsMultiFormatView z=new JasperReportsMultiFormatView();
	  JasperReportsPdfView v = new JasperReportsPdfView();
	  v.setUrl("classpath:reportes/report2.jasper");
	 
	  v.setReportDataKey("dev");//datasource
	  v.setJdbcDataSource(dataSource);
	 
	  return v;
	}
	
		
	

}
