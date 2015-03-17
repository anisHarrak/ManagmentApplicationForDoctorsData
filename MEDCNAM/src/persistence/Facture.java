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


@Entity(name="facture")
public class Facture {
	
	private Long id;
	private String ordre_facture;
	private String nom;
	private String prenom;
	private Date date_naissance_malade;
	private String code_medecin_famille;
	private Date date_prescription;
	private String total_facture;
	private String montant_consultation;
	private String total_ticket_moderateur;
	private String montant_a_regler;
	private APCI apci;
	private Decompte decompte;
	private Beneficier beneficier;
	private Collection<Acte_facture> acte_facture;
	
	public Facture() {}

	public Facture(Long id) {
		super();
		this.id = id;
	}

	public Facture(Long id, String ordreFacture, String nom, String prenom,
			Date dateNaissanceMalade, String codeMedecinFamille,
			Date datePrescription, String totalFacture,
			String montantConsultation, String totalTicketModerateur,
			String montantARegler) {
		super();
		this.id = id;
		this.ordre_facture = ordreFacture;
		this.nom = nom;
		this.prenom = prenom;
		this.date_naissance_malade = dateNaissanceMalade;
		this.code_medecin_famille = codeMedecinFamille;
		this.date_prescription = datePrescription;
		this.total_facture = totalFacture;
		this.montant_consultation = montantConsultation;
		this.total_ticket_moderateur = totalTicketModerateur;
		this.montant_a_regler = montantARegler;
	}
	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getOrdre_facture() {
		return ordre_facture;
	}

	public void setOrdre_facture(String ordreFacture) {
		ordre_facture = ordreFacture;
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
	
	public String getTotal_facture() {
		return total_facture;
	}

	public void setTotal_facture(String totalFacture) {
		total_facture = totalFacture;
	}

	public String getMontant_consultation() {
		return montant_consultation;
	}

	public void setMontant_consultation(String montantConsultation) {
		montant_consultation = montantConsultation;
	}

	public String getTotal_ticket_moderateur() {
		return total_ticket_moderateur;
	}

	public void setTotal_ticket_moderateur(String totalTicketModerateur) {
		total_ticket_moderateur = totalTicketModerateur;
	}

	public String getMontant_a_regler() {
		return montant_a_regler;
	}

	public void setMontant_a_regler(String montantARegler) {
		montant_a_regler = montantARegler;
	}

	@Temporal(TemporalType.DATE)
	public Date getDate_naissance_malade() {
		return date_naissance_malade;
	}

	public void setDate_naissance_malade(Date dateNaissanceMalade) {
		date_naissance_malade = dateNaissanceMalade;
	}

	public String getCode_medecin_famille() {
		return code_medecin_famille;
	}

	public void setCode_medecin_famille(String codeMedecinFamille) {
		code_medecin_famille = codeMedecinFamille;
	}
	@Temporal(TemporalType.DATE)
	public Date getDate_prescription() {
		return date_prescription;
	}

	public void setDate_prescription(Date datePrescription) {
		date_prescription = datePrescription;
	}

	
	
	public void setAPCI(APCI apci) {
		this.apci = apci;
	}
@ManyToOne
	public APCI getAPCI() {
		return apci;
	}

public void setDecompte(Decompte decompte) {
	this.decompte = decompte;
}
@ManyToOne
public Decompte getDecompte() {
	return decompte;
}
public void setBeneficier(Beneficier beneficier) {
	this.beneficier = beneficier;
}
@ManyToOne
public Beneficier getBeneficier() {
	return beneficier;
}
	
public void setActe_factures(Collection<Acte_facture> acte_factures) {
	this.acte_facture = acte_factures;
}

@OneToMany(mappedBy="facture")
public Collection<Acte_facture> getActe_factures() {
	return acte_facture;
}






}
