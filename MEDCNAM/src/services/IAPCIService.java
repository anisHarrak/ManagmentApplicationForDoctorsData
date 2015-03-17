package services;

import java.util.List;
import persistence.APCI;


public interface IAPCIService {
	
	public List<APCI> getAll();
	public APCI getById(Long id);
	public boolean save(APCI apci);
	public boolean delete(APCI apci);
	public boolean update(APCI apci);
	public APCI rechercher(String nom);

}
