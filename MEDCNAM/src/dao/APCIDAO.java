package dao;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dao.IAPCIDAO;
import persistence.APCI;




@Repository
@Transactional
public class APCIDAO implements IAPCIDAO {
  	
	private EntityManager entityManager;
	
	public APCIDAO(){
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
	public APCI getById(Long id) {
		return entityManager.find(APCI.class, id);
	}
	
	public List<APCI> getAll() {
		List<APCI> apcis = entityManager.createQuery("select a from apci a").getResultList();

		return apcis;
	}
	@Override
	public boolean update(APCI apci) {
		entityManager.merge(apci);
		return true;
	}
	public APCI rechercher(String nom){
		return entityManager.find(APCI.class, nom );	
	}
	public boolean save(APCI apci){
		entityManager.persist(apci);
		return true;
	}
	@Override
	public boolean delete(APCI apci) {
		apci = entityManager.getReference(APCI.class, apci.getId());
		if (apci == null)
			return false;
		entityManager.merge(apci);
		entityManager.remove(apci);
		return true;
	}
	
}
