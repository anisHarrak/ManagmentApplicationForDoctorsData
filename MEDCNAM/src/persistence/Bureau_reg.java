package persistence;

import java.util.Collection;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import javax.persistence.OneToMany;


@Entity(name="bureau_reg")
public class Bureau_reg {
	
	private Long id;
	private String nom_bureau;
	private String adresse;
	private String num_tel;	
	private String num_fax;
	private Collection<Medecin> medecins;
	
	
	public Bureau_reg() {}
	public Bureau_reg(Long id) {
		super();
		this.id = id;
	}


	public Bureau_reg(Long id, String nomBureau, String adresse, String numTel,
			String numFax) {
		super();
		this.id = id;
		this.nom_bureau = nomBureau;
		this.adresse = adresse;
		this.num_tel = numTel;
		this.num_fax = numFax;
	}
	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	

	public String getNom_bureau() {
		return nom_bureau;
	}

	public void setNom_bureau(String nom_bureau) {
		this.nom_bureau = nom_bureau;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getNum_tel() {
		return num_tel;
	}

	public void setNum_tel(String numTel) {
		num_tel = numTel;
	}
	public String getNum_fax() {
		return num_fax;
	}
	public void setNum_fax(String numFax) {
		num_fax = numFax;
	}
public void setMedecins(Collection<Medecin> medecins) {
	this.medecins = medecins;
}

@OneToMany(mappedBy="bureau_reg")
public Collection<Medecin> getMedecins() {
	return medecins;
}
	
	

}
