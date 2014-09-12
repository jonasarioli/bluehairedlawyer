<div class="">
  <ul class="nav nav-tabs" data-role="listview" data-split-icon="gear" data-filter="true">
    <li class="controller${params.controller == 'home' ? " active" : ""}">
      <g:link controller="home" action="index">
        <g:message code="home.label" default="Home"/>
      </g:link>
    </li>

    <sec:ifAnyGranted roles="ROLE_ADMIN">
      <li class="controller${params.controller == 'person' ? " active" : ""}">
        <g:link controller="person" action="index">
          <g:message code="person.label" default="Cliente"/>
        </g:link>
      </li>
    </sec:ifAnyGranted>
    
    <sec:ifAnyGranted roles="ROLE_ADMIN">
      <li class="controller${params.controller == 'bank' ? " active" : ""}">
        <g:link controller="bank" action="index">
          <g:message code="bank.label" default="Bancos"/>
        </g:link>
      </li>
    </sec:ifAnyGranted>
    
    <sec:ifAnyGranted roles="ROLE_ADMIN">
      <li class="controller${params.controller == 'lawsuits' ? " active" : ""}">
        <g:link controller="lawsuits" action="index">
          <g:message code="lawsuits.label" default="Processos"/>
        </g:link>
      </li>
    </sec:ifAnyGranted>
    
    <sec:ifAnyGranted roles="ROLE_ADMIN">
      <li class="controller${params.controller == 'account' ? " active" : ""}">
        <g:link controller="account" action="index">
          <g:message code="account.label" default="Financeiro"/>
        </g:link>
      </li>
    </sec:ifAnyGranted>

  
  </ul>
</div>
