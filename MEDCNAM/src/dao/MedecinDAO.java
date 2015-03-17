package dao;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dao.IMedecinDAO;
import persistence.Medecin;

@Repository
@Transactional


public class MedecinDAO implements IMedecinDAO {
  	
	private EntityManager entityManager;
	
	
	public MedecinDAO(){
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
	public Medecin getById(Long id) {
		return entityManager.find(Medecin.class, id);
	}
	
	public List<Medecin> getAll() {
		List<Medecin> medecins = entityManager.createQuery("select m from medecin m").getResultList();

		return medecins;
	}
	@Override
	public boolean update(Medecin med) {
		entityManager.merge(med);
		return true;
	}
	public Medecin rechercher(String nom , String prenom){
		return entityManager.find(Medecin.class, nom );	
	}
	
	public boolean save(Medecin med){
		entityManager.persist(med);
		return true;
	}
	@Override
	public boolean delete(Medecin med) {
		med = entityManager.getReference(Medecin.class, med.getId());
		if (med == null)
			return false;
		entityManager.merge(med);
		entityManager.remove(med);
		return true;
	}
	public String  connect(String code_conventionnel){
		
		//try{
		 Query query=entityManager.createQuery("select u from medecin u where u.code_conventionnel=:code_conventionnel ");
		 query.setParameter("code_conventionnel", code_conventionnel);
		 String result= (String) query.getSingleResult();
		 //if(result!=null )
			 return result;
			 
		 //}
       // catch (Exception e) {
        	
		//}   
			
		
		 
		 //return null;
	 }

	

	
}
