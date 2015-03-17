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
			<rich:extendedDataTable height="350px" width="340" value="#{acteCtrl.actes}"
				var="b" id="table5" sortMode="single" selectionMode="single"
				selection="#{acteCtrl.selection}" binding="#{acteCtrl.table}">


				<rich:column sortable="true" sortBy="#{b.code_acte}"
					filterBy="#{b.code_acte}" filterEvent="onkeyup" width="170px"
					label="code acte ">
					
			<f:facet name="header">
						<h:outputText value="code acte" />
					</f:facet>
					<h:outputText value="#{b.code_acte}" />
					
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.montant_acte}"
					filterBy="#{b.montant_acte}" filterEvent="onkeyup" width="170px"
					label="montant acte ">
					<f:facet name="header">
						<h:outputText value="Montant acte" />
					</f:facet>
					<h:outputText value="#{b.montant_acte}" />
				</rich:column>

				
				
				<a4j:support event="onselectionchange" reRender="restable"
					ajaxSingle="true" action="#{acteCtrl.takeSelection}"></a4j:support>
				

			</rich:extendedDataTable>
		</rich:panel>

		<rich:panel id="restable5">
			<f:facet name="header">
				<h:outputText value="Acte selected" />
			</f:facet>
			<rich:dataGrid columns="1" value="#{acteCtrl.selectedActes}"
				var="cap" rendered="#{not empty acteCtrl.selectedActes}">
				<h:outputText value="code acte: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.code_acte}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="montant acte: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.montant_acte}" />
				<div class="div_near_spacer"></div>

				

				

			</rich:dataGrid>
			
</rich:panel>
</h:form>
</body>
</html>
</f:view>