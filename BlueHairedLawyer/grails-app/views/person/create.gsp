<%@ page import="bluehairedlawyer.Person" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	
	<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
	<g:javascript src="jquery.maskedinput-1.1.4.pack.js"/>
</head>

<body>

<section id="create-person" class="first">

	<g:hasErrors bean="${personInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${personInstance}" as="list" />
	</div>
	</g:hasErrors>
	
	<g:form action="save" class="form-horizontal" >
		<fieldset class="form">
			<g:render template="form"/>
		</fieldset>
		<div class="form-actions">
			<g:submitButton name="create" class="btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
		</div>
	</g:form>
	
	<!-- Render the phone template (_phone.gsp) hidden so we can clone it -->
    <g:render template='phone' model="['phone':null,'i':'_clone','hidden':true]"/>
    <!-- Render the phone template (_phone.gsp) hidden so we can clone it -->
	
</section>
		
</body>

</html>
