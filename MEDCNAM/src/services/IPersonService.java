package services;

import java.util.List;

import persistence.Adresse;
import persistence.Person;


public interface IPersonService {
	
	public List<Person> getAll();
	public Person getById(int id);
	public boolean delete(Person person);
	public boolean update(Person person);
	public void savePerson(Person newPerson);
	public void saveAdresse(Adresse newAdresse, Person next);
	public void deleteAdresse(Adresse a);
	public void updateAdresse(Adresse editAdresse);
	public void updatePerson(Person editPerson);
	public List<Person> getAllPerson();
	public void deletePerson(Person p);
	public List<Adresse> getAdressesByPerson(Person p);
	
}
