
<%@ page import="bluehairedlawyer.Bank" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'bank.label', default: 'Bank')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-bank" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="agency" title="${message(code: 'bank.agency.label', default: 'Agency')}" />
			
				<g:sortableColumn property="currentAccount" title="${message(code: 'bank.currentAccount.label', default: 'Current Account')}" />
			
				<g:sortableColumn property="currentBalance" title="${message(code: 'bank.currentBalance.label', default: 'Current Balance')}" />
			
				<g:sortableColumn property="initialBalance" title="${message(code: 'bank.initialBalance.label', default: 'Initial Balance')}" />
			
				<g:sortableColumn property="name" title="${message(code: 'bank.name.label', default: 'Name')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${bankInstanceList}" status="i" var="bankInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${bankInstance.id}">${fieldValue(bean: bankInstance, field: "agency")}</g:link></td>
			
				<td>${fieldValue(bean: bankInstance, field: "currentAccount")}</td>
			
				<td>${fieldValue(bean: bankInstance, field: "currentBalance")}</td>
			
				<td>${fieldValue(bean: bankInstance, field: "initialBalance")}</td>
			
				<td>${fieldValue(bean: bankInstance, field: "name")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${bankInstanceTotal}" />
	</div>
</section>

</body>

</html>
