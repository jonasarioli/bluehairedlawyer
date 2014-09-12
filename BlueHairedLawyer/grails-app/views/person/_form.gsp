<%@ page import="bluehairedlawyer.Person"%>
<script>
	$(function() {

		$("#docNumber").keypress(function() {
			mascaraMutuario(this, cpfCnpj);
		})

	});

	function mascaraMutuario(o, f) {
		v_obj = o
		v_fun = f
		setTimeout('execmascara()', 1)
	}

	function execmascara() {
		v_obj.value = v_fun(v_obj.value)
	}

	function cpfCnpj(v) {

		//Remove tudo o que não é dígito
		v = v.replace(/\D/g, "")

		if (v.length <= 14) { //CPF

			//Coloca um ponto entre o terceiro e o quarto dígitos
			v = v.replace(/(\d{3})(\d)/, "$1.$2")

			//Coloca um ponto entre o terceiro e o quarto dígitos
			//de novo (para o segundo bloco de números)
			v = v.replace(/(\d{3})(\d)/, "$1.$2")

			//Coloca um hífen entre o terceiro e o quarto dígitos
			v = v.replace(/(\d{3})(\d{1,2})$/, "$1-$2")

		} else { //CNPJ

			//Coloca ponto entre o segundo e o terceiro dígitos
			v = v.replace(/^(\d{2})(\d)/, "$1.$2")

			//Coloca ponto entre o quinto e o sexto dígitos
			v = v.replace(/^(\d{2})\.(\d{3})(\d)/, "$1.$2.$3")

			//Coloca uma barra entre o oitavo e o nono dígitos
			v = v.replace(/\.(\d{3})(\d)/, ".$1/$2")

			//Coloca um hífen depois do bloco de quatro dígitos
			v = v.replace(/(\d{4})(\d)/, "$1-$2")

		}

		return v

	}

	function loadCpfMask() {
	}
</script>


<div class="panel-heading">
	<h4 class="panel-title">
		<a data-toggle="collapse" data-parent="#accordion"
			href="#collapsePerson"> Informações Pessoais </a>
	</h4>
</div>
<div id="collapsePerson" class="panel-collapse collapse in">
<div class="panel-body">
	<div
		class="control-group fieldcontain ${hasErrors(bean: personInstance, field: 'name', 'error')} required">
		<label for="name" class="control-label"><g:message
				code="person.name.label" default="Name" /><span
			class="required-indicator">*</span></label>
		<div class="controls">
			<g:textField name="name" required="" value="${personInstance?.name}" />
			<span class="help-inline"> ${hasErrors(bean: personInstance, field: 'name', 'error')}
			</span>
		</div>
	</div>

	<div
		class="control-group fieldcontain ${hasErrors(bean: personInstance, field: 'docNumber', 'error')} required">
		<label for="docNumber" class="control-label"><g:message
				code="person.docNumber.label" default="Doc Number" /><span
			class="required-indicator">*</span></label>
		<div class="controls">
			<g:textField name="docNumber" required=""
				value="${personInstance?.docNumber}" maxLength="18" />
			<span class="help-inline"> ${hasErrors(bean: personInstance, field: 'docNumber', 'error')}
			</span>
		</div>
	</div>

	<div
		class="control-group fieldcontain ${hasErrors(bean: personInstance, field: 'email', 'error')} ">
		<label for="email" class="control-label"><g:message
				code="person.email.label" default="Email" /></label>
		<div class="controls">
			<g:textField name="email" value="${personInstance?.email}" />
			<span class="help-inline"> ${hasErrors(bean: personInstance, field: 'email', 'error')}
			</span>
		</div>
	</div>
</div>
</div>
<div class="panel-heading">
	<h4 class="panel-title">
		<a data-toggle="collapse" data-parent="#accordion"
			href="#collapseAddress"> Informações de Endereço </a>
	</h4>
</div>
<div id="collapseAddress" class="panel-collapse collapse">
	<g:render template="/address/form" />
</div>
<div class="panel-heading">
	<h4 class="panel-title">
		<a data-toggle="collapse" data-parent="#accordion"
			href="#collapseContact"> Informações de Contato </a>
	</h4>
</div>
<div id="collapseContact" class="panel-collapse collapse">
	<g:render template="/phone/form" />
</div>



<%-- 
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
				</g:link></li>
		</ul>

		<span class="help-inline">
			${hasErrors(bean: personInstance, field: 'addresses', 'error')}
		</span>
	</div>
</div>

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
--%>

