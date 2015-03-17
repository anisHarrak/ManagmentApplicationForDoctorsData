package services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import dao.IActe_factureDAO;

import persistence.Acte_facture;


@Repository
@Transactional
@Service

public class Acte_factureService implements IActe_factureService {
	
	public static Acte_factureService instance;
	   
	private IActe_factureDAO acte_factureDAO;

	
	public Acte_factureService(){
		instance=this;
		System.out.println("---------------------chargement  Service ----------------------");
	
	}
	
	public IActe_factureDAO getActe_factureDAO() {
		return acte_factureDAO;
	}
	@Autowired
	public void setActe_factureDAO(IActe_factureDAO acte_factureDAO) {
		
		System.out.println("injection acte_factureDAO");
		this.acte_factureDAO = acte_factureDAO;
	}
	
	
	//public Acte_facture getById(int id) {
		//return acte_factureDAO.getById(id);
	//}
	
	public List<Acte_facture> getAll() {
		return acte_factureDAO.getAll();
	}
	public boolean update(Acte_facture act_fact){
		return acte_factureDAO.update(act_fact);
		
	}
	public Acte_facture rechercher(Long id){
		return acte_factureDAO.rechercher(id);
	}
	
	public boolean save(Acte_facture acte_fact){
		return acte_factureDAO.save(acte_fact);
		
	}
	public boolean delete(Acte_facture acte_fact){
		return acte_factureDAO.delete(acte_fact);
		
	}
		

}
