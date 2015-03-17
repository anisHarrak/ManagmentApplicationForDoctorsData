package persistence;

import java.util.Collection;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;


@Entity(name="acte")
public class Acte {
	
	private Long id;
	private String code_acte;
	private float montant_acte;
	private Collection<Acte_facture> acte_facture;
	public Acte() {}

	public Acte(Long id) {
		super();
		this.id = id;
	}

	public Acte(Long id, String codeActe, float montantActe) {
		super();
		this.id = id;
		this.code_acte = codeActe;
		this.montant_acte = montantActe;
	}
	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCode_acte() {
		return code_acte;
	}

	public void setCode_acte(String codeActe) {
		code_acte = codeActe;
	}

	public float getMontant_acte() {
		return montant_acte;
	}

	public void setMontant_acte(float montantActe) {
		montant_acte = montantActe;
	}
	
	public void setActe_factures(Collection<Acte_facture> acte_factures) {
		this.acte_facture = acte_factures;
	}

	@OneToMany(mappedBy="acte")
	public Collection<Acte_facture> getActe_factures() {
		return acte_facture;
	}

	
	

}
