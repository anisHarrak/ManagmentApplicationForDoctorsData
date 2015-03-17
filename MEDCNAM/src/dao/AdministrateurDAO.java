package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import dao.IAdministrateurDAO;
import persistence.Administrateur;




@Repository
@Transactional

public class AdministrateurDAO implements IAdministrateurDAO {
	
private EntityManager entityManager;
	
	public AdministrateurDAO(){
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
	public Administrateur getById(Long id) {
		return entityManager.find(Administrateur.class, id);
	}
	
	public List<Administrateur> getAll() {
		List<Administrateur> admins = entityManager.createQuery("select a from administrateur a").getResultList();

		return admins;
	}

	
	public boolean save(Administrateur admin) {
		entityManager.persist(admin);
		
		return true;
	}

	@Override
	public boolean update(Administrateur admin) {
		entityManager.merge(admin);
		return true;
	}
	@Override
	public boolean delete(Administrateur admin) {
		admin = entityManager.getReference(Administrateur.class, admin.getId());
		if (admin == null)
			return false;
		entityManager.merge(admin);
		entityManager.remove(admin);
		return true;
	}
	
}
