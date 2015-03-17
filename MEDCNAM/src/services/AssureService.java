package services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import dao.IAssureDAO;

import persistence.Assure;



@Repository
@Transactional
@Service

public class AssureService implements IAssureService {
	
	public static AssureService instance;
	   
	private IAssureDAO assureDAO;

	
	public AssureService(){
		instance=this;
		System.out.println("---------------------chargement  Service ----------------------");
	
	}
	
	public IAssureDAO getAssureDAO() {
		return assureDAO;
	}
	@Autowired
	public void setAssureDAO(IAssureDAO assureDAO) {
		
		System.out.println("injection assureDAO");
		this.assureDAO = assureDAO;
	}
	
	
	public Assure getById(Long id) {
		return assureDAO.getById(id);
	}
	
	public List<Assure> getAll() {
		return assureDAO.getAll();
	}
	public boolean update(Assure assure){
		return assureDAO.update(assure);
		
	}
	public Assure rechercher(String nom_assure, String prenom_assure){
		return assureDAO.rechercher(nom_assure, prenom_assure);
	}
public boolean save(Assure assure){
		
		return assureDAO.save(assure);
	}
	public boolean delete(Assure assure){
		return assureDAO.delete(assure);
	}
	
		

}
