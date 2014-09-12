
<%@ page import="bluehairedlawyer.Account"%>
<!doctype html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="kickstart" />
<g:set var="entityName"
	value="${message(code: 'account.label', default: 'Account')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
<g:set var="layout_nosecondarymenu" value="${true}" scope="request" />
</head>

<body>
	<ul id="Menu" class="nav nav-pills">
		<sec:ifAnyGranted roles="ROLE_ADMIN">
			<li class=""><g:render template="/_common/modals/deleteTextLink" model="['backToLawsuit': backToLawsuit]" />
			</li>
		</sec:ifAnyGranted>
	</ul>
	<section id="show-account" class="first">

		<table class="table">
			<tbody>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="account.accountType.label" default="Account Type" /></td>

					<td valign="top" class="value">
						${accountInstance?.accountType?.value.encodeAsHTML()}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="account.bank.label" default="Bank" /></td>

					<td valign="top" class="value"><g:link controller="bank"
							action="show" id="${accountInstance?.bank?.id}">
							${accountInstance?.bank?.encodeAsHTML()}
						</g:link></td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="account.client.label" default="Client" /></td>

					<td valign="top" class="value"><g:link controller="person"
							action="show" id="${accountInstance?.client?.id}">
							${accountInstance?.client?.encodeAsHTML()}
						</g:link></td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="account.code.label" default="Code" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: accountInstance, field: "code")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="account.date.label" default="Date" /></td>

					<td valign="top" class="value"><g:formatDate
							date="${accountInstance?.date}" format="dd/MM/yyyy" /></td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="account.description.label" default="Description" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: accountInstance, field: "description")}
					</td>

				</tr>
				<%-- 
			<tr class="prop">
				<td valign="top" class="name"><g:message code="account.expirationDate.label" default="Expiration Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${accountInstance?.expirationDate}" format="dd/MM/yyyy" /></td>
				
			</tr>
			
			--%>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="account.lawsuit.label" default="Lawsuit" /></td>

					<td valign="top" class="value"><g:link controller="lawsuits"
							action="show" id="${accountInstance?.lawsuit?.id}">
							${accountInstance?.lawsuit?.encodeAsHTML()}
						</g:link></td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="account.observations.label" default="Observations" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: accountInstance, field: "observations")}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="account.operationType.label" default="Operation Type" /></td>

					<td valign="top" class="value">
						${accountInstance?.operationType?.encodeAsHTML()}
					</td>

				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="account.parcelNumber.label" default="Parcel Number" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: accountInstance, field: "parcelNumber")}
					</td>

				</tr>
				<%-- 
			<tr class="prop">
				<td valign="top" class="name"><g:message code="account.subCode.label" default="Sub Code" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: accountInstance, field: "subCode")}</td>
				
			</tr>
		--%>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="account.value.label" default="Value" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: accountInstance, field: "value")}
					</td>

				</tr>

			</tbody>
		</table>
	</section>
	<g:form class="form-horizontal">
		
		<g:if test="${params.backToLawsuit}">
			<g:link class="btn btn-primary" controller="lawsuits" action="show"
			id="${accountInstance?.lawsuit?.id}">
			${message(code: 'default.button.back.label', default: 'Back')}
		</g:link>
		</g:if>
		<g:else>
		<g:link class="btn btn-primary" controller="account" action="list">
			${message(code: 'default.button.back.label', default: 'Back')}
		</g:link>
		</g:else>
	</g:form>

</body>

</html>
