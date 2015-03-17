package dao;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dao.IBeneficierDAO;
import persistence.Beneficier;




@Repository
@Transactional
public class BeneficierDAO implements IBeneficierDAO {
  	
	private EntityManager entityManager;
	
	public BeneficierDAO(){
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
	public Beneficier getById(Long id) {
		return entityManager.find(Beneficier.class, id);
	}
	
	public List<Beneficier> getAll() {
		List<Beneficier> beneficiers = entityManager.createQuery("select b from beneficier b").getResultList();

		return beneficiers;
	}
	@Override
	public boolean update(Beneficier benef) {
		entityManager.merge(benef);
		return true;
	}
	public Beneficier rechercher(String nom , String prenom){
		return entityManager.find(Beneficier.class, nom );	
	}
	
	public boolean save(Beneficier benef){
		entityManager.persist(benef);
		return true;
	}
	@Override
	public boolean delete(Beneficier benef) {
		benef = entityManager.getReference(Beneficier.class, benef.getId());
		if (benef == null)
			return false;
		entityManager.merge(benef);
		entityManager.remove(benef);
		return true;
	}
}
