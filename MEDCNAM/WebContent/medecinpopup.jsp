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
    
     <title>popup</title>
     
    </head>
<body>

<rich:modalPanel id="pnl">

      <f:facet name="header">

            <h:outputText value="I'm panel header" />

      </f:facet>

      <p>The  accepts different types of information: from simple text to iterative components such as  etc.

      </p>

      <a onclick="Richfaces.hideModalPanel('pnl');" href="#">Hide ModalPanel</a>

</rich:modalPanel>
</body>
</html>
</f:view>