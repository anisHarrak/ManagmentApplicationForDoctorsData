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

import services.IActeService;
import services.ActeService;
import persistence.Acte;

@Component

@Scope("session")
@Qualifier("acteCtrl")

public class ActeCtrl {
	
	private Acte newActe = new Acte();
	private Acte editActe;
	
	private SimpleSelection selection;
	
	private IActeService acteService=ActeService.instance;
	
	private HtmlExtendedDataTable table;
	private List<Acte> selectedActes = new ArrayList<Acte>();
	private ExtendedTableDataModel<Acte> dataModel;
	private List<Acte> actes = new ArrayList<Acte>();
	
		//@Autowired
	public void setActeService(IActeService acteService) {
		
		this.acteService = acteService;
	}
		public IActeService getActeService() {
		return acteService;
	}

	

	public String editActe() {
		editActe = (Acte) getSelectedActes().iterator().next();
		return "edit";
	}
	public String deleteActe() {
		Acte med = (Acte) getSelectedActes().iterator().next();
		acteService.delete(med);
		resetSelection();
		getActes();
		return null;
	}
	
	public String updateActe() {
		acteService.update(editActe);
		getActes();
		return "list";
	}

	public List<Acte> getActes() {
		actes = acteService.getAll();
		return actes;
	}
	
	public Acte getNewActe() {
		return newActe;
	}

	public void setNewActe(Acte acte) {
		this.newActe = acte;
	}

	public Acte getEditActe() {
		return editActe;
	}

	public void setEditActe(Acte editActe) {
		this.editActe = editActe;
	}

	public void takeSelection() {
		getSelectedActes().clear();
		Iterator<Object> iterator = getSelection().getKeys();
		while (iterator.hasNext()) {
			Object key = iterator.next();
			table.setRowKey(key);
			if (table.isRowAvailable()) {
				getSelectedActes().add((Acte) table.getRowData());
			}
		}
	}

	public void resetSelection() {
		getSelectedActes().clear();
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

	public List<Acte> getSelectedActes() {
		return selectedActes;
	}

	public void setSelectedActes(List<Acte> selectedActes) {
		this.selectedActes = selectedActes;
	}

	public void setActes(List<Acte> actes) {
		this.actes = actes;
	}

	public ExtendedTableDataModel<Acte> getActesDataModel() {
		if (dataModel == null) {
			dataModel = new ExtendedTableDataModel<Acte>(
					new DataProvider<Acte>() {

						private static final long serialVersionUID = 5054087821033164847L;

						public Acte getItemByKey(Object key) {
							for (Acte c : actes) {
								if (key.equals(getKey(c))) {
									return c;
								}
							}
							return null;
						}

						public List<Acte> getItemsByRange(int firstRow,
								int endRow) {
							return actes.subList(firstRow, endRow);
						}

						public Object getKey(Acte item) {
							return item.getCode_acte();
						}

						public int getRowCount() {
							return actes.size();
						}

					});
		}
		return dataModel;
	}
	
	
	
	

}
