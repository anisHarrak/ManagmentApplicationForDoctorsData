package services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import dao.IBeneficierDAO;

import persistence.Beneficier;



@Repository
@Transactional
@Service

public class BeneficierService implements IBeneficierService {
	
	public static BeneficierService instance;
	   
	private IBeneficierDAO beneficierDAO;

	
	public BeneficierService(){
		instance=this;
		System.out.println("---------------------chargement  Service ----------------------");
	
	}
	
	public IBeneficierDAO getBeneficierDAO() {
		return beneficierDAO;
	}
	@Autowired
	public void setBeneficierDAO(IBeneficierDAO beneficierDAO) {
		
		System.out.println("injection beneficierDAO");
		this.beneficierDAO = beneficierDAO;
	}
	
	
	public Beneficier getById(Long id) {
		return beneficierDAO.getById(id);
	}
	
	public List<Beneficier> getAll() {
		return beneficierDAO.getAll();
	}
	public boolean update(Beneficier benef){
		return beneficierDAO.update(benef);
		
	}
	public Beneficier rechercher(String nom, String prenom){
		return beneficierDAO.rechercher(nom, prenom);
	}
	
public boolean save(Beneficier benef){
		
		return beneficierDAO.save(benef);
	}
	public boolean delete(Beneficier benef){
		return beneficierDAO.delete(benef);
	}
		

}
