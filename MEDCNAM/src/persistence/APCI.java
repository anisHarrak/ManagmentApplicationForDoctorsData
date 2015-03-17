package persistence;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity(name="apci")
public class APCI {
	
	private Long id;
	private String nom;
	private String code;
	private Collection<Facture> factures;
	
	public APCI() {}

	public APCI(Long id) {
		super();
		this.id = id;
	}

	public APCI(Long id, String nom, String code) {
		super();
		this.id = id;
		this.nom = nom;
		this.code = code;
	}
	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	public void setFactures(Collection<Facture> factures) {
		this.factures = factures;
	}

@OneToMany(mappedBy="APCI")
	public Collection<Facture> getFactures() {
		return factures;
	}
	
	

}
