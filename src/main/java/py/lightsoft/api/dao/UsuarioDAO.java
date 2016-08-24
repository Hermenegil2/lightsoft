package py.lightsoft.api.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import py.lightsoft.api.model.Usuario;

@Repository
public class UsuarioDAO extends DaoGenerico<Usuario> {

	@PersistenceContext
	private EntityManager em;
	
	public UsuarioDAO() {
		
		super(Usuario.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}

	
	
	
}
