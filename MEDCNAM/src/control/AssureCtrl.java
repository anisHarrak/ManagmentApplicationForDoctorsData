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

import services.IAssureService;
import services.AssureService;
import persistence.Assure;





@Component

@Scope("session")
@Qualifier("assureCtrl")

public class AssureCtrl {
	
	private Assure newAssure = new Assure();
	private Assure editAssure;
	
	private SimpleSelection selection;
	
	private IAssureService assureService=AssureService.instance;
	
	private HtmlExtendedDataTable table;
	private List<Assure> selectedAssures = new ArrayList<Assure>();
	private ExtendedTableDataModel<Assure> dataModel;
	private List<Assure> assures = new ArrayList<Assure>();
	
		//@Autowired
	public void setAssureService(IAssureService assureService) {
		
		this.assureService = assureService;
	}
		public IAssureService getAssureService() {
		return assureService;
	}

		public String createAssure() {
			assureService.save(newAssure);
			newAssure = new Assure();
			return "list";
		}

	public String editAssure() {
		editAssure = (Assure) getSelectedAssures().iterator().next();
		return "edit";
	}
	public String deleteAssure() {
		Assure med = (Assure) getSelectedAssures().iterator().next();
		assureService.delete(med);
		resetSelection();
		getAssures();
		return null;
	}
	
	public String updateAssure() {
		assureService.update(editAssure);
		getAssures();
		return "list";
	}

	public List<Assure> getAssures() {
		assures = assureService.getAll();
		return assures;
	}
	
	public Assure getNewAssure() {
		return newAssure;
	}

	public void setNewAssure(Assure assure) {
		this.newAssure = assure;
	}

	public Assure getEditAssure() {
		return editAssure;
	}

	public void setEditAssure(Assure editAssure) {
		this.editAssure = editAssure;
	}

	public void takeSelection() {
		getSelectedAssures().clear();
		Iterator<Object> iterator = getSelection().getKeys();
		while (iterator.hasNext()) {
			Object key = iterator.next();
			table.setRowKey(key);
			if (table.isRowAvailable()) {
				getSelectedAssures().add((Assure) table.getRowData());
			}
		}
	}

	public void resetSelection() {
		getSelectedAssures().clear();
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

	public List<Assure> getSelectedAssures() {
		return selectedAssures;
	}

	public void setSelectedAssures(List<Assure> selectedAssures) {
		this.selectedAssures = selectedAssures;
	}

	public void setAssures(List<Assure> assures) {
		this.assures = assures;
	}

	public ExtendedTableDataModel<Assure> getAssuresDataModel() {
		if (dataModel == null) {
			dataModel = new ExtendedTableDataModel<Assure>(
					new DataProvider<Assure>() {

						private static final long serialVersionUID = 5054087821033164847L;

						public Assure getItemByKey(Object key) {
							for (Assure c : assures) {
								if (key.equals(getKey(c))) {
									return c;
								}
							}
							return null;
						}

						public List<Assure> getItemsByRange(int firstRow,
								int endRow) {
							return assures.subList(firstRow, endRow);
						}

						public Object getKey(Assure item) {
							return item.getNom_assure();
						}

						public int getRowCount() {
							return assures.size();
						}

					});
		}
		return dataModel;
	}
	
	

}
