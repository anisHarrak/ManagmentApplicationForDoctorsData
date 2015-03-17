package services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.IAdresseDAO;
import dao.IPersonDAO;


import persistence.Adresse;
import persistence.Person;

@Repository
@Transactional
@Service
public class PersonService  implements IPersonService {
    
	public static PersonService instance;
   
	private IPersonDAO personDAO;
	private IAdresseDAO adresseDAO;
	
	public PersonService(){
		instance=this;
		System.out.println("---------------------chargement  Service ----------------------");
	
	}
	
	public IPersonDAO getPersonDAO() {
		return personDAO;
	}
	@Autowired
	public void setPersonDAO(IPersonDAO personDAO) {
		
		System.out.println("injection personDAO");
		this.personDAO = personDAO;
	}
	@Autowired
	public void setAdresseDAO(IAdresseDAO adresseDAO) {
		this.adresseDAO = adresseDAO;
	}

	public IAdresseDAO getAdresseDAO() {
		return adresseDAO;
	}
	
	public Person getPersonById(int id) {
		return personDAO.getById(id);
	}
	
	public List<Person> getAllPerson() {
		return personDAO.getAll();
	}

	
	
	public List<Adresse> getAdressesByPerson(Person person)
	{
		if(person==null)
			return null;
		return personDAO.getAdresseListByPersonId(person.getId());
	}
	
	public Adresse getAdresseById(int id) {
		return adresseDAO.getById(id);
	}
	
	public List<Adresse> getAllAdresse() {
		return adresseDAO.getAll();
	}

	@Override
	public boolean delete(Person person) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void deleteAdresse(Adresse a) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deletePerson(Person p) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Person> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Person getById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Override
	public void saveAdresse(Adresse newAdresse, Person next) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void savePerson(Person person) {
		personDAO.save(person);
	}

	@Override
	public boolean update(Person person) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void updateAdresse(Adresse editAdresse) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updatePerson(Person editPerson) {
		// TODO Auto-generated method stub
		
	}

	
	



	
}

