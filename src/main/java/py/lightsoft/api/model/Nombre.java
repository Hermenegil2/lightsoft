package py.lightsoft.api.model;

import javax.persistence.MappedSuperclass;

import py.lightsoft.api.modeldos.General;

@MappedSuperclass
public abstract class Nombre extends General {
	
	private String nombre;

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	

}
