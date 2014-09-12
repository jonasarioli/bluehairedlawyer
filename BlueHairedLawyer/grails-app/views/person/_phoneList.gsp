
<div
	class="control-group fieldcontain ${hasErrors(bean: personInstance, field: 'phones', 'error')} ">
	<label for="phones" class="control-label"><g:message
			code="person.phones.label" default="Phones" /></label>
	<div class="controls">

		<ul class="one-to-many">
			<g:each in="${personInstance?.phones?}" var="p">
				<li><g:link controller="phone" action="show" id="${p.id}">
						${p?.encodeAsHTML()}
					</g:link></li>
			</g:each>
			<li class="add"><g:link controller="phone" action="create"
					params="['person.id': personInstance?.id]">
					${message(code: 'default.add.label', args: [message(code: 'phone.label', default: 'Phone')])}
				</g:link></li>
		</ul>

		<span class="help-inline">
			${hasErrors(bean: personInstance, field: 'phones', 'error')}
		</span>
	</div>
</div>