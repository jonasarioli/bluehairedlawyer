<%@ page import="bluehairedlawyer.Account"%>
<!doctype html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="kickstart" />
<g:set var="entityName"
	value="${message(code: 'account.label', default: 'Account')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
<g:javascript src="jquery.maskedinput-1.1.4.pack.js" />
<g:set var="layout_nosecondarymenu" value="${true}" scope="request" />
</head>

<body>

	<section id="create-account" class="first">

		<g:hasErrors bean="${accountInstance}">
			<div class="alert alert-error">
				<g:renderErrors bean="${accountInstance}" as="list" />
			</div>
		</g:hasErrors>

		<g:form action="save" class="form-horizontal">
			<fieldset class="form">
				<g:if test="${params.isHonorarium}">
					<g:render template="addHonorarium" />
				</g:if>
				<g:elseif test="${params.isLawsuitCost}">
					<g:render template="addLawsuitCost" />
				</g:elseif>
				<g:else>
					<g:render template="addHonorarium" />
				</g:else>
			</fieldset>
			<div class="form-actions">
				<g:submitButton name="create" class="btn btn-primary"
					value="${message(code: 'default.button.create.label', default: 'Create')}" />
				<button class="btn" type="reset">
					<g:message code="default.button.reset.label" default="Reset" />
				</button>
				<g:link class="btn" controller="lawsuits" action="show"
					id="${lawsuitsId}">
					${message(code: 'default.button.back.label', default: 'Back')}
				</g:link>
			</div>
		</g:form>

	</section>

</body>

</html>
