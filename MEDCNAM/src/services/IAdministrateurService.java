package services;

import java.util.List;


import persistence.Administrateur;


public interface IAdministrateurService {
	
	public boolean save(Administrateur admin);
	public List<Administrateur> getAll();
	public Administrateur getById(Long id);
	public boolean update(Administrateur admin);
	
	public boolean delete(Administrateur admin);
}
