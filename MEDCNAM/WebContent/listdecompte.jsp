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
			<rich:extendedDataTable height="350px" width="900" value="#{decompteCtrl.decomptes}"
				var="b" id="table9" sortMode="single" selectionMode="single"
				selection="#{decompteCtrl.selection}" binding="#{decompteCtrl.table}">


				<rich:column sortable="true" sortBy="#{b.num_decompte}"
					filterBy="#{b.num_decompte}" filterEvent="onkeyup" width="150px"
					label="num�ro d�compte ">
					
			<f:facet name="header">
						<h:outputText value="Num�ro d�compte" />
					</f:facet>
					<h:outputText value="#{b.num_decompte}" />
					
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.ref_decompte}"
					filterBy="#{b.ref_decompte}" filterEvent="onkeyup" width="150px"
					label="r�f�rence d�compte ">
					<f:facet name="header">
						<h:outputText value="R�f�rence d�compte" />
					</f:facet>
					<h:outputText value="#{b.ref_decompte}" />
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.nb_factures}" width="150px"
					 
					label="nombre facture ">
					<f:facet name="header">
						<h:outputText value="Nombre facture" />
					</f:facet>
					<h:outputText value="#{b.nb_factures}" />
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.date_depot}" width="150px"
					 
					label="date d�pot ">
					<f:facet name="header">
						<h:outputText value="Date d�pot" />
					</f:facet>
					<h:outputText value="#{b.date_depot}" />
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.date_debut_periode}" width="150px"
					 
					label="date debut p�riode ">
					<f:facet name="header">
						<h:outputText value="Date d�but periode" />
					</f:facet>
					<h:outputText value="#{b.date_debut_periode}" />
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.date_fin_periode}" width="150px"
					
					label="date fin p�riode ">
					<f:facet name="header">
						<h:outputText value="Date fin p�riode" />
					</f:facet>
					<h:outputText value="#{b.date_fin_periode}" />
				</rich:column>

				<a4j:support event="onselectionchange" reRender="restable"
					ajaxSingle="true" action="#{decompteCtrl.takeSelection}"></a4j:support>
				

			</rich:extendedDataTable>
		</rich:panel>

		<rich:panel id="restable9" >
			<f:facet name="header">
				<h:outputText value="D�compte selected" />
			</f:facet>
			<rich:dataGrid columns="6" value="#{decompteCtrl.selectedDecomptes}" 
				var="cap" rendered="#{not empty decompteCtrl.selectedDecomptes}">
				<h:outputText value="num�ro d�compte: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.num_decompte}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="r�f�rence d�compte: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.ref_decompte}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="nombre factures: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.nb_factures}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="date d�pot: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.date_depot}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="date d�but p�riode: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.date_debut_periode}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="date fin p�riode: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.date_fin_periode}" />
				<div class="div_near_spacer"></div>

				<h:commandButton value="Modifier" type="submit"
	 				action="#{decompteCtrl.editDecompte}" /> 
				
				<h:commandButton value="supprimer" type="submit"
	 				action="#{decompteCtrl.deleteDecompte}" />

			</rich:dataGrid>
			
</rich:panel>
</h:form>
</body>
</html>
</f:view>