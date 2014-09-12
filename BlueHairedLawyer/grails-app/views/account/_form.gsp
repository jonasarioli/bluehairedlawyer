<%@ page import="bluehairedlawyer.Account" %>



			<div class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'accountType', 'error')} required">
				<label for="accountType" class="control-label"><g:message code="account.accountType.label" default="Account Type" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select name="accountType" from="${bluehairedlawyer.AccountType?.values()}" keys="${bluehairedlawyer.AccountType.values()*.name()}" required="" value="${accountInstance?.accountType?.value()}"/>
					<span class="help-inline">${hasErrors(bean: accountInstance, field: 'accountType', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'bank', 'error')} required">
				<label for="bank" class="control-label"><g:message code="account.bank.label" default="Bank" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="bank" name="bank.id" from="${bluehairedlawyer.Bank.list()}" optionKey="id" required="" value="${accountInstance?.bank?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: accountInstance, field: 'bank', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'client', 'error')} required">
				<label for="client" class="control-label"><g:message code="account.client.label" default="Client" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="client" name="client.id" from="${bluehairedlawyer.Person.list()}" optionKey="id" required="" value="${accountInstance?.client?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: accountInstance, field: 'client', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'code', 'error')} ">
				<label for="code" class="control-label"><g:message code="account.code.label" default="Code" /></label>
				<div class="controls">
					<g:textField name="code" value="${accountInstance?.code}"/>
					<span class="help-inline">${hasErrors(bean: accountInstance, field: 'code', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'date', 'error')} required">
				<label for="date" class="control-label"><g:message code="account.date.label" default="Date" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="date" precision="day"  value="${accountInstance?.date}"  />
					<span class="help-inline">${hasErrors(bean: accountInstance, field: 'date', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="account.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${accountInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: accountInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'expirationDate', 'error')} required">
				<label for="expirationDate" class="control-label"><g:message code="account.expirationDate.label" default="Expiration Date" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<bs:datePicker name="expirationDate" precision="day"  value="${accountInstance?.expirationDate}"  />
					<span class="help-inline">${hasErrors(bean: accountInstance, field: 'expirationDate', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'lawsuit', 'error')} required">
				<label for="lawsuit" class="control-label"><g:message code="account.lawsuit.label" default="Lawsuit" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="lawsuit" name="lawsuit.id" from="${bluehairedlawyer.Lawsuits.list()}" optionKey="id" required="" value="${accountInstance?.lawsuit?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: accountInstance, field: 'lawsuit', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'observations', 'error')} ">
				<label for="observations" class="control-label"><g:message code="account.observations.label" default="Observations" /></label>
				<div class="controls">
					<g:textField name="observations" value="${accountInstance?.observations}"/>
					<span class="help-inline">${hasErrors(bean: accountInstance, field: 'observations', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'operationType', 'error')} required">
				<label for="operationType" class="control-label"><g:message code="account.operationType.label" default="Operation Type" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select name="operationType" from="${bluehairedlawyer.OperationType?.values()}" keys="${bluehairedlawyer.OperationType.values()*.name()}" required="" value="${accountInstance?.operationType?.name()}"/>
					<span class="help-inline">${hasErrors(bean: accountInstance, field: 'operationType', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'parcelNumber', 'error')} ">
				<label for="parcelNumber" class="control-label"><g:message code="account.parcelNumber.label" default="Parcel Number" /></label>
				<div class="controls">
					<g:textField name="parcelNumber" value="${accountInstance?.parcelNumber}"/>
					<span class="help-inline">${hasErrors(bean: accountInstance, field: 'parcelNumber', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'subCode', 'error')} ">
				<label for="subCode" class="control-label"><g:message code="account.subCode.label" default="Sub Code" /></label>
				<div class="controls">
					<g:textField name="subCode" value="${accountInstance?.subCode}"/>
					<span class="help-inline">${hasErrors(bean: accountInstance, field: 'subCode', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'value', 'error')} required">
				<label for="value" class="control-label"><g:message code="account.value.label" default="Value" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="value" step="any" required="" value="${accountInstance?.value}"/>
					<span class="help-inline">${hasErrors(bean: accountInstance, field: 'value', 'error')}</span>
				</div>
			</div>

