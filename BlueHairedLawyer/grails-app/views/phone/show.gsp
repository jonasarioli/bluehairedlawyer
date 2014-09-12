
<%@ page import="bluehairedlawyer.Phone"%>
<!doctype html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="kickstart" />
<g:set var="entityName"
	value="${message(code: 'phone.label', default: 'Phone')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
<g:set var="layout_nosecondarymenu" value="${true}" scope="request" />
</head>

<body>

	<ul id="Menu" class="nav nav-pills">
		<li><g:link class="create" action="edit" id="${phoneInstance.id}">
				<i class="icon-pencil"></i>
				<g:message code="phone.edit.label" default="Edit Phone" />
			</g:link></li>
		<sec:ifAnyGranted roles="ROLE_ADMIN">
			<li class=""><g:render template="/_common/modals/deleteTextLink" />
			</li>
		</sec:ifAnyGranted>
	</ul>

	<section id="show-phone" class="first">

		<table class="table">
			<tbody>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="phone.phoneNumber.label" default="Phone Number" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: phoneInstance, field: "phoneNumber")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="phone.contactPerson.label" default="Contact Person" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: phoneInstance, field: "contactPerson")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="phone.extension.label" default="Extension" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: phoneInstance, field: "extension")}
					</td>

				</tr>
<%--
				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="phone.person.label" default="Person" /></td>

					<td valign="top" class="value"><g:link controller="person"
							action="show" id="${phoneInstance?.person?.id}">
							${phoneInstance?.person?.encodeAsHTML()}
						</g:link></td>

				</tr>
 --%>
			</tbody>
		</table>
	</section>

	<g:form class="form-horizontal">
		<g:link class="btn btn-primary" controller="person" action="show"
			id="${phoneInstance?.person?.id}">
			${message(code: 'default.button.back.label', default: 'Back')}
		</g:link>
	</g:form>

</body>

</html>
