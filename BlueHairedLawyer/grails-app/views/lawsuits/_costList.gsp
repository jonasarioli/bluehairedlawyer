<%@ page import="bluehairedlawyer.AccountType" %>
<div class="panel-heading">
	<h5 class="panel-title" style="margin: 0px">
		<a data-toggle="collapse" data-parent="#accordionCosts"
			href="#costsRow${i}"> Custos do processo </a>
	</h5>
</div>

<div id="costsRow${i}" class="panel-collapse collapse in">

	<div class="panel-body">
		<h5 class="panel-title" style="margin: 0px">

			<!-- first table -->
			<table class="table table-bordered table-condensed"
				style="margin: 0px">
				<thead>
					<tr>
						<th><g:message code="cost.createDate.label" default="Data" /></th>
						<th><g:message code="cost.description.label"
								default="Descrição" /></th>
						<th><g:message code="cost.description.label"
								default="Tipo de despesa" /></th>
						<th><g:message code="cost.value.label" default="Valor" /></th>
						<th><g:message code="cost.paymentDate.label"
								default="Data de Pagamento" /></th>						
						<th><g:message code="cost.paidValue.label"
								default="Valor Pago" /></th>
					</tr>
				</thead>
				<tbody>
					<g:each
						in="${costList?.sort {a,b -> a.date && b.date ? a.date.compareTo(b?.date) : a.parcelNumber.compareTo(b?.parcelNumber)} }"
						status="i" var="costInstance">
						<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
							<td><g:link controller="account" action="show"
									id="${costInstance.id}"
									params="['backToLawsuit': true]">
									${fieldValue(bean: costInstance, field: "date")}
								</g:link></td>
							<td>
								${fieldValue(bean: costInstance, field: "description")}
							</td>
							<td>
								${fieldValue(bean: costInstance, field: "accountType.value")}
							</td>
							<td>
								${fieldValue(bean: costInstance, field: "value")}
							</td>
							<td>
								${fieldValue(bean: costInstance, field: "paymentDate")}
							</td>							
							<td>
								${fieldValue(bean: costInstance, field: "paidValue")}
							</td>
							<td><g:if test="${!costInstance.paidValue && costInstance.accountType == AccountType.CLIENT_EXPENSE}">
									<g:remoteLink
										class="open-AddSolution btn btn-medium btn-primary"
										controller="lawsuits" action="addPayment"
										id="${costInstance?.id}" update="showModal"
										params="[modal:'true', accountId: costInstance.id]"
										onComplete="showTheModalAdd();">
										<g:message code="lawsuit.costPayment.add.label" default="Quitar" />
									</g:remoteLink>
								</g:if></td>

						</tr>
					</g:each>
					<div id="showModalEdit" />
				</tbody>
			</table>
		</h5>
	</div>
</div>