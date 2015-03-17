package dao;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dao.IActeDAO;
import persistence.Acte;




@Repository
@Transactional
public class ActeDAO implements IActeDAO {
  	
	private EntityManager entityManager;
	
	public ActeDAO(){
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
	public Acte getById(Long id) {
		return entityManager.find(Acte.class, id);
	}
	
	public List<Acte> getAll() {
		List<Acte> actes = entityManager.createQuery("select a from acte a").getResultList();

		return actes;
	}
	@Override
	public boolean update(Acte acte) {
		entityManager.merge(acte);
		return true;
	}
	public Acte rechercher(String code_acte){
		return entityManager.find(Acte.class, code_acte );	
	}
	
	public boolean save(Acte acte){
		entityManager.persist(acte);
		return true;
	}
	@Override
	public boolean delete(Acte acte) {
		acte = entityManager.getReference(Acte.class, acte.getId());
		if (acte == null)
			return false;
		entityManager.merge(acte);
		entityManager.remove(acte);
		return true;
	}
}
