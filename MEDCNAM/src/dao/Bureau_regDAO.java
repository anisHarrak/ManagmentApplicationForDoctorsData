package dao;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dao.IBureau_regDAO;
import persistence.Bureau_reg;




@Repository
@Transactional
public class Bureau_regDAO implements IBureau_regDAO {
  	
	private EntityManager entityManager;
	
	public Bureau_regDAO(){
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
	public Bureau_reg getById(Long id) {
		return entityManager.find(Bureau_reg.class, id);
	}
	
	public List<Bureau_reg> getAll() {
		List<Bureau_reg> bureaux = entityManager.createQuery("select b from bureau_reg b").getResultList();

		return bureaux;
	}
	@Override
	public boolean update(Bureau_reg bureau) {
		entityManager.merge(bureau);
		return true;
	}
	public Bureau_reg rechercher(String nom_bureau){
		return entityManager.find(Bureau_reg.class, nom_bureau);	
	}
	
	public boolean save(Bureau_reg bureau){
		entityManager.persist(bureau);
		return true;
	}
	
	public boolean delete(Bureau_reg bureau) {
		bureau = entityManager.getReference(Bureau_reg.class, bureau.getId());
		if (bureau == null)
			return false;
		entityManager.merge(bureau);
		entityManager.remove(bureau);
		return true;
	}
}
