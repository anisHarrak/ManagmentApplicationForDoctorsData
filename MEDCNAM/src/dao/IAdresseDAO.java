package dao;

import java.util.List;

import persistence.Adresse;
import persistence.Person;

public interface IAdresseDAO {
	public boolean save(Adresse adresse,Person person);
	public List<Adresse> getAll();
	public Adresse getById(int id);
	public boolean delete(Adresse adresse);
	public boolean update(Adresse adresse);	
}
