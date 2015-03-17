package services;

import java.util.List;
import persistence.Beneficier;


public interface IBeneficierService {
	
	public List<Beneficier> getAll();
	public Beneficier getById(Long id);
	public boolean save(Beneficier benef);
	public boolean delete(Beneficier benef);
	public boolean update(Beneficier benef);
	public Beneficier rechercher(String nom, String prenom);	

}
