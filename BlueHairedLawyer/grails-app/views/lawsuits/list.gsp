
<%@ page import="bluehairedlawyer.Lawsuits" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'lawsuits.label', default: 'Lawsuits')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-lawsuits" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="number" title="${message(code: 'lawsuits.number.label', default: 'Number')}" />
			
				<th><g:message code="lawsuits.client.label" default="Client" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${lawsuitsInstanceList}" status="i" var="lawsuitsInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${lawsuitsInstance.id}">${fieldValue(bean: lawsuitsInstance, field: "number")}</g:link></td>
			
				<td>${fieldValue(bean: lawsuitsInstance, field: "client")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${lawsuitsInstanceTotal}" />
	</div>
</section>

</body>

</html>
