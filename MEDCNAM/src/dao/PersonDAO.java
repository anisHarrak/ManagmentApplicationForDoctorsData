package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dao.IPersonDAO;
import persistence.Person;
import persistence.Adresse;

@Repository
@Transactional
public class PersonDAO implements IPersonDAO {
  	
	private EntityManager entityManager;
	
	public PersonDAO(){
		System.out.println("-----------------------chargement DAO-----------------------");
	}
		
	@PersistenceContext(unitName="MEDCNAM")
	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}
	
	public EntityManager getEntityManager() {
		return entityManager;
	}

	@Override
	public Person getById(int id) {
		return entityManager.find(Person.class, id);
	}
	
	public List<Person> getAll() {
		List<Person> persons = entityManager.createQuery("select p from person p").getResultList();

		return persons;
	}

	
	public boolean save(Person person) {
		entityManager.persist(person);
		
		return true;
	}

	@Override
	public boolean update(Person person) {
		entityManager.merge(person);
		return true;
	}

	@Override
	public boolean delete(Person person) {
		person = entityManager.getReference(Person.class, person.getId());
		if (person == null)
			return false;
		entityManager.merge(person);
		entityManager.remove(person);
		return true;
	}
	public List<Adresse> getAdresseListByPersonId(Long id) {
		Person p=entityManager.find(Person.class, id);
		return (List<Adresse>) p.getAdresses();
	}
	
}

