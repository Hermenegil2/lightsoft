package py.lightsoft.api.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
public class Usuario {
	@Id
	private String login;
	private String name;
	private String password;
	@OneToMany(mappedBy="usuario")
	private List<Pedido> pedidos;
	@OneToMany(mappedBy="usuario")
	@JsonBackReference
	private List<IngresoGasto> ingresoGastos;
	
	public Usuario() {
	}
	
	
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}


	public List<Pedido> getPedidos() {
		return pedidos;
	}


	public void setPedidos(List<Pedido> pedidos) {
		this.pedidos = pedidos;
	}


	public List<IngresoGasto> getIngresoGastos() {
		return ingresoGastos;
	}


	public void setIngresoGastos(List<IngresoGasto> ingresoGastos) {
		this.ingresoGastos = ingresoGastos;
	}


	@Override
	public String toString() {
		return "Usuario [login=" + login + ", name=" + name + ", password=" + password + ", pedidos=" + pedidos
				+ ", ingresoGastos=" + ingresoGastos + "]";
	}

}
