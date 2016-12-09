package py.lightsoft.api.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import py.lightsoft.api.modeldos.Proveedor;


@Repository
public class ProveedorDAO extends DaoGenerico<Proveedor> {
	@PersistenceContext
	private  EntityManager em;

	public ProveedorDAO() {
		super(Proveedor.class);
		}
	

	@Override
	protected EntityManager getEntityManager() {
		return this.em;
	}


	
}






