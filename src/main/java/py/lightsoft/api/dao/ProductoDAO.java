package py.lightsoft.api.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import py.lightsoft.api.model.Producto;

@Repository
public  class ProductoDAO extends DaoGenerico<Producto> {

	@PersistenceContext
	private EntityManager em;
	
	public ProductoDAO() {
		super(Producto.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}

	
	
	
}
