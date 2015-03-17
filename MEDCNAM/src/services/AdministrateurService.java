package services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.IAdministrateurDAO;
import persistence.Administrateur;


@Repository
@Transactional
@Service

public class AdministrateurService implements IAdministrateurService {
	
	public static AdministrateurService instance;
	   
	private IAdministrateurDAO adminDAO;
	
	public AdministrateurService(){
		instance=this;
		System.out.println("---------------------chargement  Service ----------------------");
	
	}
	
	public IAdministrateurDAO getAdministrateurDAO() {
		return adminDAO;
	}
	@Autowired
	public void setAdministrateurDAO(IAdministrateurDAO adminDAO) {
		
		System.out.println("injection adminDAO");
		this.adminDAO = adminDAO;
	}
		
	public Administrateur getById(Long id) {
		return adminDAO.getById(id);
	}
	
	public List<Administrateur> getAll() {
		return adminDAO.getAll();
	}

	public boolean save(Administrateur admin){
		
		return adminDAO.save(admin);
	}
	public boolean update(Administrateur admin){
		return adminDAO.update(admin);
		
	}
	public boolean delete(Administrateur admin){
		return adminDAO.delete(admin);
	}

}
