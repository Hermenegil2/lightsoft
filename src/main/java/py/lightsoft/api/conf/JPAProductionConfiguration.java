package py.lightsoft.api.conf;

import java.net.URI;
import java.net.URISyntaxException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Profile;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Profile("prod")
public class JPAProductionConfiguration {
	
	   @Autowired
	   private Environment environment;
	
	   @Bean	   
	   public DataSource dataSource() throws URISyntaxException{
	      DriverManagerDataSource dataSource = new DriverManagerDataSource();
	      dataSource.setDriverClassName("org.postgresql.Driver");
	      URI dbUrl = new URI(environment.getProperty("DATABASE_URL"));
		  dataSource.setUrl("jdbc:postgresql://" + dbUrl.getHost() + ":" + dbUrl.getPort() + dbUrl.getPath());
		  dataSource.setUsername(dbUrl.getUserInfo().split(":")[0]);
		  dataSource.setPassword(dbUrl.getUserInfo().split(":")[1]);
		  
	      
	      
	      System.out.println("Ingrese en modo de produccion en la pc de Magno Portillo");
//		  dataSource.setUrl("postgres://wqckckvvegdzog:6t6X_k6aLGKUgEbAqF-8WR-qwQ@ec2-54-221-201-165.compute-1.amazonaws.com:5432/de6j76rhamlv2g");
//		  dataSource.setUsername("wqckckvvegdzog");
//		  dataSource.setPassword("6t6X_k6aLGKUgEbAqF-8WR-qwQ");
	    return dataSource;
	   }	
}
