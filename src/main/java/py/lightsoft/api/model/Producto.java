package py.lightsoft.api.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
public class Producto {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@Column(length=100,nullable=false,unique=true)
	private String descripcion;
//	@DateTimeFormat(iso=ISO.DATE)
	private Date fechaVencimiento;
	//Tendra 6 digitos y solo 2 decimales
	//@Column(precision=6,scale=2)
	private Double precio;
	private Integer cantidad;
	//@JsonIgnore
	@JsonBackReference
	@OneToMany(mappedBy="producto")
	private List<ItemPedido> itempedidos;
	
	
	public Producto() {
		itempedidos=new ArrayList<>();
	
	}
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public Double getPrecio() {
		return precio;
	}
	public void setPrecio(Double precio) {
		this.precio = precio;
	}
	public Integer getCantidad() {
		return cantidad;
	}
	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}
	public Date getFechaVencimiento() {
		return fechaVencimiento;
	}
	public void setFechaVencimiento(Date fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
	}


	public List<ItemPedido> getItempedidos() {
		return itempedidos;
	}


	public void setItempedidos(List<ItemPedido> itempedidos) {
		this.itempedidos = itempedidos;
	}


	@Override
	public String toString() {
		return "Producto [id=" + id + ", descripcion=" + descripcion + ", fechaVencimiento=" + fechaVencimiento
				+ ", precio=" + precio + ", cantidad=" + cantidad + ", itempedidos=" + itempedidos + "]";
	}

	

}
