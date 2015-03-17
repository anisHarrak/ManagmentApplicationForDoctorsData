<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<f:view>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<h:form>

		<rich:panel>
			<rich:extendedDataTable height="350px" width="175" value="#{acte_factureCtrl.acte_factures}"
				var="b" id="table10" sortMode="single" selectionMode="single"
				selection="#{acte_factureCtrl.selection}" binding="#{acte_factureCtrl.table}">


				<rich:column sortable="true" sortBy="#{b.montant_ticket_moderateur}"
					filterBy="#{b.montant_ticket_moderateur}" filterEvent="onkeyup" width="170px"
					label="montant ticket modérateur ">
					
			<f:facet name="header">
						<h:outputText value="Montant ticket modérateur" />
					</f:facet>
					<h:outputText value="#{b.montant_ticket_moderateur}" />
					
				</rich:column>
				

				<a4j:support event="onselectionchange" reRender="restable"
					ajaxSingle="true" action="#{acte_factureCtrl.takeSelection}"></a4j:support>
				

			</rich:extendedDataTable>
		</rich:panel>

		<rich:panel id="restable10">
			<f:facet name="header">
				<h:outputText value="Acte_facturé selected" />
			</f:facet>
			<rich:dataGrid columns="1" value="#{acte_factureCtrl.selectedActe_factures}"
				var="cap" rendered="#{not empty acte_factureCtrl.selectedActe_factures}">
				<h:outputText value="montant ticket modéateur: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.montant_ticket_moderateur}" />
				<div class="div_near_spacer"></div>
			
				<h:commandButton value="Modifier" type="submit"
	 				action="#{acte_factureCtrl.editActe_facture}" /> 
				
				<h:commandButton value="supprimer" type="submit"
	 				action="#{acte_factureCtrl.deleteActe_facture}" />

			</rich:dataGrid>
			
</rich:panel>
</h:form>
</body>
</html>
</f:view>