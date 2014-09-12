<%@ page import="bluehairedlawyer.AccountType"%>
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
			<g:if
				test="${accountInstance.accountType == AccountType.CLIENT_EXPENSE}">
				<g:message code="lawsuit.paymento.edit"
					default="Confirmar o quitação da despesa?" />
			</g:if>
			<g:else>
				<g:message code="lawsuit.paymento.edit"
					default="Confirmar o pagamento do honorario?" />
			</g:else>
		</h3>
	</div>
	<div class="modal-body">
		<section id="create-solution" class="first">
			<g:hasErrors bean="${accountInstance}">
				<div class="alert alert-error">
					<g:renderErrors bean="${accountInstance}" as="list" />
				</div>
			</g:hasErrors>

			<g:form controller="account" action="addPayment"
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
						<span class="help-inline">
							${hasErrors(bean: accountInstance, field: 'bank', 'error')}
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