package py.lightsoft.api.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class ItemPedido {
	@Id
	@GeneratedValue
	private Long id;
	private int cantidadPedido;
	private double subTotal;
	@ManyToOne
	private Pedido pedido;
	@ManyToOne
	private Producto producto;
	
	public ItemPedido() {
		super();
		producto=new Producto();
		pedido=new Pedido();
		
	}
	
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public int getCantidadPedido() {
		return cantidadPedido;
	}
	public void setCantidadPedido(int cantidadPedido) {
		this.cantidadPedido = cantidadPedido;
	}
	public double getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(double subTotal) {
		this.subTotal = subTotal;
	}


	public Pedido getPedido() {
		return pedido;
	}


	public void setPedido(Pedido pedido) {
		this.pedido = pedido;
	}


	public Producto getProducto() {
		return producto;
	}


	public void setProducto(Producto producto) {
		this.producto = producto;
	}


	@Override
	public String toString() {
		return "ItemPedido [id=" + id + ", cantidadPedido=" + cantidadPedido + ", subTotal=" + subTotal + ", pedido="
				+ pedido + ", producto=" + producto + "]";
	}

	
	
	

}
