<%@ page import="bluehairedlawyer.Phone" %>



			<div class="control-group fieldcontain ${hasErrors(bean: phoneInstance, field: 'phoneNumber', 'error')}">
				<label for="phoneNumber" class="control-label"><g:message code="phone.phoneNumber.label" default="Phone Number" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="phoneNumber" maxlength="15" value="${phoneInstance?.phoneNumber}"/>
					<span class="help-inline">${hasErrors(bean: phoneInstance, field: 'phoneNumber', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: phoneInstance, field: 'contactPerson', 'error')} ">
				<label for="contactPerson" class="control-label"><g:message code="phone.contactPerson.label" default="Contact Person" /></label>
				<div class="controls">
					<g:textField name="contactPerson" value="${phoneInstance?.contactPerson}"/>
					<span class="help-inline">${hasErrors(bean: phoneInstance, field: 'contactPerson', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: phoneInstance, field: 'extension', 'error')} ">
				<label for="extension" class="control-label"><g:message code="phone.extension.label" default="Extension" /></label>
				<div class="controls">
					<g:textField name="extension" value="${phoneInstance?.extension}"/>
					<span class="help-inline">${hasErrors(bean: phoneInstance, field: 'extension', 'error')}</span>
				</div>
			</div>
<%-- 
			<div class="control-group fieldcontain ${hasErrors(bean: phoneInstance, field: 'person', 'error')} required">
				<label for="person" class="control-label"><g:message code="phone.person.label" default="Person" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:select id="person" name="person.id" from="${bluehairedlawyer.Person.list()}" optionKey="id" required="" value="${phoneInstance?.person?.id}" class="many-to-one"/>
					<span class="help-inline">${hasErrors(bean: phoneInstance, field: 'person', 'error')}</span>
				</div>
			</div>
--%>
