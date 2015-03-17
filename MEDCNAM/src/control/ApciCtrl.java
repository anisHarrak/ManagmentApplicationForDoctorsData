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

import services.IAPCIService;
import services.APCIService;
import persistence.APCI;

@Component

@Scope("session")
@Qualifier("apciCtrl")


public class ApciCtrl {
	
	private APCI newAPCI = new APCI();
	private APCI editAPCI;
	
	private SimpleSelection selection;
	
	private IAPCIService apciService=APCIService.instance;
	
	private HtmlExtendedDataTable table;
	private List<APCI> selectedAPCIs = new ArrayList<APCI>();
	private ExtendedTableDataModel<APCI> dataModel;
	private List<APCI> apcis = new ArrayList<APCI>();
	
		//@Autowired
	public void setAPCIService(IAPCIService apciService) {
		
		this.apciService = apciService;
	}
		public IAPCIService getAPCIService() {
		return apciService;
	}

	

	public String editAPCI() {
		editAPCI = (APCI) getSelectedAPCIs().iterator().next();
		return "edit";
	}
	public String deleteAPCI() {
		APCI med = (APCI) getSelectedAPCIs().iterator().next();
		apciService.delete(med);
		resetSelection();
		getAPCIs();
		return null;
	}
	
	public String updateAPCI() {
		apciService.update(editAPCI);
		getAPCIs();
		return "list";
	}

	public List<APCI> getAPCIs() {
		apcis = apciService.getAll();
		return apcis;
	}
	
	public APCI getNewActe() {
		return newAPCI;
	}

	public void setNewAPCI(APCI apci) {
		this.newAPCI = apci;
	}

	public APCI getEditAPCI() {
		return editAPCI;
	}

	public void setEditAPCI(APCI editAPCI) {
		this.editAPCI = editAPCI;
	}

	public void takeSelection() {
		getSelectedAPCIs().clear();
		Iterator<Object> iterator = getSelection().getKeys();
		while (iterator.hasNext()) {
			Object key = iterator.next();
			table.setRowKey(key);
			if (table.isRowAvailable()) {
				getSelectedAPCIs().add((APCI) table.getRowData());
			}
		}
	}

	public void resetSelection() {
		getSelectedAPCIs().clear();
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

	public List<APCI> getSelectedAPCIs() {
		return selectedAPCIs;
	}

	public void setSelectedAPCIs(List<APCI> selectedAPCIs) {
		this.selectedAPCIs = selectedAPCIs;
	}

	public void setAPCIs(List<APCI> apcis) {
		this.apcis = apcis;
	}

	public ExtendedTableDataModel<APCI> getAPCIsDataModel() {
		if (dataModel == null) {
			dataModel = new ExtendedTableDataModel<APCI>(
					new DataProvider<APCI>() {

						private static final long serialVersionUID = 5054087821033164847L;

						public APCI getItemByKey(Object key) {
							for (APCI c : apcis) {
								if (key.equals(getKey(c))) {
									return c;
								}
							}
							return null;
						}

						public List<APCI> getItemsByRange(int firstRow,
								int endRow) {
							return apcis.subList(firstRow, endRow);
						}

						public Object getKey(APCI item) {
							return item.getNom();
						}

						public int getRowCount() {
							return apcis.size();
						}

					});
		}
		return dataModel;
	}
	
	

}
