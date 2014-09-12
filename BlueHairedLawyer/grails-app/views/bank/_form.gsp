<%@ page import="bluehairedlawyer.Bank" %>



			<div class="control-group fieldcontain ${hasErrors(bean: bankInstance, field: 'agency', 'error')} ">
				<label for="agency" class="control-label"><g:message code="bank.agency.label" default="Agency" /></label>
				<div class="controls">
					<g:textField name="agency" value="${bankInstance?.agency}"/>
					<span class="help-inline">${hasErrors(bean: bankInstance, field: 'agency', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: bankInstance, field: 'currentAccount', 'error')} ">
				<label for="currentAccount" class="control-label"><g:message code="bank.currentAccount.label" default="Current Account" /></label>
				<div class="controls">
					<g:textField name="currentAccount" value="${bankInstance?.currentAccount}"/>
					<span class="help-inline">${hasErrors(bean: bankInstance, field: 'currentAccount', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: bankInstance, field: 'currentBalance', 'error')} required">
				<label for="currentBalance" class="control-label"><g:message code="bank.currentBalance.label" default="Current Balance" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="currentBalance" step="any" required="" value="${bankInstance.currentBalance}"/>
					<span class="help-inline">${hasErrors(bean: bankInstance, field: 'currentBalance', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: bankInstance, field: 'initialBalance', 'error')} required">
				<label for="initialBalance" class="control-label"><g:message code="bank.initialBalance.label" default="Initial Balance" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:field type="number" name="initialBalance" step="any" required="" value="${bankInstance.initialBalance}"/>
					<span class="help-inline">${hasErrors(bean: bankInstance, field: 'initialBalance', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: bankInstance, field: 'name', 'error')} ">
				<label for="name" class="control-label"><g:message code="bank.name.label" default="Name" /></label>
				<div class="controls">
					<g:textField name="name" value="${bankInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: bankInstance, field: 'name', 'error')}</span>
				</div>
			</div>

