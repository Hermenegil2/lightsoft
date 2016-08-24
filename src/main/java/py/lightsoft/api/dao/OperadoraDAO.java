package py.lightsoft.api.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import py.lightsoft.api.model.Operadora;

@Repository
public class OperadoraDAO extends DaoGenerico<Operadora> {

	@PersistenceContext
	private EntityManager em;
	
	public OperadoraDAO() {
		
		super(Operadora.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}

	
	
	
}
