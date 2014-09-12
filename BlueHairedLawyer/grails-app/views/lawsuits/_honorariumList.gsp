<div class="panel-heading">
	<h5 class="panel-title" style="margin: 0px">
		<a data-toggle="collapse" data-parent="#accordionHonorarium"
			href="#honorariumRow${i}"> Honorários Advogado</a>
	</h5>
</div>
<div id="honorariumRow${i}" class="panel-collapse collapse in">

	<div class="panel-body">
		<h5 class="panel-title" style="margin: 0px">

			<!-- first table -->
			<table class="table table-bordered table-condensed"
				style="margin: 0px">
				<thead>
					<tr>
						<th><g:message code="honorarium.createDate.label"
								default="Data de lançamento" /></th>
						<th><g:message code="honorarium.parcelNumber.label"
								default="Parcela" /></th>
						<th><g:message code="honorarium.parcelNumber.label"
								default="Descrição" /></th>
						<th><g:message code="honorarium.value.label" default="Valor" /></th>
						<th><g:message code="honorarium.paymentDate.label"
								default="Data de Validade" /></th>
						<th><g:message code="honorarium.paymentDate.label"
								default="Data de Pagamento" /></th>
						<th><g:message code="honorarium.paidValue.label"
								default="Valor Pago" /></th>
					</tr>
				</thead>
				<tbody>

					<g:each
						in="${honorariumList?.sort {a,b -> a.date && b.date ? a.date.compareTo(b?.date) : a.parcelNumber.compareTo(b?.parcelNumber)} }"
						status="i" var="honorariumInstance">
						<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
							<td><g:link controller="account" action="show"
									id="${honorariumInstance.id}"
									params="['backToLawsuit': true]">
									${fieldValue(bean: honorariumInstance, field: "date")}
								</g:link></td>
							<td>
								${fieldValue(bean: honorariumInstance, field: "parcelNumber")}
							</td>
							<td>
								${fieldValue(bean: honorariumInstance, field: "description")}
							</td>
							<td>
								${fieldValue(bean: honorariumInstance, field: "value")}
							</td>
							<td>
								${fieldValue(bean: honorariumInstance, field: "expirationDate")}
							</td>
							<td>
								${fieldValue(bean: honorariumInstance, field: "paymentDate")}
							</td>
							<td>
								${fieldValue(bean: honorariumInstance, field: "paidValue")}
							</td>
							<td><g:if test="${!honorariumInstance.paidValue}">
									<g:remoteLink
										class="open-AddSolution btn btn-medium btn-primary"
										controller="lawsuits" action="addPayment"
										id="${honorariumInstance?.id}" update="showModal"
										params="[modal:'true', accountId: honorariumInstance.id]"
										onComplete="showTheModalAdd();">
										<g:message code="note.solution.add.label" default="Baixar" />
									</g:remoteLink>
								</g:if></td>

						</tr>
					</g:each>

					<div id="showModal" />

				</tbody>
			</table>
		</h5>
	</div>
</div>