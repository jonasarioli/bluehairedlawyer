<%@ page import="bluehairedlawyer.Lawsuits"%>



<div
	class="control-group fieldcontain ${hasErrors(bean: lawsuitsInstance, field: 'number', 'error')} required">
	<label for="number" class="control-label"><g:message
			code="lawsuits.number.label" default="Number" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="number" required=""
			value="${lawsuitsInstance?.number}" />
		<span class="help-inline">
			${hasErrors(bean: lawsuitsInstance, field: 'number', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: lawsuitsInstance, field: 'accounts', 'error')} ">
	<label for="accounts" class="control-label"><g:message
			code="lawsuits.accounts.label" default="Accounts" /></label>
	<div class="controls">

		<ul class="one-to-many">
			<g:each in="${lawsuitsInstance?.accounts?}" var="a">
				<li><g:link controller="account" action="show" id="${a.id}">
						${a?.encodeAsHTML()}
					</g:link></li>
			</g:each>
			<li class="add"><g:link controller="account" action="create"
					params="['lawsuits.id': lawsuitsInstance?.id]">
					${message(code: 'default.add.label', args: [message(code: 'account.label', default: 'Account')])}
				</g:link></li>
		</ul>

		<span class="help-inline">
			${hasErrors(bean: lawsuitsInstance, field: 'accounts', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: lawsuitsInstance, field: 'client', 'error')} required">
	<label for="client" class="control-label"><g:message
			code="lawsuits.client.label" default="Client" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:select id="client" name="client.id"
			from="${bluehairedlawyer.Person.list()}" optionKey="id" required=""
			value="${lawsuitsInstance?.client?.id}" class="many-to-one" />
		<span class="help-inline">
			${hasErrors(bean: lawsuitsInstance, field: 'client', 'error')}
		</span>
	</div>
</div>

