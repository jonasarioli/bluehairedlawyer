<section id="list-account" class="first">
	<g:if test="${accountInstanceTotal > 0}">
		<table class="table table-bordered">
			<thead>
				<tr>

					<th><g:message code="account.operationType.label"
							default="Tipo" /></th>

					<th><g:message code="account.paymentDate.label"
							default="Data De Pgto" /></th>

					<th><g:message code="account.code.label" default="Categoria" /></th>

					<th><g:message code="account.client.label" default="Cliente" /></th>

					<th><g:message code="account.bank.label" default="Banco" /></th>

					<th><g:message code="account.description.label"
							default="Descricao" /></th>

					<th><g:message code="account.value.label" default="Valor" /></th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="5">Debitos</td>
					<td style="color: red">
						${sumOfDebits}
					</td>
				</tr>
				<tr>
					<td colspan="5">Creditos</td>
					<td style="color: blue;">
						${sumOfCredits}
					</td>
				</tr>
				<tr>
					<td colspan="5">Saldo</td>
					<td>
						${total}
					</td>
				</tr>
			</tfoot>
			<tbody>
				<g:each in="${accountInstanceList}" status="i" var="accountInstance">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

						<td><g:link action="show" id="${accountInstance.id}">
								${fieldValue(bean: accountInstance, field: "operationType")}
							</g:link></td>

						<td><g:formatDate date="${accountInstance.paymentDate}"
								format="dd/MM/yyyy" /></td>

						<td>
							${fieldValue(bean: accountInstance, field: "code")}
						</td>

						<td>
							${fieldValue(bean: accountInstance, field: "client")}
						</td>

						<td>
							${fieldValue(bean: accountInstance, field: "bank")}
						</td>

						<td>
							${fieldValue(bean: accountInstance, field: "description")}
						</td>

						<td>
							${fieldValue(bean: accountInstance, field: "paidValue")}
						</td>

					</tr>
				</g:each>
			</tbody>
		</table>
	</g:if>
</section>