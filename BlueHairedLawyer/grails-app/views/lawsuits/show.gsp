
<%@ page import="bluehairedlawyer.Lawsuits"%>
<%@ page import="bluehairedlawyer.AccountType"%>
<!doctype html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="kickstart" />
<g:set var="entityName"
	value="${message(code: 'lawsuits.label', default: 'Lawsuits')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
<g:set var="layout_nosecondarymenu" value="${true}" scope="request" />
</head>

<body>
	<div class="row">
		<div class="span12">
			<ul id="Menu" class="nav nav-pills">
				<sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_INSPECTOR">
					<li class="${ params.action == "list" ? 'active' : '' }"><g:link
							action="list">
							<i class="icon-th-list"></i>
							<g:message code="lawsuits.list.label"
								default="Lista de Processos" />
						</g:link></li>
					<li class="${ params.action == "list" ? 'active' : '' }"><g:link
							action="create">
							<i class="icon-plus"></i>
							<g:message code="lawsuits.new.label" default="Novo Processo" />
						</g:link></li>

					<li class="${ params.action == "edit" ? 'active' : '' }"><g:link
							action="edit"
							params="${[lawsuitsId: lawsuitsInstance.id, id: lawsuitsInstance.id]}">
							<i class="icon-pencil"></i>
							<g:message code="lawsuits.edit.label" default="Editar Processo" />
						</g:link></li>

					<sec:ifAnyGranted roles="ROLE_ADMIN">
						<li class=""><g:render
								template="/_common/modals/deleteTextLink" /></li>
					</sec:ifAnyGranted>
					<li class="${ params.action == "edit" ? 'active' : '' }"><g:link
							action="create"
							controller="account"
							params="${[lawsuitsId: lawsuitsInstance.id, isHonorarium: true]}">
							<i class="icon-plus"></i>
							<g:message code="lawsuits.edit.label" default="Honorarios Advogado" />
						</g:link></li>
						
						<li class="${ params.action == "edit" ? 'active' : '' }"><g:link
							action="create"
							controller="account"
							params="${[lawsuitsId: lawsuitsInstance.id, isLawsuitCost: true]}">
							<i class="icon-plus"></i>
							<g:message code="lawsuits.edit.label" default="Custos Processo" />
						</g:link></li>
				</sec:ifAnyGranted>
			</ul>
		</div>
	</div>

	<section id="show-account" class="first">

		<table class="table">
			<tbody>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="lawsuits.number.label" default="Number" /></td>

					<td valign="top" class="value">
						${fieldValue(bean: lawsuitsInstance, field: "number")}
					</td>

				</tr>
				<%-- 
						<tr class="prop">
							<td valign="top" class="name"><g:message
									code="lawsuits.accounts.label" default="Accounts" /></td>

							<td valign="top" style="text-align: left;" class="value">
								<ul>
									<g:each in="${lawsuitsInstance.accounts}" var="a">
										<li><g:link controller="account" action="show"
												id="${a.id}">
												${a?.encodeAsHTML()}
											</g:link></li>
									</g:each>
								</ul>
							</td>

						</tr>
						--%>

				<tr class="prop">
					<td valign="top" class="name"><g:message
							code="lawsuits.client.label" default="Client" /></td>

					<td valign="top" class="value"><g:link controller="person"
							action="show" id="${lawsuitsInstance?.client?.id}">
							${lawsuitsInstance?.client?.encodeAsHTML()}
						</g:link></td>

				</tr>

			</tbody>
		</table>
	</section>

	<g:render template="honorariumList"></g:render>
	
	<br />
	<g:render template="costList"></g:render>
</body>

</html>
