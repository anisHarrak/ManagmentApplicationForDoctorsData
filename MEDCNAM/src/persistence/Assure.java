package persistence;

import java.util.Collection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name="assure")
public class Assure {
	
	private Long id;
	private String matricule_assure;
	private String code_caisse;
	private String nom_assure;
	private String prenom_assure;
	private Date date_naissance;
	private String adresse;
	private String num_tel;
	private Collection<Beneficier> beneficiers;
	
	public Assure() {}

	public Assure(Long id) {
		super();
		this.id = id;
	}

	public Assure(Long id, String matriculeAssure, String codeCaisse,
			String nomAssure, String prenomAssure, Date dateNaissance,
			String adresse, String numTel) {
		super();
		this.id = id;
		this.matricule_assure = matriculeAssure;
		this.code_caisse = codeCaisse;
		this.nom_assure = nomAssure;
		this.prenom_assure = prenomAssure;
		this.date_naissance = dateNaissance;
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

	public String getMatricule_assure() {
		return matricule_assure;
	}

	public void setMatricule_assure(String matriculeAssure) {
		matricule_assure = matriculeAssure;
	}

	public String getCode_caisse() {
		return code_caisse;
	}

	public void setCode_caisse(String codeCaisse) {
		code_caisse = codeCaisse;
	}

	public String getNom_assure() {
		return nom_assure;
	}

	public void setNom_assure(String nomAssure) {
		nom_assure = nomAssure;
	}

	public String getPrenom_assure() {
		return prenom_assure;
	}

	public void setPrenom_assure(String prenomAssure) {
		prenom_assure = prenomAssure;
	}
	@Temporal(TemporalType.DATE)
	public Date getDate_naissance() {
		return date_naissance;
	}

	public void setDate_naissance(Date dateNaissance) {
		date_naissance = dateNaissance;
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
	public void setBeneficiers(Collection<Beneficier> beneficiers) {
		this.beneficiers = beneficiers;
	}

@OneToMany(mappedBy="assure")
	public Collection<Beneficier> getBeneficiers() {
		return beneficiers;
	}
	
}
