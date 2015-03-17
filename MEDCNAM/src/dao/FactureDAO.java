package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dao.IFactureDAO;
import persistence.Facture;

@Repository
@Transactional
public class FactureDAO implements IFactureDAO {
  	
	private EntityManager entityManager;
	
	public FactureDAO(){
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
	public Facture getById(Long id) {
		return entityManager.find(Facture.class, id);
	}
	
	public List<Facture> getAll() {
		List<Facture> factures = entityManager.createQuery("select f from facture f").getResultList();

		return factures;
	}

	
	public boolean save(Facture facture) {
		entityManager.persist(facture);
		
		return true;
	}

	@Override
	public boolean update(Facture facture) {
		entityManager.merge(facture);
		return true;
	}

	@Override
	public boolean delete(Facture facture) {
		facture = entityManager.getReference(Facture.class, facture.getId());
		if (facture == null)
			return false;
		entityManager.merge(facture);
		entityManager.remove(facture);
		return true;
	}
	public Facture rechercher( Long id, String ordre_facture){
		
		return entityManager.find(Facture.class, ordre_facture);
	}
	
}
