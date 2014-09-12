<div id="Navbar" class="navbar navbar-fixed-top navbar-inverse">
    <div class="navbar-inner">
        <div class="container">
          <!-- .btn-navbar is used as the toggle for collapsed navbar content -->
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>

            <a class="brand" href="${createLink(uri: '/')}">
                <small>${meta(name:'app.name')}</small>
            </a>

                <a class="brand" href="${createLink(uri: '/')}">
                <small> v${meta(name:'app.version')}</small>
            </a>
          
            <div class="nav-collapse">
                 <div class="pull-right">
                  <g:render template="/_menu/language"/>
                  <sec:ifLoggedIn>
                    <g:render template="/_menu/logout"/>
                    <g:render template="/_menu/configuration"/>
                 </sec:ifLoggedIn>														
                </div>
            </div>
        </div>
    </div>
</div>
