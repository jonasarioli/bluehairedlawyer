<%@ page import="bluehairedlawyer.AccountType"%>
<input type="hidden" name="lawsuitsId" value="${lawsuitsId}" />

<div
	class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'date', 'error')} required">
	<label for="date" class="control-label"><g:message
			code="account.date.label" default="Date" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<bs:datePicker name="date" precision="day"
			value="${accountInstance?.date}" />
		<span class="help-inline"> ${hasErrors(bean: accountInstance, field: 'date', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'description', 'error')} required">
	<label for="description" class="control-label"><g:message
			code="account.description.label" default="Description" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:textField name="description" required=""
			value="${accountInstance?.description}" />
		<span class="help-inline"> ${hasErrors(bean: accountInstance, field: 'description', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'accountType', 'error')} required">
	<label for="accountType" class="control-label"><g:message
			code="account.accountType.label" default="Account Type" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:select name="accountType"
			from="${accountType}"
			keys="${it}" required=""
			value="${it}" 
			optionValue="value"/>
		<span class="help-inline">
			${hasErrors(bean: accountInstance, field: 'accountType', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'value', 'error')} required">
	<label for="value" class="control-label"><g:message
			code="account.value.label" default="Value" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<g:field type="number" name="value" required=""
			value="${accountInstance?.value}" />
		<span class="help-inline"> ${hasErrors(bean: accountInstance, field: 'value', 'error')}
		</span>
	</div>
</div>




