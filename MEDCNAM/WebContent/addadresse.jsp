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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    
     <title>Add Adresse</title>
     
    </head>
    <body>

     <h:panelGrid columns="2" cellpadding="10">
	<h:outputLink value="list.jsf">
		<h:outputText value="Lister" />
	</h:outputLink>

	
</h:panelGrid>

	<h:form>
		<rich:panel >
			<h:outputText value="Ville" />
			<h:inputText id="ville" value="#{personCtrl.newAdresse.ville}"
				required="true"  />
			<h:message for="ville" />

			<h:outputText value="Code Zip" />
			<h:inputText id="codezip" value="#{personCtrl.newAdresse.codezip}"
				required="true" />
			<h:message for="codezip" />
			<h:outputText />
			
			
			<h:commandButton value="Ajouter" action="#{personCtrl.createAdresse}" />
		</rich:panel>
	</h:form>


    </body>
  </html>
</f:view>
