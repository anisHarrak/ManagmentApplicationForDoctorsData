<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
<title>list</title>
</head>
<body>
<f:view>
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
	<h:panelGrid columns="2" cellpadding="10">
		<h:outputLink value="list.jsf">
			<h:outputText value="Lister" />
		</h:outputLink>

		<h:outputLink value="add.jsf">
			<h:outputText value="Ajouter" />
		</h:outputLink>

	</h:panelGrid>

	<h:form>

		<rich:panel>
			<rich:extendedDataTable height="350px" value="#{personCtrl.persons}"
				var="p" id="table" sortMode="single" selectionMode="single"
				selection="#{personCtrl.selection}" binding="#{personCtrl.table}">


				<rich:column sortable="true" sortBy="#{p.firstName}"
					filterBy="#{p.firstName}" filterEvent="onkeyup" width="170px"
					label="prénom">>
			<f:facet name="header">
						<h:outputText value="Prénom" />
					</f:facet>
					<h:outputText value="#{p.firstName}" />
				</rich:column>
				<rich:column sortable="true" sortBy="#{p.lastName}"
					filterBy="#{p.lastName}" filterEvent="onkeyup" width="170px"
					label="nom">
					<f:facet name="header">
						<h:outputText value="Nom" />
					</f:facet>
					<h:outputText value="#{p.lastName}" />
				</rich:column>

				<rich:column sortable="true" sortBy="#{p.birthDay}"
					filterBy="#{p.birthDay}" filterEvent="onkeyup" width="170px"
					label="date de naissance">
					<f:facet name="header">
						<h:outputText value="Date de naissance" />
					</f:facet>
					<h:outputText value="#{p.birthDay}">
						<f:convertDateTime dateStyle="default" />
					</h:outputText>
				</rich:column>
				<rich:column sortable="true" sortBy="#{p.salary}"
					filterBy="#{p.salary}" filterEvent="onkeyup" width="170px"
					label="salary">
					<f:facet name="header">
						<h:outputText value="Salaire" />
					</f:facet>
					<h:outputText value="#{p.salary}">
						<f:convertNumber maxFractionDigits="2" groupingUsed="true"
							currencySymbol="$" maxIntegerDigits="7" type="currency" />

					</h:outputText>
				</rich:column>
				<a4j:support event="onselectionchange" reRender="restable"
					ajaxSingle="true" action="#{personCtrl.takeSelection}"></a4j:support>
				

			</rich:extendedDataTable>
		</rich:panel>

		<rich:panel id="restable">
			<f:facet name="header">
				<h:outputText value="Person selected" />
			</f:facet>
			<rich:dataGrid columns="1" value="#{personCtrl.selectedPersons}"
				var="cap" rendered="#{not empty personCtrl.selectedPersons}">
				<h:outputText value="Prénom: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.firstName}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="Nom: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.lastName}" />
				<div class="div_near_spacer"></div>

				<h:outputText value="Date de naissance: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.birthDay}" />
				<div class="div_near_spacer"></div>

				<h:outputText value="Salaire:" styleClass="label"></h:outputText>
				<h:outputText value="#{cap.salary}" />
				<div class="div_near_spacer"></div>

				<h:commandButton value="Modifier" type="submit"
	 				action="#{personCtrl.editPerson}" /> 
				<h:commandButton value="Supprimer" type="submit"
					action="#{personCtrl.deletePerson}" />


			</rich:dataGrid>
			<h:outputText value="Nothing selected"
				rendered="#{empty personCtrl.selectedPersons}" />
		






		<h:panelGrid columns="2" cellpadding="10">


			<h:outputLink value="addadresse.jsf">
				<h:outputText value="Ajouter adresse" />
			</h:outputLink>

		</h:panelGrid>

<rich:panel id="restable1">

		<rich:panel>
			<f:facet name="header">
				<h:outputText value="Adresses" />
				
			</f:facet>
			<rich:extendedDataTable height="350px" value="#{personCtrl.adresses}" 
				var="p" id="table2" sortMode="single"
				rendered="#{not empty personCtrl.adresses}" selectionMode="single"
				selection="#{personCtrl.selection2}" binding="#{personCtrl.table2}">


				<rich:column sortable="true" sortBy="#{p.ville}"
					filterBy="#{p.ville}" filterEvent="onkeyup" width="170px"
					label="ville">>
			<f:facet name="header">
						<h:outputText value="Ville" />
					</f:facet>
					<h:outputText value="#{p.ville}" />
				</rich:column>
				<rich:column sortable="true" sortBy="#{p.codezip}"
					filterBy="#{p.codezip}" filterEvent="onkeyup" width="170px"
					label="codezip">
					<f:facet name="header">
						<h:outputText value="Code Zip" />
					</f:facet>
					<h:outputText value="#{p.codezip}" />
				</rich:column>


				<a4j:support event="onselectionchange" reRender="restable2"
					ajaxSingle="true" action="#{personCtrl.takeSelection2}"></a4j:support>
			</rich:extendedDataTable>

			<h:outputText value="La personne est sans abri"
				rendered="#{empty personCtrl.adresses}" />
		</rich:panel>

		<rich:panel id="restable2">
			<f:facet name="header">
				<h:outputText value="Detail de l'adresse selected" />
			</f:facet>
			<rich:dataGrid columns="1" value="#{personCtrl.selectedAdresses}"
				var="cap" rendered="#{not empty personCtrl.selectedAdresses}">
				<h:outputText value="Ville " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.ville}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="Code Zip " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.codezip}" />
				<div class="div_near_spacer"></div>



				<h:commandButton value="Modifier" type="submit"
					action="#{personCtrl.editAdresse}" />
				<h:commandButton value="Supprimer" type="submit"
					action="#{personCtrl.deleteAdresse}" />
			</rich:dataGrid>
			<rich:extendedDataTable value="Nothing selected"
				rendered="#{empty personCtrl.selectedAdresses}" />
		</rich:panel>
   </rich:panel>
</rich:panel>
</h:form>
</f:view>
</body>
</html>

