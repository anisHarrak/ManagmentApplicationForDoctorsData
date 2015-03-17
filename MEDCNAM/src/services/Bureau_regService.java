package services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import dao.IBureau_regDAO;

import persistence.Bureau_reg;



@Repository
@Transactional
@Service

public class Bureau_regService implements IBureau_regService {
	
	public static Bureau_regService instance;
	   
	private IBureau_regDAO bureau_regDAO;

	
	public Bureau_regService(){
		instance=this;
		System.out.println("---------------------chargement  Service ----------------------");
	
	}
	
	public IBureau_regDAO getBureau_regDAO() {
		return bureau_regDAO;
	}
	@Autowired
	public void setBureau_regDAO(IBureau_regDAO bureau_regDAO) {
		
		System.out.println("injection bureau_regDAO");
		this.bureau_regDAO = bureau_regDAO;
	}
	
	
	public Bureau_reg getById(Long id) {
		return bureau_regDAO.getById(id);
	}
	
	public List<Bureau_reg> getAll() {
		return bureau_regDAO.getAll();
	}
	public boolean update(Bureau_reg bureau){
		return bureau_regDAO.update(bureau);
		
	}
	public Bureau_reg rechercher(String nom_bureau){
		return bureau_regDAO.rechercher(nom_bureau);
	}
	
public boolean save(Bureau_reg bureau){
		
		return bureau_regDAO.save(bureau);
	}
	public boolean delete(Bureau_reg bureau){
		return bureau_regDAO.delete(bureau);
	}
		

}
