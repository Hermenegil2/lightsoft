package py.lightsoft.api.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import py.lightsoft.api.model.DescripcionIG;

@Repository
public class DescripcionIGDAO extends DaoGenerico<DescripcionIG> {

	@PersistenceContext
	private EntityManager em;
	
	public DescripcionIGDAO() {
		
		super(DescripcionIG.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}

	
	
	
}
