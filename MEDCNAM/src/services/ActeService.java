package services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import dao.IActeDAO;

import persistence.Acte;



@Repository
@Transactional
@Service

public class ActeService implements IActeService {
	
	public static ActeService instance;
	   
	private IActeDAO acteDAO;

	
	public ActeService(){
		instance=this;
		System.out.println("---------------------chargement  Service ----------------------");
	
	}
	
	public IActeDAO getActeDAO() {
		return acteDAO;
	}
	@Autowired
	public void setActeDAO(IActeDAO acteDAO) {
		
		System.out.println("injection acteDAO");
		this.acteDAO = acteDAO;
	}
	
	
	public Acte getById(Long id) {
		return acteDAO.getById(id);
	}
	
	public List<Acte> getAll() {
		return acteDAO.getAll();
	}
	public boolean update(Acte acte){
		return acteDAO.update(acte);
		
	}
	public Acte rechercher(String code_acte){
		return acteDAO.rechercher(code_acte);
	}
	
public boolean save(Acte acte){
		
		return acteDAO.save(acte);
	}
	public boolean delete(Acte acte){
		return acteDAO.delete(acte);
	}
		
		

}
