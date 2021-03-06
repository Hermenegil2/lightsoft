package py.lightsoft.api.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import py.lightsoft.api.model.Pedido;
import py.lightsoft.api.model.Producto;

@Repository
public class PedidoDAO extends DaoGenerico<Pedido> {

	@PersistenceContext
	private EntityManager em;
	
	public PedidoDAO() {
		super(Pedido.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}

	
	
	
}
