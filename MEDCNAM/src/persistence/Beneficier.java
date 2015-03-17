package persistence;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import java.util.Collection;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name="beneficier")
public class Beneficier {
	
	private Long id;
	private String nom;
	private String prenom;
	private String rang_malade;
	private String lien_parente;
	private String adresse;
	private Date date_naissance;
	private String num_tel;
	private Assure assure;
	private Collection<Facture> factures;
	
	public Beneficier() {}

	public Beneficier(Long id) {
		super();
		this.id = id;
	}

	public Beneficier(Long id, String nom, String prenom, String rangMalade,
			String lienParente, String adresse, Date dateNaissance,
			String numTel) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.rang_malade = rangMalade;
		this.lien_parente = lienParente;
		this.adresse = adresse;
		this.date_naissance = dateNaissance;
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

	public String getRang_malade() {
		return rang_malade;
	}

	public void setRang_malade(String rangMalade) {
		rang_malade = rangMalade;
	}

	public String getLien_parente() {
		return lien_parente;
	}

	public void setLien_parente(String lienParente) {
		lien_parente = lienParente;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	@Temporal(TemporalType.DATE)
	public Date getDate_naissance() {
		return date_naissance;
	}

	public void setDate_naissance(Date dateNaissance) {
		date_naissance = dateNaissance;
	}

	public String getNum_tel() {
		return num_tel;
	}

	public void setNum_tel(String numTel) {
		num_tel = numTel;
	}
	
	public void setAssure(Assure assure) {
		this.assure = assure;
	}
@ManyToOne
	public Assure getAssure() {
		return assure;
	}
public void setFactures(Collection<Facture> factures) {
	this.factures = factures;
}

@OneToMany(mappedBy="beneficier")
public Collection<Facture> getFactures() {
	return factures;
}


}
