
<%@ page import="bluehairedlawyer.Address" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-address" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="streetAddress" title="${message(code: 'address.streetAddress.label', default: 'Street Address')}" />
			
				<g:sortableColumn property="number" title="${message(code: 'address.number.label', default: 'Number')}" />
			
				<g:sortableColumn property="city" title="${message(code: 'address.city.label', default: 'City')}" />
			
				<g:sortableColumn property="district" title="${message(code: 'address.district.label', default: 'District')}" />
			
				<g:sortableColumn property="state" title="${message(code: 'address.state.label', default: 'State')}" />
			
				<g:sortableColumn property="zipCode" title="${message(code: 'address.zipCode.label', default: 'Zip Code')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${addressInstanceList}" status="i" var="addressInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${addressInstance.id}">${fieldValue(bean: addressInstance, field: "streetAddress")}</g:link></td>
			
				<td>${fieldValue(bean: addressInstance, field: "number")}</td>
			
				<td>${fieldValue(bean: addressInstance, field: "city")}</td>
			
				<td>${fieldValue(bean: addressInstance, field: "district")}</td>
			
				<td>${fieldValue(bean: addressInstance, field: "state")}</td>
			
				<td>${fieldValue(bean: addressInstance, field: "zipCode")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${addressInstanceTotal}" />
	</div>
</section>

</body>

</html>
