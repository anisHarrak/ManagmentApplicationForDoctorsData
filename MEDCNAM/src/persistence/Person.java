package persistence;


import java.util.Collection;
import java.util.Date;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name="person")
public class Person {
	private Long id;
	private String firstName;
	private String lastName;
	private float salary;
	private Date birthDay;
	
	private Collection<Adresse> adresses;

	
	public Person(){}
	
	
	public Person(Long id) {
		super();
		this.id = id;
	}


	public Person(Long id, String firstName, String lastName, float salary,
			Date birthDay) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.salary = salary;
		this.birthDay = birthDay;
	}


	@Id
	@GeneratedValue
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	@Temporal(TemporalType.DATE)
	public Date getBirthDay() {
		return birthDay;
	}
	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public float getSalary() {
		return salary;
	}
	public void setSalary(float salary) {
		this.salary = salary;
	}

	public void addAdresse(Adresse adresse){
		this.adresses.add(adresse);
		adresse.setPerson(this);
	}
	public void setAdresses(Collection<Adresse> adresses) {
		this.adresses = adresses;
	}

@OneToMany(mappedBy="person")
	public Collection<Adresse> getAdresses() {
		return adresses;
	}
}