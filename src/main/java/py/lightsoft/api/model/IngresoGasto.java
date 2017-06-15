package py.lightsoft.api.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
public class IngresoGasto {
	@Id
	@GeneratedValue
	private Integer id;
	private Double monto;
	private Date fechaIngreso;
	
	private String observacion;
	
	
	@ManyToOne
//	@JsonManagedReference
	private DescripcionIG descripcionIG;
	
	@ManyToOne
	private Usuario usuario;
	
	public IngresoGasto() {
//		descripcionIG=new DescripcionIG();
//		usuario=new Usuario();
	
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	

	public Double getMonto() {
		return monto;
	}

	public void setMonto(Double monto) {
		this.monto = monto;
	}

	public Date getFechaIngreso() {
		return fechaIngreso;
	}

	public void setFechaIngreso(Date fechaIngreso) {
		this.fechaIngreso = fechaIngreso;
	}

	
	
	
	
	public DescripcionIG getDescripcionIG() {
		return descripcionIG;
	}

	public void setDescripcionIG(DescripcionIG descripcionIG) {
		this.descripcionIG = descripcionIG;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String getObservacion() {
		return observacion;
	}

	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}

	
	
//	@Override
//	public String toString() {
//		return "IngresoGasto [id=" + id + ", monto=" + monto + ", fechaIngreso=" + fechaIngreso + ", descripcionIG="
//				+ descripcionIG + ", usuario=" + usuario + "]";
//	}





	
	
	
}
