<div
	class="control-group fieldcontain ${hasErrors(bean: personInstance, field: 'addresses', 'error')} ">
	<label for="addresses" class="control-label"><g:message
			code="person.addresses.label" default="Addresses" /></label>
	<div class="controls">

		<ul class="one-to-many">
			<g:each in="${personInstance?.addresses?}" var="a">
				<li><g:link controller="address" action="show" id="${a.id}">
						${a?.encodeAsHTML()}
					</g:link></li>
			</g:each>
			<li class="add"><g:link controller="address" action="create"
					params="['person.id': personInstance?.id]">
					${message(code: 'default.add.label', args: [message(code: 'address.label', default: 'Address')])}
				</g:link>

				<%-- <div class="span2" style="margin: 0px">
					<p style="text-align: left">
						<button type="button" class="btn btn-medium btn-primary"
							data-toggle="collapse" data-target="#addNote">
							<g:message code="inspection.add.note.btn" default="Add Address" />
						</button>
					</p>
				</div>

				<div id="addNote" class="collapse">
					<div class="well well-small alert-info">
						<section id="create-note" class="first">

							<g:hasErrors bean="${addressInstance}">
								<div class="alert alert-error">
									<g:renderErrors bean="${addressInstance}" as="list" />
								</div>
							</g:hasErrors>

							<g:uploadForm controller="person" class="form-horizontal">
								<fieldset class="form">
									<g:render template="/address/form" />
								</fieldset>
								<div class="form-actions">
									<g:hiddenField name="person.id" value="${personInstance.id}" />

									<g:actionSubmit class="btn btn-primary" action="saveAddress"
										value="${message(code: 'default.button.create.label', default: 'Create')}" />

									<button class="btn" type="reset">
										<g:message code="default.button.reset.label" default="Reset" />
									</button>
									<button type="button" class="btn" data-toggle="collapse"
										data-target="#addNote">
										<g:message code="default.button.close.label" default="Close" />
									</button>
								</div>
							</g:uploadForm>

						</section>
					</div>
				</div> --%></li>
		</ul>

		<span class="help-inline"> ${hasErrors(bean: personInstance, field: 'addresses', 'error')}
		</span>
	</div>
</div>

