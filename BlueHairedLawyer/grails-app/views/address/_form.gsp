<%@ page import="bluehairedlawyer.Address" %>
<script>

    $(function() {
    	 $("#zipCode").mask("99.999-999");
    });
</script>


			<div class="control-group fieldcontain ${hasErrors(bean: addressInstance, field: 'streetAddress', 'error')} required">
				<label for="streetAddress" class="control-label"><g:message code="address.streetAddress.label" default="Street Address" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="streetAddress" required="" value="${addressInstance?.streetAddress}"/>
					<span class="help-inline">${hasErrors(bean: addressInstance, field: 'streetAddress', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: addressInstance, field: 'number', 'error')} required">
				<label for="number" class="control-label"><g:message code="address.number.label" default="Number" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="number" required="" value="${addressInstance?.number}"/>
					<span class="help-inline">${hasErrors(bean: addressInstance, field: 'number', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: addressInstance, field: 'city', 'error')} required">
				<label for="city" class="control-label"><g:message code="address.city.label" default="City" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="city" required="" value="${addressInstance?.city}"/>
					<span class="help-inline">${hasErrors(bean: addressInstance, field: 'city', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: addressInstance, field: 'district', 'error')} required">
				<label for="district" class="control-label"><g:message code="address.district.label" default="District" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="district" required="" value="${addressInstance?.district}"/>
					<span class="help-inline">${hasErrors(bean: addressInstance, field: 'district', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: addressInstance, field: 'state', 'error')} required">
				<label for="state" class="control-label"><g:message code="address.state.label" default="State" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select name="state" from="${bluehairedlawyer.BrazilianStates?.values()}" keys="${bluehairedlawyer.BrazilianStates.values()*.name()}" required="" value="${addressInstance?.state?.name()}"/>
					<span class="help-inline">${hasErrors(bean: addressInstance, field: 'state', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: addressInstance, field: 'zipCode', 'error')} required">
				<label for="zipCode" class="control-label"><g:message code="address.zipCode.label" default="Zip Code" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="zipCode" required="" value="${addressInstance?.zipCode}"/>
					<span class="help-inline">${hasErrors(bean: addressInstance, field: 'zipCode', 'error')}</span>
				</div>
			</div>

		<%-- 

			<div class="control-group fieldcontain ${hasErrors(bean: addressInstance, field: 'person', 'error')} required">
				<label for="person" class="control-label"><g:message code="address.person.label" default="Person" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="person" name="person.id" from="${bluehairedlawyer.Person.list()}" optionKey="id" required="" value="${addressInstance?.person?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: addressInstance, field: 'person', 'error')}</span>
				</div>
			</div>
		--%>

