package dao;

import java.util.List;

import persistence.Adresse;
import persistence.Person;

public interface IPersonDAO {
	public boolean save(Person person);
	public List<Person> getAll();
	public Person getById(int id);
	public boolean delete(Person person);
	public boolean update(Person person);
	public List<Adresse> getAdresseListByPersonId(Long id);
}
