package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dao.IActe_factureDAO;
import persistence.Acte_facture;

@Repository
@Transactional
public class Acte_factureDAO implements IActe_factureDAO {
  	
	private EntityManager entityManager;
	
	public Acte_factureDAO(){
		System.out.println("-----------------------chargement DAO-----------------------");
	}
		
	@PersistenceContext(unitName="MEDCNAM")
	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}
	
	public EntityManager getEntityManager() {
		return entityManager;
	}

	
	public List<Acte_facture> getAll() {
		List<Acte_facture> act_facts = entityManager.createQuery("select ac from acte_facture ac").getResultList();

		return act_facts;
	}

	
	public boolean save(Acte_facture acte_fact) {
		entityManager.persist(acte_fact);
		
		return true;
	}

	@Override
	public boolean update(Acte_facture acte_fact) {
		entityManager.merge(acte_fact);
		return true;
	}

	@Override
	public boolean delete(Acte_facture acte_fact) {
		acte_fact = entityManager.getReference(Acte_facture.class, acte_fact.getId());
		if (acte_fact == null)
			return false;
		entityManager.merge(acte_fact);
		entityManager.remove(acte_fact);
		return true;
	}
	public Acte_facture rechercher( Long id){
		
		return entityManager.find(Acte_facture.class, id);
	}
	
}
