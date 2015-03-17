package persistence;

import java.util.Collection;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;


@Entity(name="medecin")
public class Medecin {
	
	private Long id;
	private String code_conventionnel ;
	private String nom;
	private String prenom;
	private String adresse;
	private String num_tel;	
	private Bureau_reg bureau_reg;
	private Collection<Decompte> decomptes;
	
	public Medecin() {}

	public Medecin(Long id) {
		super();
		this.id = id;
	}

	public Medecin(Long id, String codeConventionnel, String nom, String prenom,
			String adresse, String numTel) {
		super();
		this.id = id;
		this.code_conventionnel = codeConventionnel;
		this.nom = nom;
		this.prenom = prenom;
		this.adresse = adresse;
		this.num_tel = numTel;
	}

	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCode_conventionnel() {
		return code_conventionnel;
	}

	public void setCode_conventionnel(String codeConventionnel) {
		code_conventionnel = codeConventionnel;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
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
	public void setBureau_reg(Bureau_reg bureau_reg) {
		this.bureau_reg = bureau_reg;
	}
@ManyToOne
	public Bureau_reg getBureau_reg() {
		return bureau_reg;
	}
	
public void setDecomptes(Collection<Decompte> decomptes) {
	this.decomptes = decomptes;
}

@OneToMany(mappedBy="medecin")
public Collection<Decompte> getDecomptes() {
	return decomptes;
}
	
	

}
