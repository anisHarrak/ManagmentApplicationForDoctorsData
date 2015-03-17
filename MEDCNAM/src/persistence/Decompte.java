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

@Entity(name="decompte")
public class Decompte {

	private Long id;
	private String num_decompte;
	private Date date_depot;
	private Date date_debut_periode;
	private Date date_fin_periode;
	private String ref_decompte;
	private String nb_factures;
	private String total_decompte;
	private String total_ticket_moderateur;
	private String montant_a_regler_CNAM;
	private Medecin medecin;
	private Collection<Facture> factures;
	
	public Decompte() {}

	public Decompte(Long id) {
		super();
		this.id = id;
	}

	public Decompte(Long id, String numDecompte, Date dateDepot,
			Date dateDebutPeriode, Date dateFinPeriode, String refDecompte,
			String nbFactures, String totalDecompte,
			String totalTicketModerateur, String montantAReglerCNAM) {
		super();
		this.id = id;
		this.num_decompte = numDecompte;
		this.date_depot = dateDepot;
		this.date_debut_periode = dateDebutPeriode;
		this.date_fin_periode = dateFinPeriode;
		this.ref_decompte = refDecompte;
		this.nb_factures = nbFactures;
		this.total_decompte = totalDecompte;
		this.total_ticket_moderateur = totalTicketModerateur;
		this.montant_a_regler_CNAM = montantAReglerCNAM;
	}
	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNum_decompte() {
		return num_decompte;
	}

	public void setNum_decompte(String numDecompte) {
		num_decompte = numDecompte;
	}
	@Temporal(TemporalType.DATE)
	public Date getDate_depot() {
		return date_depot;
	}

	public void setDate_depot(Date dateDepot) {
		date_depot = dateDepot;
	}
	@Temporal(TemporalType.DATE)
	public Date getDate_debut_periode() {
		return date_debut_periode;
	}

	public void setDate_debut_periode(Date dateDebutPeriode) {
		date_debut_periode = dateDebutPeriode;
	}
	@Temporal(TemporalType.DATE)
	public Date getDate_fin_periode() {
		return date_fin_periode;
	}

	public void setDate_fin_periode(Date dateFinPeriode) {
		date_fin_periode = dateFinPeriode;
	}

	public String getRef_decompte() {
		return ref_decompte;
	}

	public void setRef_decompte(String refDecompte) {
		ref_decompte = refDecompte;
	}

	public String getNb_factures() {
		return nb_factures;
	}

	public void setNb_factures(String nbFactures) {
		nb_factures = nbFactures;
	}

	public String getTotal_decompte() {
		return total_decompte;
	}

	public void setTotal_decompte(String totalDecompte) {
		total_decompte = totalDecompte;
	}

	public String getTotal_ticket_moderateur() {
		return total_ticket_moderateur;
	}

	public void setTotal_ticket_moderateur(String totalTicketModerateur) {
		total_ticket_moderateur = totalTicketModerateur;
	}

	public String getMontant_a_regler_CNAM() {
		return montant_a_regler_CNAM;
	}

	public void setMontant_a_regler_CNAM(String montantAReglerCNAM) {
		montant_a_regler_CNAM = montantAReglerCNAM;
	}
	
	public void setMedecin(Medecin medecin) {
		this.medecin = medecin;
	}
@ManyToOne
	public Medecin getMedecin() {
		return medecin;
	}

public void setFactures(Collection<Facture> factures) {
	this.factures = factures;
}

@OneToMany(mappedBy="decompte")
public Collection<Facture> getFactures() {
	return factures;
}
	
}
