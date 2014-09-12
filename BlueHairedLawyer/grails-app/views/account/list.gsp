
<%@ page import="bluehairedlawyer.Account"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="kickstart" />
<g:set var="entityName"
	value="${message(code: 'account.label', default: 'Financeiro')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
<g:set var="layout_nosecondarymenu" value="${true}" scope="request" />

<script>
	$(function() {
		$("#accountDateFrom").datepicker();
		$("#accountDateTo").datepicker();
		$("#accountDateFrom").datepicker().on('changeDate', function() {
			$(this).blur();
		});
		$("#accountDateTo").datepicker().on('changeDate', function() {
			$(this).blur();
		});
	});
	function clearDateFields() {
		$("#accountDateFrom").value = "";
		$("#accountDateTo").value = "";
	}
</script>

</head>

<body>
	<g:form>
		<p>
		<div class="row-fluid">
			<div class="span3">
				<g:message code="note.from.label" default="From" />
				: <input type="text" id="accountDateFrom" value="${params.fromDate}"
					name="accountDateFrom" class="input-medium search-query" />
			</div>

			<g:message code="note.to.label" default="To" />
			: <input type="text" id="accountDateTo" value="${params.toDate}"
				name="accountDateTo" class="input-medium search-query" />
			<g:submitToRemote id="datepicker" class="btn btn-primary"
				url="[controller: 'account', action: 'search']"
				value="${message(code: 'account.search.label', default: ' Search')}"
				update="searchResult" />
			<button type="btn" id="clear" class="btn" onclick="clearDateFields()">
				<g:message code="note.button.clear" default="Clear" />
			</button>
		</div>
		</p>
	</g:form>

	<div id="searchResult">
		<g:render template="transactionsList" />
	</div>
	<div>
		<g:remoteLink class="open-AddSolution btn btn-medium btn-primary"
			controller="account" action="addTransaction" id="${accountInstance?.id}"
			update="showModal"
			params="[modal:'true']"
			onComplete="showTheModalAdd();">
			<g:message code="lawsuit.costPayment.add.label" default="Incluir" />
		</g:remoteLink>

	</div>
	
	<div id="showModal" />


</body>

</html>
