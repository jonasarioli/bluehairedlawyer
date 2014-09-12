<%@ page import="bluehairedlawyer.AccountType" %>




<input type="hidden" name="lawsuitsId" value="${lawsuitsId}" />
<input type="hidden" name="accountType" value="${AccountType.HONORARIUM}" />
<div
	class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'date', 'error')} required">
	<label for="date" class="control-label"><g:message
			code="account.date.label" default="Date" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<bs:datePicker name="date" precision="day"
			value="${accountInstance?.date}" />
		<span class="help-inline">
			${hasErrors(bean: accountInstance, field: 'date', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'parcelNumber', 'error')} ">
	<label for="parcelNumber" class="control-label"><g:message
			code="account.parcelNumber.label" default="Parcel Number" /></label>
	<div class="controls">
		<g:field name="parcelNumber" type="number"
			value="${accountInstance?.parcelNumber}" />
		<span class="help-inline">
			${hasErrors(bean: accountInstance, field: 'parcelNumber', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'expirationDate', 'error')} required">
	<label for="expirationDate" class="control-label"><g:message
			code="account.expirationDate.label" default="Expiration Date" /><span
		class="required-indicator">*</span></label>
	<div class="controls">
		<bs:datePicker name="expirationDate" precision="day"
			value="${accountInstance?.expirationDate}" />
		<span class="help-inline">
			${hasErrors(bean: accountInstance, field: 'expirationDate', 'error')}
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
		<span class="help-inline">
			${hasErrors(bean: accountInstance, field: 'description', 'error')}
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
		<span class="help-inline">
			${hasErrors(bean: accountInstance, field: 'value', 'error')}
		</span>
	</div>
</div>

<div
	class="control-group fieldcontain ${hasErrors(bean: accountInstance, field: 'observations', 'error')} ">
	<label for="observations" class="control-label"><g:message
			code="account.observations.label" default="Observations" /></label>
	<div class="controls">
		<g:textField name="observations"
			value="${accountInstance?.observations}" />
		<span class="help-inline">
			${hasErrors(bean: accountInstance, field: 'observations', 'error')}
		</span>
	</div>
</div>



