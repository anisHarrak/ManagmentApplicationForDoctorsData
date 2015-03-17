package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import org.springframework.transaction.annotation.Transactional;

import persistence.Adresse;
import persistence.Person;

@Repository
@Transactional
//(propagation=Propagation.MANDATORY)
public class AdresseDAO implements IAdresseDAO{

	
private EntityManager entityManager;
	
	public AdresseDAO(){
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
	public Adresse getById(int id) {
		return entityManager.find(Adresse.class, id);
	}
	
	public List<Adresse> getAll() {
		List<Adresse> adresses = entityManager.createQuery("select a from adresse a").getResultList();

		return adresses;
	}

	
	@Override
	public boolean update(Adresse adresse) {
		entityManager.merge(adresse);
		return true;
	}

	@Override
	public boolean delete(Adresse adresse) {
		adresse = entityManager.getReference(Adresse.class, adresse.getId());
		if (adresse == null)
			return false;
		entityManager.merge(adresse);
		entityManager.remove(adresse);
		return true;
	}

	@Override
	public boolean save(Adresse adresse, Person person) {
		Person p = entityManager.find(Person.class, person.getId());
		p.addAdresse((entityManager.merge(adresse)));
		
		return true;
	}
}
