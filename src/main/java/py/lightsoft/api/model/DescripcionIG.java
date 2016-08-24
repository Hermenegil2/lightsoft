package py.lightsoft.api.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
public class DescripcionIG {
	@Id
	@GeneratedValue
	private Integer id;
	private String descripcion;
	private String tipo;
	private String observacion;
	
	@OneToMany(mappedBy="descripcionIG")
	@JsonBackReference
	private List<IngresoGasto> ingresoGastos;
	
	public DescripcionIG() {
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getObservacion() {
		return observacion;
	}

	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}

	

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public List<IngresoGasto> getIngresoGastos() {
		return ingresoGastos;
	}

	public void setIngresoGastos(List<IngresoGasto> ingresoGastos) {
		this.ingresoGastos = ingresoGastos;
	}

	@Override
	public String toString() {
		return "DescripcionIG [id=" + id + ", descripcion=" + descripcion + ", tipo=" + tipo + ", observacion="
				+ observacion + ", ingresoGastos=" + ingresoGastos + "]";
	}

}
