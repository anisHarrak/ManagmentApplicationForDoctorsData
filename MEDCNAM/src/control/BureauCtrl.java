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

import services.IBureau_regService;
import services.Bureau_regService;
import persistence.Bureau_reg;


@Component
@Scope("session")
@Qualifier("bureauCtrl")

public class BureauCtrl {

	private Bureau_reg newBureau_reg = new Bureau_reg();
	private Bureau_reg editBureau_reg;
	
	private SimpleSelection selection;
	
	private IBureau_regService bureau_regService=Bureau_regService.instance;
	
	private HtmlExtendedDataTable table;
	private List<Bureau_reg> selectedBureau_regs = new ArrayList<Bureau_reg>();
	private ExtendedTableDataModel<Bureau_reg> dataModel;
	private List<Bureau_reg> bureau_regs = new ArrayList<Bureau_reg>();
	
public void setBureau_regService(IBureau_regService bureau_regService) {
		
		this.bureau_regService = bureau_regService;
	}
		public IBureau_regService getBureau_regService() {
		return bureau_regService;
	}

	

	public String editBureau_reg() {
		editBureau_reg = (Bureau_reg) getSelectedBureau_regs().iterator().next();
		return "edit";
	}
	public String deleteBureau_reg() {
		Bureau_reg bur = (Bureau_reg) getSelectedBureau_regs().iterator().next();
		bureau_regService.delete(bur);
		resetSelection();
		getBureau_regs();
		return null;
	}
	
	public String updateBureau_reg() {
		bureau_regService.update(editBureau_reg);
		getBureau_regs();
		return "list";
	}

	public List<Bureau_reg> getBureau_regs() {
		bureau_regs = bureau_regService.getAll();
		return bureau_regs;
	}
	
	public Bureau_reg getNewBureau_reg() {
		return newBureau_reg;
	}

	public void setNewBureau_reg(Bureau_reg bureau_reg) {
		this.newBureau_reg = bureau_reg;
	}

	public Bureau_reg getEditBureau_reg() {
		return editBureau_reg;
	}

	public void setEditBureau_reg(Bureau_reg editBureau_reg) {
		this.editBureau_reg = editBureau_reg;
	}

	public void takeSelection() {
		getSelectedBureau_regs().clear();
		Iterator<Object> iterator = getSelection().getKeys();
		while (iterator.hasNext()) {
			Object key = iterator.next();
			table.setRowKey(key);
			if (table.isRowAvailable()) {
				getSelectedBureau_regs().add((Bureau_reg) table.getRowData());
			}
		}
	}

	public void resetSelection() {
		getSelectedBureau_regs().clear();
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

	public List<Bureau_reg> getSelectedBureau_regs() {
		return selectedBureau_regs;
	}

	public void setSelectedBureau_regs(List<Bureau_reg> selectedBureau_regs) {
		this.selectedBureau_regs = selectedBureau_regs;
	}

	public void setBureau_regs(List<Bureau_reg> bureau_regs) {
		this.bureau_regs = bureau_regs;
	}

	public ExtendedTableDataModel<Bureau_reg> getBureau_regsDataModel() {
		if (dataModel == null) {
			dataModel = new ExtendedTableDataModel<Bureau_reg>(
					new DataProvider<Bureau_reg>() {

						private static final long serialVersionUID = 5054087821033164847L;

						public Bureau_reg getItemByKey(Object key) {
							for (Bureau_reg c : bureau_regs) {
								if (key.equals(getKey(c))) {
									return c;
								}
							}
							return null;
						}

						public List<Bureau_reg> getItemsByRange(int firstRow,
								int endRow) {
							return bureau_regs.subList(firstRow, endRow);
						}

						public Object getKey(Bureau_reg item) {
							return item.getNom_bureau();
						}

						public int getRowCount() {
							return bureau_regs.size();
						}

					});
		}
		return dataModel;
	}


	
	
	
	
}
