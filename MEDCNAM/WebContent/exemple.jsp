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
    
     <title>s'authentifier</title>
     
    </head>
<body>
   <h2 align="center"  >MENU PRINCIPAL</h2>
   
<rich:tabPanel >
		<rich:tab label="Ajout des factures">
         
          <rich:panel>
		        <f:facet name="header" ><h:outputText value="Saisir Une Facture"></h:outputText></f:facet>
    
    <h:panelGrid>
   <h:form> 
   <rich:layout> 
       <rich:layoutPanel position="left">
	        <h:panelGrid>
	              
        <h:outputText  value="Ordre de la facture:" />
			<h:inputText id="ordrefacture" value="#{factureCtrl.newFacture.ordre_facture}"
				required="false"  />
				
				<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{factureCtrl.messageValordrefacture}"></h:outputLabel>
			<h:outputText />
        <div class="div_near_spacer"></div>
        
         <h:outputText value="Nom du malade:" />
			<h:inputText id="nommalade" value="#{factureCtrl.newFacture.nom}"
				required="false"  />
			<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{factureCtrl.messageValnom}"></h:outputLabel>
			<h:outputText />
        <div class="div_near_spacer"></div>
        
        <h:outputText value="Prénom du malade:" />
			<h:inputText id="prénommalade" value="#{factureCtrl.newFacture.prenom}"
				required="false"  />
				<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{factureCtrl.messageValprenom}"></h:outputLabel>
			<h:outputText />
			        <div class="div_near_spacer"></div>
        
        <h:outputText value="Montant à régler avec la CNAM:" />
        <h:inputText id="montàregleraveclacnam" value="#{factureCtrl.newFacture.montant_a_regler}"
				required="false" >
			
				</h:inputText>
			<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{factureCtrl.messageValMontcnam}"></h:outputLabel>
			
			<h:outputText />
			<div class="div_near_spacer"></div>
        </h:panelGrid>
		</rich:layoutPanel>
        
        <rich:layoutPanel position="center">
		<h:panelGrid>
        <h:outputText value="Code médecin de la famille:" />
			<h:inputText id="codemedecin" value="#{factureCtrl.newFacture.code_medecin_famille}"
				required="false"  />
			<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{factureCtrl.messageValcodeconv}"></h:outputLabel>
			<h:outputText />
        <div class="div_near_spacer"></div>
        
		<h:outputText value="Date de naissance du malade:" />
			<a4j:outputPanel id="birthDay" layout="block">
                    <rich:calendar value="#{factureCtrl.newFacture.date_naissance_malade}"
                        locale="fr/FR"
                        popup="true"
                        datePattern="d/MMM/y"
                        showApplyButton="true" cellWidth="24px" cellHeight="22px" style="width:200px"/>
            </a4j:outputPanel>
            <h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{factureCtrl.messageValdatenaissance}"></h:outputLabel>
			<h:outputText />
			<div class="div_near_spacer"></div>
			
		
		<h:outputText value="Date de prescription:" />
			<a4j:outputPanel id="dateprescr" layout="block">
                    <rich:calendar value="#{factureCtrl.newFacture.date_prescription}"
                        locale="fr/FR"
                        popup="true"
                        datePattern="d/MMM/y"
                        showApplyButton="true" cellWidth="24px" cellHeight="22px" style="width:200px"/>
            </a4j:outputPanel>
            <h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{factureCtrl.messageValdatepresc}"></h:outputLabel>
			<h:outputText />
			<div class="div_near_spacer"></div>
			
			
			
		</h:panelGrid>
		
		</rich:layoutPanel>
		
		<rich:layoutPanel position="right">
		
		<h:panelGrid>
		
		<h:outputText value="Total de facture:" />
			
			<h:inputText id="totalfacture" value="#{factureCtrl.newFacture.total_facture}"
				required="false" >
		
				</h:inputText>
			
			<h:outputText />
			<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{factureCtrl.messageValtotalfacture}"></h:outputLabel>
			<h:outputText />
			<div class="div_near_spacer"></div>
		
		<h:outputText value="Montant de consultation:" />
			
			<h:inputText id="montantconsl" value="#{factureCtrl.newFacture.montant_consultation}"
				required="false" >
				
				</h:inputText>
			
			
			<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{factureCtrl.messageValMontantCnsultation}"></h:outputLabel>
			<h:outputText />
			<div class="div_near_spacer"></div>
		
		<h:outputText value="Total ticket modérateur:" />
			
			<h:inputText id="totalticketmod" value="#{factureCtrl.newFacture.total_ticket_moderateur}"
				required="false" >
			</h:inputText>
			<h:outputText />
			
			<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{factureCtrl.messageValticketmoderateur}"></h:outputLabel>
			<h:outputText />
			<div class="div_near_spacer"></div>
			<br></br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
		  <h:commandButton  value="Ajouter" action="#{factureCtrl.createFacture}" />
    
			
			</h:panelGrid>
		 </rich:layoutPanel>
		 

	
	</rich:layout>
	</h:form>
  </h:panelGrid>
		
	 </rich:panel>
 </rich:tab>
		<rich:tab label="Ajout des décomptes ">
           <rich:panel>
		        <f:facet name="header" ><h:outputText value="Saisir un Décompte"/></f:facet>
          <h:panelGrid>
     <h:form>
     <rich:layout>
      
      <rich:layoutPanel position="left">
      <h:panelGrid>           
        <h:outputText value="Numéro du décompte:" />
			<h:inputText id="numdecompte" value="#{decompteCtrl.newDecompte.num_decompte}"
				required="false"  />
			<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{decompteCtrl.messageValnumdecompte}"></h:outputLabel>
			<h:outputText />
        <div class="div_near_spacer"></div>
       
       <h:outputText value="Réference du décompte:" />
			<h:inputText id="refdecompte" value="#{decompteCtrl.newDecompte.ref_decompte}"
				required="false"  />
			<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{decompteCtrl.messageValrefdecompte}"></h:outputLabel>
			<h:outputText />
        <div class="div_near_spacer"></div>
        
        <h:outputText value="Nombre de factures:" />
			<h:inputText id="nombrefactures" value="#{decompteCtrl.newDecompte.nb_factures}"
				required="false"  />
			<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{decompteCtrl.messageValnbfacture}"></h:outputLabel>
			<h:outputText />
        <div class="div_near_spacer"></div>
        
        
          </h:panelGrid>
          </rich:layoutPanel>
          <rich:layoutPanel position="center">
          <h:panelGrid>
          <h:outputText value="Date de fin période:" />
			<a4j:outputPanel id="datefinperiode" layout="block">
                    <rich:calendar value="#{decompteCtrl.newDecompte.date_fin_periode}"
                        locale="fr/FR"
                        popup="true"
                        datePattern="d/MMM/y"
                        showApplyButton="true" cellWidth="24px" cellHeight="22px" style="width:200px"/>
            </a4j:outputPanel>
            <h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{decompteCtrl.messageValdatefinper}"></h:outputLabel>
			<h:outputText />
			<div class="div_near_spacer"></div>
			
			<h:outputText value="Date du dépot:" />
			<a4j:outputPanel id="datedepot" layout="block">
                    <rich:calendar value="#{decompteCtrl.newDecompte.date_depot}"
                        locale="fr/FR"
                        popup="true"
                        datePattern="d/MMM/y"
                        showApplyButton="true" cellWidth="24px" cellHeight="22px" style="width:200px"/>
            </a4j:outputPanel>
            <h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{decompteCtrl.messageValdatedepot}"></h:outputLabel>
			<h:outputText />
			<div class="div_near_spacer"></div>
        
        <h:outputText value="Montant avec la CNAM:" />
			
			<h:inputText id="montàregler" value="#{decompteCtrl.newDecompte.montant_a_regler_CNAM}"
				required="false" >
				
				</h:inputText>
			<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{decompteCtrl.messageValmontcnam}"></h:outputLabel>
			<h:outputText />
			<div class="div_near_spacer"></div>
         
			
		
		</h:panelGrid>
		</rich:layoutPanel>
		<rich:layoutPanel position="right">
		<h:panelGrid>	
		<h:outputText value="Total décompte:" />
			
			<h:inputText id="totaldecompte" value="#{decompteCtrl.newDecompte.total_decompte}"
				required="false" >
				
				</h:inputText>
			
			<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{decompteCtrl.messageValtotdecompte}"></h:outputLabel>
			<h:outputText />
			<div class="div_near_spacer"></div>
			
			<h:outputText value="Total ticket modérateur:" />
			
			<h:inputText id="totalticketmod" value="#{decompteCtrl.newDecompte.total_ticket_moderateur}"
				required="false" >
				
				</h:inputText>
				<h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{decompteCtrl.messageValticketmoderateur}"></h:outputLabel>
			<h:outputText />
			<div class="div_near_spacer"></div>
			
			<h:outputText value="Date du début période:" />
			<a4j:outputPanel id="datedebutperiode" layout="block">
                    <rich:calendar value="#{decompteCtrl.newDecompte.date_debut_periode}"
                        locale="fr/FR"
                        popup="true"
                        datePattern="d/MMM/y"
                        showApplyButton="true" cellWidth="24px" cellHeight="22px" style="width:200px"/>
            </a4j:outputPanel>
            <h:outputLabel style="color: red;font-family:arial, verdana;
	font-size:12px; text-decoration: none font-weight: bold;" value="#{decompteCtrl.messageValdatedebutper}"></h:outputLabel>
			<h:outputText />
			<div class="div_near_spacer"></div>
			<br></br>
				
         <h:commandButton value="Ajouter" action="#{decompteCtrl.createDecompte}" /> 
      
			
		</h:panelGrid>
		</rich:layoutPanel>			
		
		
      </rich:layout>
      </h:form>
      </h:panelGrid>
  </rich:panel>   
        </rich:tab>
		<rich:tab label="Recherche">
            <rich:panelBar height="300" width="700">
		<rich:panelBarItem label="Recherche Médecin">            
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
        </rich:panelBarItem>
		<rich:panelBarItem label="Recherche Bureau régional">            
     		<rich:panel>
			<rich:extendedDataTable height="350px" width="675" value="#{bureauCtrl.bureau_regs}"
				var="b" id="table2" sortMode="single" selectionMode="single"
				selection="#{bureauCtrl.selection}" binding="#{bureauCtrl.table}">


				<rich:column sortable="true" sortBy="#{b.nom_bureau}"
					filterBy="#{b.nom_bureau}" filterEvent="onkeyup" width="170px"
					label="nom bureau">
					
			<f:facet name="header">
						<h:outputText value="Nom bureau" />
					</f:facet>
					<h:outputText value="#{b.nom_bureau}" />
					
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.adresse}"
					width="170px"
					label="adresse">
					<f:facet name="header">
						<h:outputText value="Adresse" />
					</f:facet>
					<h:outputText value="#{b.adresse}" />
				</rich:column>

				<rich:column sortable="true" sortBy="#{b.num_tel}"
					 width="170px"
					label="numéro téléphone">
					<f:facet name="header">
						<h:outputText value="Numéro téléphone" />
					</f:facet>
					<h:outputText value="#{b.num_tel}">
						
					</h:outputText>
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.num_fax}"
					 width="170px"
					label="numéro fax">
					<f:facet name="header">
						<h:outputText value="Numéro fax" />
					</f:facet>
					<h:outputText value="#{b.num_tel}">
						
					</h:outputText>
				</rich:column>
				
				<a4j:support event="onselectionchange" reRender="restable"
					ajaxSingle="true" action="#{bureauCtrl.takeSelection}"></a4j:support>
				

			</rich:extendedDataTable>
		</rich:panel>

		<rich:panel id="restable2">
			<f:facet name="header">
				<h:outputText value="Bureau selected" />
			</f:facet>
			<rich:dataGrid columns="1" value="#{bureauCtrl.selectedBureau_regs}"
				var="cap" rendered="#{not empty bureauCtrl.selectedBureau_regs}">
				<h:outputText value="nom bureau: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.nom_bureau}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="adresse: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.adresse}" />
				<div class="div_near_spacer"></div>

				<h:outputText value="numéro téléphone: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.num_tel}" />
				<div class="div_near_spacer"></div>

				<h:outputText value="numéro fax:" styleClass="label"></h:outputText>
				<h:outputText value="#{cap.num_fax}" />
				<div class="div_near_spacer"></div>

				
			</rich:dataGrid>
			
			
</rich:panel>
        </rich:panelBarItem>
        
        <rich:panelBarItem label="Recherche Assuré">
        
        		<rich:panel>
			<rich:extendedDataTable height="350px" width="1170" value="#{assureCtrl.assures}"
				var="b" id="table3" sortMode="single" selectionMode="single"
				selection="#{assureCtrl.selection}" binding="#{assureCtrl.table}">


				<rich:column sortable="true" sortBy="#{b.nom_assure}"
					filterBy="#{b.nom_assure}" filterEvent="onkeyup" width="170px"
					label="nom assuré">
					
			<f:facet name="header">
						<h:outputText value="Nom assuré" />
					</f:facet>
					<h:outputText value="#{b.nom_assure}" />
					
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.prenom_assure}"
					filterBy="#{b.prenom_assure}" filterEvent="onkeyup" width="170px"
					label="prénom assuré">
					<f:facet name="header">
						<h:outputText value="Prénom assuré" />
					</f:facet>
					<h:outputText value="#{b.prenom_assure}" />
				</rich:column>

				<rich:column sortable="true" sortBy="#{b.code_caisse}"
					filterBy="#{b.code_caisse}" filterEvent="onkeyup" width="170px"
					label="code caisse">
					<f:facet name="header">
						<h:outputText value="Code caisse" />
					</f:facet>
					<h:outputText value="#{b.code_caisse}">
						
					</h:outputText>
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.matricule_assure}"
					 width="170px"
					label="matricule assuré">
					<f:facet name="header">
						<h:outputText value="Matricule assuré" />
					</f:facet>
					<h:outputText value="#{b.matricule_assure}">
						
					</h:outputText>
				</rich:column>
				
				<rich:column sortable="true" sortBy="#{b.adresse}"
					 width="170px"
					label="adresse">
					<f:facet name="header">
						<h:outputText value="Adresse assuré" />
					</f:facet>
					<h:outputText value="#{b.adresse}">
						
					</h:outputText>
				</rich:column>
				
				<rich:column sortable="true" sortBy="#{b.num_tel}"
					width="170px"
					label="num tel assuré">
					<f:facet name="header">
						<h:outputText value="Numéro téléphone" />
					</f:facet>
					<h:outputText value="#{b.num_tel}">
						
					</h:outputText>
				</rich:column>
				
				<rich:column sortable="true" sortBy="#{b.date_naissance}"
					 width="170px"
					label="date de naissance">
					<f:facet name="header">
						<h:outputText value="Date de naissance" />
					</f:facet>
					<h:outputText value="#{b.date_naissance}">
						<f:convertDateTime dateStyle="default" />
					</h:outputText>
				</rich:column>
				
				<a4j:support event="onselectionchange" reRender="restable"
					ajaxSingle="true" action="#{assureCtrl.takeSelection}"></a4j:support>
				

			</rich:extendedDataTable>
		</rich:panel>

		<rich:panel id="restable3">
			<f:facet name="header">
				<h:outputText value="Assuré selected" />
			</f:facet>
			<rich:dataGrid columns="1" value="#{assureCtrl.selectedAssures}"
				var="cap" rendered="#{not empty assureCtrl.selectedAssures}">
				<h:outputText value="nom assuré: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.nom_assure}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="prénom assuré: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.prenom_assure}" />
				<div class="div_near_spacer"></div>

				<h:outputText value="code caisse: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.code_caisse}" />
				<div class="div_near_spacer"></div>

				<h:outputText value="matricule assuré:" styleClass="label"></h:outputText>
				<h:outputText value="#{cap.matricule_assure}" />
				<div class="div_near_spacer"></div>
				
				<h:outputText value="adresse:" styleClass="label"></h:outputText>
				<h:outputText value="#{cap.adresse}" />
				<div class="div_near_spacer"></div>
				
				<h:outputText value="num tel assuré:" styleClass="label"></h:outputText>
				<h:outputText value="#{cap.num_tel}" />
				<div class="div_near_spacer"></div>
				
				<h:outputText value="Date de naissance: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.date_naissance}" />
				<div class="div_near_spacer"></div>
				

			</rich:dataGrid>
</rich:panel>
        </rich:panelBarItem>
        
        <rich:panelBarItem label="Recherche Bénéficier">
        
        <rich:panel>
			<rich:extendedDataTable height="350px" width="1170" value="#{beneficierCtrl.beneficiers}"
				var="b" id="table4" sortMode="single" selectionMode="single"
				selection="#{beneficierCtrl.selection}" binding="#{beneficierCtrl.table}">


				<rich:column sortable="true" sortBy="#{b.nom}"
					filterBy="#{b.nom}" filterEvent="onkeyup" width="170px"
					label="nom ">
					
			<f:facet name="header">
						<h:outputText value="Nom bénéficier" />
					</f:facet>
					<h:outputText value="#{b.nom}" />
					
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.prenom}"
					filterBy="#{b.prenom}" filterEvent="onkeyup" width="170px"
					label="prénom ">
					<f:facet name="header">
						<h:outputText value="Prénom bénéficier" />
					</f:facet>
					<h:outputText value="#{b.prenom}" />
				</rich:column>

				<rich:column sortable="true" sortBy="#{b.rang_malade}"
					 width="170px"
					label="rang malade">
					<f:facet name="header">
						<h:outputText value="Rang malade" />
					</f:facet>
					<h:outputText value="#{b.rang_malade}">
						
					</h:outputText>
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.lien_parente}"
					 width="170px"
					label="lien parenté">
					<f:facet name="header">
						<h:outputText value="Lien parenté" />
					</f:facet>
					<h:outputText value="#{b.lien_parente}">
						
					</h:outputText>
				</rich:column>
				
				<rich:column sortable="true" sortBy="#{b.adresse}"
					 width="170px"
					label="adresse">
					<f:facet name="header">
						<h:outputText value="Adresse bénéficier" />
					</f:facet>
					<h:outputText value="#{b.adresse}">
						
					</h:outputText>
				</rich:column>
				
				<rich:column sortable="true" sortBy="#{b.num_tel}"
					 width="170px"
					label="num tel assuré">
					<f:facet name="header">
						<h:outputText value="Numéro téléphone" />
					</f:facet>
					<h:outputText value="#{b.num_tel}">
						
					</h:outputText>
				</rich:column>
				
				<rich:column sortable="true" sortBy="#{b.date_naissance}"
					 width="170px"
					label="date de naissance">
					<f:facet name="header">
						<h:outputText value="Date de naissance" />
					</f:facet>
					<h:outputText value="#{b.date_naissance}">
						<f:convertDateTime dateStyle="default" />
					</h:outputText>
				</rich:column>
				
				<a4j:support event="onselectionchange" reRender="restable"
					ajaxSingle="true" action="#{beneficierCtrl.takeSelection}"></a4j:support>
				

			</rich:extendedDataTable>
		</rich:panel>

		<rich:panel id="restable4">
			<f:facet name="header">
				<h:outputText value="Bénéficier selected" />
			</f:facet>
			<rich:dataGrid columns="1" value="#{beneficierCtrl.selectedBeneficiers}"
				var="cap" rendered="#{not empty beneficierCtrl.selectedBeneficiers}">
				<h:outputText value="nom bénéficier: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.nom}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="prénom bénéficier: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.prenom}" />
				<div class="div_near_spacer"></div>

				<h:outputText value="rang malde: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.rang_malade}" />
				<div class="div_near_spacer"></div>

				<h:outputText value="lien parenté:" styleClass="label"></h:outputText>
				<h:outputText value="#{cap.lien_parente}" />
				<div class="div_near_spacer"></div>
				
				<h:outputText value="adresse:" styleClass="label"></h:outputText>
				<h:outputText value="#{cap.adresse}" />
				<div class="div_near_spacer"></div>
				
				<h:outputText value="num tel assuré:" styleClass="label"></h:outputText>
				<h:outputText value="#{cap.num_tel}" />
				<div class="div_near_spacer"></div>
				
				<h:outputText value="Date de naissance: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.date_naissance}" />
				<div class="div_near_spacer"></div>
				

			</rich:dataGrid>
			
</rich:panel>
        </rich:panelBarItem>
        
        <rich:panelBarItem label="Recherche Acte">
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
        </rich:panelBarItem>
        
        <rich:panelBarItem label="Recherche APCI">
        <rich:panel>
			<rich:extendedDataTable height="350px" width="340" value="#{apciCtrl.APCIs}"
				var="b" id="table6" sortMode="single" selectionMode="single"
				selection="#{apciCtrl.selection}" binding="#{apciCtrl.table}">


				<rich:column sortable="true" sortBy="#{b.nom}"
					filterBy="#{b.nom}" filterEvent="onkeyup" width="170px"
					label="nom apci ">
					
			<f:facet name="header">
						<h:outputText value="Nom APCI" />
					</f:facet>
					<h:outputText value="#{b.nom}" />
					
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.code}"
					filterBy="#{b.code}" filterEvent="onkeyup" width="170px"
					label="code apci ">
					<f:facet name="header">
						<h:outputText value="Code APCI" />
					</f:facet>
					<h:outputText value="#{b.code}" />
				</rich:column>

				
				
				<a4j:support event="onselectionchange" reRender="restable"
					ajaxSingle="true" action="#{apciCtrl.takeSelection}"></a4j:support>
				

			</rich:extendedDataTable>
		</rich:panel>

		<rich:panel id="restable6">
			<f:facet name="header">
				<h:outputText value="APCI selected" />
			</f:facet>
			<rich:dataGrid columns="1" value="#{apciCtrl.selectedAPCIs}"
				var="cap" rendered="#{not empty apciCtrl.selectedAPCIs}">
				<h:outputText value="nom apci: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.nom}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="code apci: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.code}" />
				<div class="div_near_spacer"></div>

				

				

			</rich:dataGrid>
			
</rich:panel>
        </rich:panelBarItem>
        
        
        
        <rich:panelBarItem label="Recherche Facture">
        		<rich:panel>
			<rich:extendedDataTable height="350px" width="1000" value="#{factureCtrl.factures}"
				var="b" id="table8" sortMode="single" selectionMode="single"
				selection="#{factureCtrl.selection}" binding="#{factureCtrl.table}">


				<rich:column sortable="true" sortBy="#{b.nom}"
					filterBy="#{b.nom}" filterEvent="onkeyup" width="170px"
					label="nom malade ">
					
			<f:facet name="header">
						<h:outputText value="Nom malade" />
					</f:facet>
					<h:outputText value="#{b.nom}" />
					
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.prenom}"
					filterBy="#{b.prenom}" filterEvent="onkeyup" width="170px"
					label="prénom malade ">
					<f:facet name="header">
						<h:outputText value="Prénom malade" />
					</f:facet>
					<h:outputText value="#{b.prenom}" />
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.ordre_facture}"
					width="170px"
					label="ordre facture ">
					<f:facet name="header">
						<h:outputText value="Ordre facture" />
					</f:facet>
					<h:outputText value="#{b.ordre_facture}" />
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.date_naissance_malade}"
					 width="170px"
					label="date naissance ">
					<f:facet name="header">
						<h:outputText value="Date naissance" />
					</f:facet>
					<h:outputText value="#{b.date_naissance_malade}" />
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.code_medecin_famille}"
					 width="170px"
					label="code médecin famille ">
					<f:facet name="header">
						<h:outputText value="Code medecin" />
					</f:facet>
					<h:outputText value="#{b.code_medecin_famille}" />
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.date_prescription}"
					width="170px"
					label="date prescription ">
					<f:facet name="header">
						<h:outputText value="Date prescription" />
					</f:facet>
					<h:outputText value="#{b.date_prescription}" />
				</rich:column>

				<a4j:support event="onselectionchange" reRender="restable"
					ajaxSingle="true" action="#{factureCtrl.takeSelection}"></a4j:support>
				

			</rich:extendedDataTable>
		</rich:panel>

		<rich:panel id="restable8">
			<f:facet name="header">
				<h:outputText value="Facture selected" />
			</f:facet>
			<rich:dataGrid columns="1" value="#{factureCtrl.selectedFactures}"
				var="cap" rendered="#{not empty factureCtrl.selectedFactures}">
				<h:outputText value="nom malade: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.nom}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="prénom malade: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.prenom}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="ordre facture: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.ordre_facture}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="date naissance: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.date_naissance_malade}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="code médecin famille: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.code_medecin_famille}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="date prescription: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.date_prescription}" />
				<div class="div_near_spacer"></div>

				<h:commandButton value="Modifier" type="submit"
	 				action="#{factureCtrl.editFacture}" /> 
				
				<h:commandButton value="supprimer" type="submit"
	 				action="#{factureCtrl.deleteFacture}" />

			</rich:dataGrid>
			
</rich:panel>
        </rich:panelBarItem>
        
        <rich:panelBarItem label="Recherche Décompte">
        		<rich:panel>
			<rich:extendedDataTable height="350px" width="900" value="#{decompteCtrl.decomptes}"
				var="b" id="table9" sortMode="single" selectionMode="single"
				selection="#{decompteCtrl.selection}" binding="#{decompteCtrl.table}">


				<rich:column sortable="true" sortBy="#{b.num_decompte}"
					filterBy="#{b.num_decompte}" filterEvent="onkeyup" width="150px"
					label="numéro décompte ">
					
			<f:facet name="header">
						<h:outputText value="Numéro décompte" />
					</f:facet>
					<h:outputText value="#{b.num_decompte}" />
					
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.ref_decompte}"
					filterBy="#{b.ref_decompte}" filterEvent="onkeyup" width="150px"
					label="référence décompte ">
					<f:facet name="header">
						<h:outputText value="Référence décompte" />
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
					 
					label="date dépot ">
					<f:facet name="header">
						<h:outputText value="Date dépot" />
					</f:facet>
					<h:outputText value="#{b.date_depot}" />
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.date_debut_periode}" width="150px"
					 
					label="date debut période ">
					<f:facet name="header">
						<h:outputText value="Date début periode" />
					</f:facet>
					<h:outputText value="#{b.date_debut_periode}" />
				</rich:column>
				<rich:column sortable="true" sortBy="#{b.date_fin_periode}" width="150px"
					
					label="date fin période ">
					<f:facet name="header">
						<h:outputText value="Date fin période" />
					</f:facet>
					<h:outputText value="#{b.date_fin_periode}" />
				</rich:column>

				<a4j:support event="onselectionchange" reRender="restable"
					ajaxSingle="true" action="#{decompteCtrl.takeSelection}"></a4j:support>
				

			</rich:extendedDataTable>
		</rich:panel>

		<rich:panel id="restable9" >
			<f:facet name="header">
				<h:outputText value="Décompte selected" />
			</f:facet>
			<rich:dataGrid columns="6" value="#{decompteCtrl.selectedDecomptes}" 
				var="cap" rendered="#{not empty decompteCtrl.selectedDecomptes}">
				<h:outputText value="numéro décompte: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.num_decompte}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="référence décompte: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.ref_decompte}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="nombre factures: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.nb_factures}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="date dépot: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.date_depot}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="date début période: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.date_debut_periode}" />
				<div class="div_near_spacer"></div>
				<h:outputText value="date fin période: " styleClass="label"></h:outputText>
				<h:outputText value="#{cap.date_fin_periode}" />
				<div class="div_near_spacer"></div>

				<h:commandButton value="Modifier" type="submit"
	 				action="#{decompteCtrl.editDecompte}" /> 
				
				<h:commandButton value="supprimer" type="submit"
	 				action="#{decompteCtrl.deleteDecompte}" />

			</rich:dataGrid>
			
</rich:panel>
        </rich:panelBarItem>
        
        <rich:panelBarItem  label="Recherche Acte Facturé">
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
        </rich:panelBarItem>
        
        
        
	</rich:panelBar>
    </rich:tab>
    
   <rich:tab label="Listing" >
  
             <rich:panel>
   <h:panelGrid width="625">
      <rich:layout>
         <rich:layoutPanel position="top" width="100">
		<h3  align="center">Afficher la liste des entitités</h3>
	  </rich:layoutPanel>
	  <rich:layoutPanel position="left">
	       <h:panelGrid>
	     <rich:panelMenu  width="200" mode="ajax"
	        iconExpandedGroup="disc" iconCollapsedGroup="disc"
		iconExpandedTopGroup="chevronUp" iconGroupTopPosition="right"
		iconCollapsedTopGroup="chevronDown"	>
	       
	      
	       
	       
	        <rich:panelMenuGroup label="Afficher la liste des actes">
		   <rich:panelMenuItem ><a href="listingacte.jsf">Afficher la liste des actes</a></rich:panelMenuItem>
	        </rich:panelMenuGroup>
	        
	        <rich:panelMenuGroup label="Afficher la liste des bureaux" >
		   <rich:panelMenuItem ><a href="listingbureaux.jsf">Afficher la liste des bureaux</a></rich:panelMenuItem>
		   </rich:panelMenuGroup>
		   
		<rich:panelMenuGroup  label="Afficher la liste des assurés">
		   <rich:panelMenuItem ><a href="listingassure.jsf">Afficher la liste des assurés</a></rich:panelMenuItem>
	        </rich:panelMenuGroup>
		
		
	        </rich:panelMenu>
		</h:panelGrid>
		</rich:layoutPanel>
		<rich:layoutPanel position="center">
		<h:panelGrid>
		<rich:panelMenu width="200" mode="ajax"
	        iconExpandedGroup="disc" iconCollapsedGroup="disc"
		iconExpandedTopGroup="chevronUp" iconGroupTopPosition="right"
		iconCollapsedTopGroup="chevronDown"	>		
		
		
		<rich:panelMenuGroup label="Afficher la liste des actes facturés">
		   <rich:panelMenuItem ><a href="listingacte_facture.jsf">Afficher la liste des actes facturés</a></rich:panelMenuItem>
	        </rich:panelMenuGroup>
		
		<rich:panelMenuGroup label="Afficher la liste des factures">
		   <rich:panelMenuItem ><a href="listingfacture.jsf">Afficher la liste des factures</a></rich:panelMenuItem>
	        </rich:panelMenuGroup>
		
		<rich:panelMenuGroup label="Afficher la liste des décomptes">
		   <rich:panelMenuItem ><a href="listingdecompte.jsf">Afficher la liste des décomptes</a></rich:panelMenuItem>
	        </rich:panelMenuGroup>
	        
	       
	        </rich:panelMenu>
		</h:panelGrid>
		</rich:layoutPanel>
		
	     <rich:layoutPanel position="right">
		<h:panelGrid>
		<rich:panelMenu  width="200" mode="ajax"
	        iconExpandedGroup="disc" iconCollapsedGroup="disc"
		iconExpandedTopGroup="chevronUp" iconGroupTopPosition="right"
		iconCollapsedTopGroup="chevronDown"	>		
		
		<rich:panelMenuGroup label="Afficher la liste des APCIs">
		   <rich:panelMenuItem ><a href="listingapci.jsf">Afficher la liste des APCIs</a></rich:panelMenuItem>
	        </rich:panelMenuGroup>
		<rich:panelMenuGroup label="Afficher la liste des bénéficiers">
		   <rich:panelMenuItem ><a href="listingbenefcier.jsf">Afficher la liste des bénéficiers</a></rich:panelMenuItem>
	        </rich:panelMenuGroup>
	        <rich:panelMenuGroup label="Afficher la liste des médecins">
		   <rich:panelMenuItem ><a href="listingmedecins.jsf">Afficher la liste des médecins</a></rich:panelMenuItem>
	        </rich:panelMenuGroup>
	        </rich:panelMenu>
		</h:panelGrid>
		</rich:layoutPanel>
		
  </rich:layout>
  </h:panelGrid>
 
 
	     
 
 
 
  </rich:panel>
 
  </rich:tab> 
    
   
</rich:tabPanel>
  
</body>
</html>
</f:view>