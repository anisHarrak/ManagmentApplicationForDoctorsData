package persistence;


import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;



@Entity(name="administrateur")
public class Administrateur {
	
	private Long id;
	private String code_admin;
	
	public Administrateur() {}

	public Administrateur(Long id) {
		super();
		this.id = id;
	}

	public Administrateur(Long id, String codeAdmin) {
		super();
		this.id = id;
		this.code_admin = codeAdmin;
	}
	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCode_admin() {
		return code_admin;
	}

	public void setCode_admin(String codeAdmin) {
		code_admin = codeAdmin;
	}
	
	
	
	

}
