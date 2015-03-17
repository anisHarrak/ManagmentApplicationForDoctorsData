package dao;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dao.IAssureDAO;
import persistence.Assure;




@Repository
@Transactional
public class AssureDAO implements IAssureDAO {
  	
	private EntityManager entityManager;
	
	public AssureDAO(){
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
	public Assure getById(Long id) {
		return entityManager.find(Assure.class, id);
	}
	
	public List<Assure> getAll() {
		List<Assure> assures = entityManager.createQuery("select a from assure a").getResultList();

		return assures;
	}
	@Override
	public boolean update(Assure assure) {
		entityManager.merge(assure);
		return true;
	}
	public Assure rechercher(String nom_bureau , String prenom_bureau){
		return entityManager.find(Assure.class, nom_bureau );	
	}
	
	public boolean save(Assure assure){
		entityManager.persist(assure);
		return true;
	}
	@Override
	public boolean delete(Assure assure) {
		assure = entityManager.getReference(Assure.class, assure.getId());
		if (assure == null)
			return false;
		entityManager.merge(assure);
		entityManager.remove(assure);
		return true;
	}
}
