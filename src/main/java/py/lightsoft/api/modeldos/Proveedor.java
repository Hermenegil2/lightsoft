package py.lightsoft.api.modeldos;

import javax.persistence.Entity;

@Entity
public class Proveedor extends General{

	private String nombre;

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	
}
