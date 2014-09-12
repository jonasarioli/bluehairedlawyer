
<%@ page import="bluehairedlawyer.Address" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
	<g:set var="layout_nosecondarymenu" value="${true}" scope="request" />
</head>

<body>
			<ul id="Menu" class="nav nav-pills">
                <li><g:link class="create" action="edit" id="${addressInstance.id}"><i class="icon-pencil"></i>
                        <g:message code="address.edit.label" default="Edit Address" />
                    </g:link>
                </li>
                <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <li class="">
                        <g:render template="/_common/modals/deleteTextLink"/>
                    </li>
                </sec:ifAnyGranted>
            </ul>

<section id="show-address" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="address.streetAddress.label" default="Street Address" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: addressInstance, field: "streetAddress")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="address.number.label" default="Number" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: addressInstance, field: "number")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="address.city.label" default="City" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: addressInstance, field: "city")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="address.district.label" default="District" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: addressInstance, field: "district")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="address.state.label" default="State" /></td>
				
				<td valign="top" class="value">${addressInstance?.state?.encodeAsHTML()}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="address.zipCode.label" default="Zip Code" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: addressInstance, field: "zipCode")}</td>
				
			</tr>
		<%-- 
			<tr class="prop">
				<td valign="top" class="name"><g:message code="address.person.label" default="Person" /></td>
				
				<td valign="top" class="value"><g:link controller="person" action="show" id="${addressInstance?.person?.id}">${addressInstance?.person?.encodeAsHTML()}</g:link></td>
				
			</tr>
		--%>
		
		</tbody>
	</table>
</section>

	<g:form class="form-horizontal" >
       <g:link class="btn btn-primary" controller="person" action="show" id="${addressInstance?.person?.id}">${message(code: 'default.button.back.label', default: 'Back')}</g:link>
    </g:form>

</body>

</html>
