package control;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.richfaces.component.html.HtmlExtendedDataTable;
import org.richfaces.model.DataProvider;
import org.richfaces.model.ExtendedTableDataModel;
import org.richfaces.model.selection.SimpleSelection;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import org.springframework.beans.factory.annotation.Qualifier;

import services.IPersonService;
import services.PersonService;
import persistence.Adresse;
import persistence.Person;

@Component

@Scope("session")
@Qualifier("personCtrl")
public class PersonCtrl {
	private Person newPerson = new Person();
	private Person editPerson;
	private Adresse newAdresse = new Adresse();
	private Adresse editAdresse;
	private SimpleSelection selection;
	
	private IPersonService personService=PersonService.instance;
	
	private HtmlExtendedDataTable table;
	private List<Person> selectedPersons = new ArrayList<Person>();
	private ExtendedTableDataModel<Person> dataModel;
	private List<Person> persons = new ArrayList<Person>();
	
	private SimpleSelection selection2;
	private HtmlExtendedDataTable table2;
	private List<Adresse> selectedAdresses = new ArrayList<Adresse>();
	private ExtendedTableDataModel<Adresse> dataModel2;
	private List<Adresse> adresses = new ArrayList<Adresse>();

	//@Autowired
	public void setPersonService(IPersonService personService) {
		
		this.personService = personService;
	}
		public IPersonService getPersonService() {
		return personService;
	}

	public String createPerson() {
		personService.savePerson(newPerson);
		newPerson = new Person();
		//getPersons();
		return "list";
	}

	public String deletePerson() {
		Person p = (Person) getSelectedPersons().iterator().next();
		personService.deletePerson(p);
		resetSelection();
		getPersons();
		return null;
	}

	public String editPerson() {
		editPerson = (Person) getSelectedPersons().iterator().next();
		return "edit";
	}

	public String updatePerson() {
		personService.updatePerson(editPerson);
		getPersons();
		return "list";
	}

	public List<Person> getPersons() {
		persons = personService.getAllPerson();
		return persons;
	}
	
	public Person getNewPerson() {
		return newPerson;
	}

	public void setNewPerson(Person person) {
		this.newPerson = person;
	}

	public Person getEditPerson() {
		return editPerson;
	}

	public void setEditPerson(Person editPerson) {
		this.editPerson = editPerson;
	}

	public void takeSelection() {
		getSelectedPersons().clear();
		Iterator<Object> iterator = getSelection().getKeys();
		while (iterator.hasNext()) {
			Object key = iterator.next();
			table.setRowKey(key);
			if (table.isRowAvailable()) {
				getSelectedPersons().add((Person) table.getRowData());
			}
		}
	}

	public void resetSelection() {
		getSelectedPersons().clear();
	}

	public void setSelection(SimpleSelection selection) {
		this.selection = selection;
	}

	public void setTable(HtmlExtendedDataTable table) {
		this.table = table;
	}

	public HtmlExtendedDataTable getTable() {
		return table;
	}

	public SimpleSelection getSelection() {
		return selection;
	}

	public List<Person> getSelectedPersons() {
		return selectedPersons;
	}

	public void setSelectedPersons(List<Person> selectedPersons) {
		this.selectedPersons = selectedPersons;
	}

	public void setPersons(List<Person> persons) {
		this.persons = persons;
	}

	public ExtendedTableDataModel<Person> getPersonsDataModel() {
		if (dataModel == null) {
			dataModel = new ExtendedTableDataModel<Person>(
					new DataProvider<Person>() {

						private static final long serialVersionUID = 5054087821033164847L;

						public Person getItemByKey(Object key) {
							for (Person c : persons) {
								if (key.equals(getKey(c))) {
									return c;
								}
							}
							return null;
						}

						public List<Person> getItemsByRange(int firstRow,
								int endRow) {
							return persons.subList(firstRow, endRow);
						}

						public Object getKey(Person item) {
							return item.getLastName();
						}

						public int getRowCount() {
							return persons.size();
						}

					});
		}
		return dataModel;
	}

	
	
	
	//////////////////
	
	
	public String createAdresse() {
		personService.saveAdresse(newAdresse,(Person)getSelectedPersons().iterator().next());
		newAdresse = new Adresse();
		getAdresses();
		return "list";
	}

	public String deleteAdresse() {
		Adresse a = (Adresse) getSelectedAdresses().iterator().next();
		personService.deleteAdresse(a);
		resetSelection2();
		getAdresses();
		return null;
	}

	public String editAdresse() {
		editAdresse = (Adresse) getSelectedAdresses().iterator().next();
		return "editadresse";
	}

	public String updateAdresse() {
		personService.updateAdresse(editAdresse);
		getAdresses();
		return "list";
	}

	public List<Adresse> getAdresses() {
		Person p;
		if(getSelectedPersons().isEmpty())
			p=null;
		else	
			p=(Person) getSelectedPersons().iterator().next();
		adresses = personService.getAdressesByPerson(p);
		return adresses;
	}
	public void setAdresses(List<Adresse> adresses)
	{
		this.adresses=adresses;
	}
	
	public Adresse getNewAdresse() {
		return newAdresse;
	}

	public void setNewAdresse(Adresse Adresse) {
		this.newAdresse = Adresse;
	}

	public Adresse getEditAdresse() {
		return editAdresse;
	}

	public void setEditAdresse(Adresse editAdresse) {
		this.editAdresse = editAdresse;
	}

	public HtmlExtendedDataTable getTable2() {
		return table2;
	}

	public void setTable2(HtmlExtendedDataTable table2) {
		this.table2 = table2;
	}

	public List<Adresse> getSelectedAdresses() {
		return selectedAdresses;
	}

	public void setSelectedAdresses(List<Adresse> selectedAdresses) {
		this.selectedAdresses = selectedAdresses;
	}

	public ExtendedTableDataModel<Adresse> getDataModel2() {
		return dataModel2;
	}

	public void setDataModel2(ExtendedTableDataModel<Adresse> dataModel2) {
		this.dataModel2 = dataModel2;
	}
	
	public void takeSelection2() {
		getSelectedAdresses().clear();
		Iterator<Object> iterator = getSelection2().getKeys();
		while (iterator.hasNext()) {
			Object key = iterator.next();
			table2.setRowKey(key);
			if (table2.isRowAvailable()) {
				getSelectedAdresses().add((Adresse) table2.getRowData());
			}
		}
	}

	public void resetSelection2() {
		getSelectedAdresses().clear();
	}
	public ExtendedTableDataModel<Adresse> getAdressesDataModel() {
		if (dataModel2 == null) {
			dataModel2 = new ExtendedTableDataModel<Adresse>(
					new DataProvider<Adresse>() {

						private static final long serialVersionUID = 5054087829033164847L;

						public Adresse getItemByKey(Object key) {
							for (Adresse c : adresses) {
								if (key.equals(getKey(c))) {
									return c;
								}
							}
							return null;
						}

						public List<Adresse> getItemsByRange(int firstRow,
								int endRow) {
							return adresses.subList(firstRow, endRow);
						}

						public Object getKey(Adresse item) {
							return item.getVille();
						}

						public int getRowCount() {
							return adresses.size();
						}

					});
		}
		return dataModel2;
	}

	public SimpleSelection getSelection2() {
		return selection2;
	}

	public void setSelection2(SimpleSelection selection2) {
		this.selection2 = selection2;
	}
	
	
}
