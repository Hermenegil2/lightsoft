package py.lightsoft.api.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import py.lightsoft.api.model.Contato;

@Repository
public class ContatoDAO extends DaoGenerico<Contato> {

	@PersistenceContext
	private EntityManager em;
	
	public ContatoDAO() {
		
		super(Contato.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}

	
	
	
}
