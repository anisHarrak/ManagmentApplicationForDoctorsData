package services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import dao.IAPCIDAO;

import persistence.APCI;



@Repository
@Transactional
@Service

public class APCIService implements IAPCIService {
	
	public static APCIService instance;
	   
	private IAPCIDAO apciDAO;

	
	public APCIService(){
		instance=this;
		System.out.println("---------------------chargement  Service ----------------------");
	
	}
	
	public IAPCIDAO getAPCIDAO() {
		return apciDAO;
	}
	@Autowired
	public void setAPCIDAO(IAPCIDAO apciDAO) {
		
		System.out.println("injection apciDAO");
		this.apciDAO = apciDAO;
	}
	
	
	public APCI getById(Long id) {
		return apciDAO.getById(id);
	}
	
	public List<APCI> getAll() {
		return apciDAO.getAll();
	}
	public boolean update(APCI apci){
		return apciDAO.update(apci);
		
	}
	public APCI rechercher(String nom){
		return apciDAO.rechercher(nom);
	}
public boolean save(APCI apci){
		
		return apciDAO.save(apci);
	}
	public boolean delete(APCI apci){
		return apciDAO.delete(apci);
	}
	
		

}
