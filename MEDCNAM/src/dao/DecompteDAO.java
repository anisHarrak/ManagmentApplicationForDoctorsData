package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dao.IDecompteDAO;
import persistence.Decompte;

@Repository
@Transactional
public class DecompteDAO implements IDecompteDAO {
  	
	private EntityManager entityManager;
	
	public DecompteDAO(){
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
	public Decompte getById(Long id) {
		return entityManager.find(Decompte.class, id);
	}
	
	public List<Decompte> getAll() {
		List<Decompte> decomptes = entityManager.createQuery("select d from decompte d").getResultList();

		return decomptes;
	}

	
	public boolean save(Decompte decompte) {
		entityManager.persist(decompte);
		
		return true;
	}

	@Override
	public boolean update(Decompte decompte) {
		entityManager.merge(decompte);
		return true;
	}

	@Override
	public boolean delete(Decompte decompte) {
		decompte = entityManager.getReference(Decompte.class, decompte.getId());
		if (decompte == null)
			return false;
		entityManager.merge(decompte);
		entityManager.remove(decompte);
		return true;
	}
	public Decompte rechercher( Long id, String num_decompte){
		
		return entityManager.find(Decompte.class, num_decompte);
	}
	
}
