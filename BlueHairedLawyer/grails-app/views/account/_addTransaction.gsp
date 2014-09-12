<script>
	$(function() {
		$("#paymentDate").datepicker();
		$(".datepicker").css("z-index", 10000);
		$("#paymentDate").datepicker().on('changeDate', function() {
			$(this).blur();
		});
	});

	function showTheModalAdd() {
		$('#addPaymentModal').modal('show');
	}
	function hideTheModalAdd() {
		$('#addPaymentModal').modal('hide');
	}
</script>
<div id="addPaymentModal" class="modal hide fade" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">x</button>
		<h3>

			<g:message code="lawsuit.paymento.edit"
				default="Lançamento de Contas" />

		</h3>
	</div>
	<div class="modal-body">
		<section id="create-solution" class="first">
			<g:hasErrors bean="${accountInstance}">
				<div class="alert alert-error">
					<g:renderErrors bean="${accountInstance}" as="list" />
				</div>
			</g:hasErrors>

			<g:form controller="account" action="saveTransaction"
				class="form-horizontal">
				<g:hiddenField name="accountId" value="${accountInstance?.id}" />

				<div
					class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'paymentDate', 'error')} required">
					<label for="paymentDate" class="control-label"><g:message
							code="account.paymentDate.label" default="Dada de pagamento" /><span
						class="required-indicator">*</span></label>
					<div class="controls">
						<bs:datePicker name="paymentDate" id="paymentDate" precision="day"
							value="${accountInstance?.paymentDate}" />
						<span class="help-inline"> ${hasErrors(bean: accountInstance, field: 'paymentDate', 'error')}
						</span>
					</div>
				</div>

				<div
					class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'operationType', 'error')} required">
					<label for="operationType" class="control-label"><g:message
							code="account.operationType.label" default="Operation Type" /><span
						class="required-indicator">*</span></label>
					<div class="controls">
						<g:select name="operationType"
							from="${bluehairedlawyer.OperationType?.values()}"
							keys="${bluehairedlawyer.OperationType.values()*.name()}"
							required="" value="${accountInstance?.operationType?.name()}" />
						<span class="help-inline">
							${hasErrors(bean: accountInstance, field: 'operationType', 'error')}
						</span>
					</div>
				</div>
				
				<div
					class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'code', 'error')} ">
					<label for="code" class="control-label"><g:message
							code="account.code.label" default="Categoria" /></label>
					<div class="controls">
						<g:textField name="code"
							value="${accountInstance?.code}" />
						<span class="help-inline"> ${hasErrors(bean: accountInstance, field: 'code', 'error')}
						</span>
					</div>
				</div>

				<div
					class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'description', 'error')} ">
					<label for="description" class="control-label"><g:message
							code="account.description.label" default="Description" /></label>
					<div class="controls">
						<g:textField name="description"
							value="${accountInstance?.description}" />
						<span class="help-inline"> ${hasErrors(bean: accountInstance, field: 'description', 'error')}
						</span>
					</div>
				</div>

				<div
					class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'client', 'error')}">
					<label for="client" class="control-label"><g:message
							code="account.client.label" default="Client" /></label>
					<div class="controls">
						<g:select id="client" name="client.id"
							from="${bluehairedlawyer.Person.list()}" optionKey="id"
							value="${accountInstance?.client?.id}"
							noSelection="['':'Escolha um cliente']"
							class="many-to-one" />
						<span class="help-inline"> ${hasErrors(bean: accountInstance, field: 'client', 'error')}
						</span>
					</div>
				</div>

				<div
					class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'paidValue', 'error')} required">
					<label for="paidValue" class="control-label"><g:message
							code="account.paidValue.label" default="Valor" /><span
						class="required-indicator">*</span></label>
					<div class="controls">
						<g:field type="number" name="paidValue" step="any" required=""
							value="${accountInstance?.paidValue}" />
						<span class="help-inline"> ${hasErrors(bean: accountInstance, field: 'paidValue', 'error')}
						</span>
					</div>
				</div>

				<div
					class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'bank', 'error')} required">
					<label for="bank" class="control-label"><g:message
							code="account.bank.label" default="Bank" /><span
						class="required-indicator">*</span></label>
					<div class="controls">
						<g:select id="bank" name="bank.id"
							from="${bluehairedlawyer.Bank.list()}" optionKey="id" required=""
							value="${accountInstance?.bank?.id}" class="many-to-one" />
						<span class="help-inline"> ${hasErrors(bean: accountInstance, field: 'bank', 'error')}
						</span>
					</div>
				</div>

				<div class="form-actions">
					<g:submitButton name="create" class="btn btn-primary"
						value="${message(code: 'default.button.confirm.label', default: 'Confirmar')}"
						onSuccess="hideTheModalAdd()" />
					<button class="btn" type="reset">
						<g:message code="default.button.reset.label" default="Reset" />
					</button>
				</div>

			</g:form>
		</section>
	</div>
</div>