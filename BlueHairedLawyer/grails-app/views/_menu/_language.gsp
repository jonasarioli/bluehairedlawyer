<g:set var="lang" value="${session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE' ?: org.springframework.web.servlet.support.RequestContextUtils.getLocale(request).toString()}"/>
<g:set var="currentURL" value="${request.forwardURI}"/>
<ul class="nav secondary-nav language-dropdown pull-right">
    <li class="dropdown dropdown-btn js-language-dropdown">
        <a class="dropdown-toggle" role="button" data-toggle="dropdown" data-target="#" href="javascript:;">
            <img class="" src="${resource(dir: 'images/flags',file: lang.toString()+'.png')}" />
        </a>
        <ul class="dropdown-menu dropdown-menu-dark" role="menu">
            <li>
                <a class="js-language-link" title="Português Brasileiro" data-lang-code="pt_BR" href="${currentURL+'?lang=pt_BR'}">
                    <img class="" src="${resource(dir: 'images/flags',file: 'pt_BR.png')}"/>
                    <g:message code="language.pt-BR" default="Brazilian Portuguese"/>
                </a>
            </li>
            <li>
                <a class="js-language-link" title="Inglês" data-lang-code="en" href="${currentURL+'?lang=en'}">
                    <img class="" src="${resource(dir: 'images/flags',file: 'en.png')}"/>
                    <g:message code="language.en" default="English"/>
                </a>
            </li>

        </ul>
    </li>
</ul>