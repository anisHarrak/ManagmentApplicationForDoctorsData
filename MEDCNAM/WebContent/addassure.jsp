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
    
     <title>Add Assure</title>
     
    </head>
<body>

<rich:panel>
		        <f:facet name="header" ><h:outputText value="Saisir Un Assuré"/></f:facet>
     <h:panelGrid>
     <h:form>
           <rich:layout>
        
        <rich:layoutPanel position="left">
        <h:panelGrid>
		<h:outputText style="color: black;font-family:arial, verdana;
	font-size:14px; text-decoration: none font-weight: bold;" value="Nom assuré:" />
			
			<h:inputText id="nom" value="#{assureCtrl.newAssure.nom_assure}"
				required="false" >
				
			</h:inputText>
			<h:outputText />
			<div class="div_near_spacer"></div>

         <h:outputText style="color: black;font-family:arial, verdana;
	font-size:14px; text-decoration: none font-weight: bold;" value="Prénom assuré:" />
			
			<h:inputText id="prenom" value="#{assureCtrl.newAssure.prenom_assure}"
				required="false" >
				
			</h:inputText>
			<h:outputText />
			<div class="div_near_spacer"></div> 
          
          <h:outputText style="color: black;font-family:arial, verdana;
	font-size:14px; text-decoration: none font-weight: bold;" value="Matricule assuré:" />
			
			<h:inputText id="matricule" value="#{assureCtrl.newAssure.matricule_assure}"
				required="false" >
				
			</h:inputText>
			<h:outputText />
			<div class="div_near_spacer"></div>
			
		</h:panelGrid>
		</rich:layoutPanel>
		<rich:layoutPanel position="center">
		<h:panelGrid>	
            
            <h:outputText style="color: black;font-family:arial, verdana;
	font-size:14px; text-decoration: none font-weight: bold;" value="Code caisse:" />
			
			<h:inputText id="codecaisse" value="#{assureCtrl.newAssure.code_caisse}"
				required="false" >
				
			</h:inputText>
			<h:outputText />
			<div class="div_near_spacer"></div>
            
            <h:outputText style="color: black;font-family:arial, verdana;
	font-size:14px; text-decoration: none font-weight: bold;" value="Date de naissance:" />
			<a4j:outputPanel id="datenaisance" layout="block">
                    <rich:calendar value="#{assureCtrl.newAssure.date_naissance}"
                        locale="fr/FR"
                        popup="true"
                        datePattern="d/MMM/y"
                        showApplyButton="true" cellWidth="24px" cellHeight="22px" style="width:200px"/>
            </a4j:outputPanel>
			<div class="div_near_spacer"></div>
            
            <h:outputText style="color: black;font-family:arial, verdana;
	font-size:14px; text-decoration: none font-weight: bold;" value="Adresse assuré:" />
			
			<h:inputText id="adresse" value="#{assureCtrl.newAssure.adresse}"
				required="false" >
				
			</h:inputText>
			<h:outputText />
			<div class="div_near_spacer"></div>
            
           </h:panelGrid>
           </rich:layoutPanel>
           <rich:layoutPanel position="right">
           <h:panelGrid>
            <h:outputText style="color: black;font-family:arial, verdana;
	font-size:14px; text-decoration: none font-weight: bold;" value="Numéro téléphone:" />
			
			<h:inputText id="numtel" value="#{assureCtrl.newAssure.num_tel}"
				required="false" >
				
			</h:inputText>
			<h:outputText />
			<div class="div_near_spacer"></div>
			<br></br>
			<br></br>
            
           
            <h:commandButton  value="Ajouter" action="#{assureCtrl.createAssure}" />
            
            </h:panelGrid>
			</rich:layoutPanel>
            </rich:layout>
           </h:form>
           </h:panelGrid>
       </rich:panel>    
</body>
</html>
</f:view>