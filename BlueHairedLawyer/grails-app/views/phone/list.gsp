
<%@ page import="bluehairedlawyer.Phone" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'phone.label', default: 'Phone')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-phone" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="phoneNumber" title="${message(code: 'phone.phoneNumber.label', default: 'Phone Number')}" />
			
				<g:sortableColumn property="contactPerson" title="${message(code: 'phone.contactPerson.label', default: 'Contact Person')}" />
			
				<g:sortableColumn property="extension" title="${message(code: 'phone.extension.label', default: 'Extension')}" />
			
				<th><g:message code="phone.person.label" default="Person" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${phoneInstanceList}" status="i" var="phoneInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${phoneInstance.id}">${fieldValue(bean: phoneInstance, field: "phoneNumber")}</g:link></td>
			
				<td>${fieldValue(bean: phoneInstance, field: "contactPerson")}</td>
			
				<td>${fieldValue(bean: phoneInstance, field: "extension")}</td>
			
				<td>${fieldValue(bean: phoneInstance, field: "person")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${phoneInstanceTotal}" />
	</div>
</section>

</body>

</html>
