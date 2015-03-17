package persistence;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;


@Entity(name="acte_fature")
public class Acte_facture {
	
	private Long id;
	private String montant_ticket_moderateur;
	private Facture facture;
	private Acte acte;
	
	public Acte_facture() {}

	public Acte_facture(Long id) {
		super();
		this.id = id;
	}

	public Acte_facture(Long id, String montantTicketModerateur) {
		super();
		this.id = id;
		montant_ticket_moderateur = montantTicketModerateur;
	}
	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getMontant_ticket_moderateur() {
		return montant_ticket_moderateur;
	}

	public void setMontant_ticket_moderateur(String montantTicketModerateur) {
		montant_ticket_moderateur = montantTicketModerateur;
	}
		
	public void setFacture(Facture facture) {
		this.facture = facture;
	}
@ManyToOne
	public Facture getFacture() {
		return facture;
	}
	
public void setActe(Acte acte) {
	this.acte = acte;
}
@ManyToOne
public Acte getActe() {
	return acte;
}
}
