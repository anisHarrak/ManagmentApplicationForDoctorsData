package services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import dao.IMedecinDAO;

import persistence.Medecin;


@Repository
@Transactional
@Service

public class MedecinService implements IMedecinService {
	
	public static MedecinService instance;
	   
	private IMedecinDAO medecinDAO;

	
	public MedecinService(){
		instance=this;
		System.out.println("---------------------chargement  Service ----------------------");
	
	}
	
	public IMedecinDAO getMedecinDAO() {
		return medecinDAO;
	}
	@Autowired
	public void setMedecinDAO(IMedecinDAO medecinDAO) {
		
		System.out.println("injection medecinDAO");
		this.medecinDAO = medecinDAO;
	}
	
	
	public Medecin getById(Long id) {
		return medecinDAO.getById(id);
	}
	
	public List<Medecin> getAll() {
		return medecinDAO.getAll();
	}
	public boolean update(Medecin med){
		return medecinDAO.update(med);
		
	}
	public Medecin rechercher(String nom, String prenom){
		return medecinDAO.rechercher(nom, prenom);
	}
	public boolean save(Medecin med){
		
		return medecinDAO.save(med);
	}
	public boolean delete(Medecin med){
		return medecinDAO.delete(med);
	}
	public String connect(String code_conventionnel){
		return medecinDAO.connect(code_conventionnel);
	}	

}
