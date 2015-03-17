package persistence;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;


@Entity(name="adresse")
public class Adresse {

	private int id;
	private String ville;
	private String codezip;
	
	private Person person;
	
	
	public Adresse() {
		
	}
	
	public Adresse(int id) {
		super();
		this.id = id;
	}

	public Adresse(int id, String ville, String codezip) {
		super();
		this.id = id;
		this.ville = ville;
		this.codezip = codezip;
	}
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getVille() {
		return ville;
	}
	public void setVille(String ville) {
		this.ville = ville;
	}
	public String getCodezip() {
		return codezip;
	}
	public void setCodezip(String codezip) {
		this.codezip = codezip;
	}

	public void setPerson(Person person) {
		this.person = person;
	}
@ManyToOne
	public Person getPerson() {
		return person;
	}
	
}
