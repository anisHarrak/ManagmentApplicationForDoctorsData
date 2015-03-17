<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<f:view>
  <!doctype html public "-//w3c//dtd html 4.0 transitional//en">
  <html>
    <head>
    <style>
.label {
	font-weight: bold;
}

.pbody {
	width: 200px;
}

.div_near_spacer {
	border-top-width: 0px;
	border-left-width: 0px;
	font-size: 0px;
	border-bottom-width: 0px;
	height: 2px;
	border-right-width: 0px
}
</style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
     <title>listing apci</title>
     
    </head>
<body>

<rich:panel style="border:0;width:60%;text-align:center">
			
			<rich:panel>
				<f:facet name="header">
				  <h3 >  Liste des APCIs</h3>
				</f:facet>
				<rich:extendedDataTable cellpadding="0" cellspacing="0" border="0"
					var="list" value="#{apciCtrl.apcis}" id="table" 
					sortMode="single" selectionMode="single"
					selection="#{apciCtrl.selection}"
					style="text-align:center;" rows="2" width="100" height="300">
					<f:facet name="header">
						<rich:columnGroup>
							<rich:column colspan="2">
								<h:outputText
									value="APCI(s) selectionné(s): #{apciCtrl.apcisDataModel.rowCount}" />
							</rich:column>

							<rich:column breakBefore="true">
								<h:outputText styleClass="headerText" value="Nom APCI" />
							</rich:column>
							<rich:column>
								<h:outputText styleClass="headerText" value="Code APCI " />
							</rich:column>
							
						</rich:columnGroup>
					</f:facet>
					<rich:column filterEvent="onkeyup" filterBy="#{list.nom}" sortBy="#{list.nom}">
						<h:outputText value="#{list.nom}" />
					</rich:column>
					
					<rich:column >
						<h:outputText value="#{list.code}" />
					</rich:column>
					
					
									
				</rich:extendedDataTable>
				
				
			</rich:panel>
		</rich:panel>



</body>
</html>
</f:view>