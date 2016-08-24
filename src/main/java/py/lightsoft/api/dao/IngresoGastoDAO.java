package py.lightsoft.api.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import py.lightsoft.api.model.IngresoGasto;

@Repository
public class IngresoGastoDAO extends DaoGenerico<IngresoGasto> {

	@PersistenceContext
	private EntityManager em;
	
	public IngresoGastoDAO() {
		
		super(IngresoGasto.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}

	
	
	
}
