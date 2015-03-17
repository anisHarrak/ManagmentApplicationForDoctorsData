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
     <title>Edit Person</title>
     
    </head>
    <body>

     
	<h:panelGrid columns="2" cellpadding="10">
		<h:outputLink value="list.jsf">
			<h:outputText value="Lister" />
		</h:outputLink>

		<h:outputLink value="add.jsf">
			<h:outputText value="Ajouter" />
		</h:outputLink>
	</h:panelGrid>
	<a4j:form>
		<rich:panel>
			<h:outputText value="Prénom" />
			<h:inputText id="firstName"
				value="#{personCtrl.editPerson.firstName}" required="true"
				 />
			<h:message for="firstName" />
<div class="div_near_spacer"></div>
			<h:outputText value="Nom" />
			<h:inputText id="lastName" value="#{personCtrl.editPerson.lastName}"
				required="true"   />
			<h:message for="firstName" />
			<h:outputText />
			<div class="div_near_spacer"></div>
			<h:outputText value="Date de naissance" />
			<a4j:outputPanel id="birthDay" layout="block">
                    <rich:calendar value="#{personCtrl.editPerson.birthDay}"
                        locale="fr/FR"
                        popup="true"
                        datePattern="d/MMM/y"
                        showApplyButton="true" cellWidth="24px" cellHeight="22px" style="width:200px"/>
            </a4j:outputPanel>
            <div class="div_near_spacer"></div>
			<h:outputText value="salaire" />
			<h:inputText id="salary" value="#{personCtrl.editPerson.salary}"
				required="true" >
				<f:convertNumber maxFractionDigits="2"
                                    groupingUsed="true"
                                    currencySymbol="$"
                                    maxIntegerDigits="7"
                                    type="currency"/>
				</h:inputText>
			
			<h:message for="salary" />
			<h:outputText />
			<div class="div_near_spacer"></div>
			<h:commandButton value="Mettre à jour"
				action="#{personCtrl.updatePerson}" />
		</rich:panel>
	</a4j:form>


    </body>
  </html>
</f:view>
