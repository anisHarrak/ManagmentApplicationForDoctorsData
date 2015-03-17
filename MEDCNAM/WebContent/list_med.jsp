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
			<rich:extendedDataTable height="350px" width="850" value="#{medecinCtrl.medecins}"
				var="med" id="table" sortMode="single" selectionMode="single"
				selection="#{medecinCtrl.selection3}" binding="#{medecinCtrl.table3}">


				<rich:column sortable="true" sortBy="#{med.code_conventionnel}"
					filterBy="#{med.code_conventionnel}" filterEvent="onkeyup" width="170px"
					label="code conventionnel">
					
			<f:facet name="header">
						<h:outputText value="code conventionnel" />
					</f:facet>
					<h:outputText value="#{med.code_conventionnel}" />
					
				</rich:column>
				<rich:column sortable="true" sortBy="#{med.nom}"
					filterBy="#{med.nom}" filterEvent="onkeyup" width="170px"
					label="nom">
					<f:facet name="header">
						<h:outputText value="Nom" />
					</f:facet>
					<h:outputText value="#{med.nom}" />
				</rich:column>

				<rich:column sortable="true" sortBy="#{med.prenom}"
					filterBy="#{med.prenom}" filterEvent="onkeyup" width="170px"
					label="prenom">
					<f:facet name="header">
						<h:outputText value="prenom" />
					</f:facet>
					<h:outputText value="#{med.prenom}">
						
					</h:outputText>
				</rich:column>
				<rich:column sortable="true" sortBy="#{med.adresse}"
					 width="170px"
					label="adresse">
					<f:facet name="header">
						<h:outputText value="adresse" />
					</f:facet>
					<h:outputText value="#{med.adresse}">
						
					</h:outputText>
				</rich:column>
				<rich:column sortable="true" sortBy="#{med.num_tel}"
					width="170px"
					label="numero telephone">
					<f:facet name="header">
						<h:outputText value="numero telephone" />
					</f:facet>
					<h:outputText value="#{med.num_tel}">
						
					</h:outputText>
				</rich:column>
				<a4j:support event="onselectionchange" reRender="restable"
					ajaxSingle="true" action="#{medecinCtrl.takeSelection3}"></a4j:support>
				

			</rich:extendedDataTable>
		</rich:panel>

		<rich:panel id="restable">
			<f:facet name="header">
				<h:outputText value="Medecin selected" />
			</f:facet>
			<rich:dataGrid columns="1" value="#{medecinCtrl.selectedMedecins}"
				var="cap" rendered="#{not empty medecinCtrl.selectedMedecins}">
				<h:outputText value="code conventionnel: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.code_conventionnel}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="nom: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.nom}" />
				<div class="div_near_spacer"></div>

				<h:outputText value="prenom: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.prenom}" />
				<div class="div_near_spacer"></div>

				<h:outputText value="adresse:" styleClass="label"></h:outputText>
				<h:outputText value="#{cap.adresse}" />
				<div class="div_near_spacer"></div>

				<h:outputText value="numero telephone:" styleClass="label"></h:outputText>
				<h:outputText value="#{cap.num_tel}" />
				<div class="div_near_spacer"></div>

				<h:commandButton value="Modifier" type="submit"
	 				action="#{medecinCtrl.editMedecin}" /> 
				
				<h:commandButton value="supprimer" type="submit"
	 				action="#{medecinCtrl.deleteMedecin}" />

			</rich:dataGrid>
			
</rich:panel>
</h:form>
</body>
</html>
</f:view>
