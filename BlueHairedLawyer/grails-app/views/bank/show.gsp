
<%@ page import="bluehairedlawyer.Bank" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'bank.label', default: 'Bank')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-bank" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="bank.agency.label" default="Agency" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: bankInstance, field: "agency")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="bank.currentAccount.label" default="Current Account" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: bankInstance, field: "currentAccount")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="bank.currentBalance.label" default="Current Balance" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: bankInstance, field: "currentBalance")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="bank.initialBalance.label" default="Initial Balance" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: bankInstance, field: "initialBalance")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="bank.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: bankInstance, field: "name")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
