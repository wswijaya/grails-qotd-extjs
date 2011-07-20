<%@ page contentType="text/html;charset=ISO-8859-1" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
<title>Random Quote</title>
<g:javascript library="prototype" />
</head>
<body>
        <div class="nav">
            <span class="menuButton"><g:remoteLink action="ajaxRandom" update="quote">Next Quote</g:remoteLink></span>
		  	<sec:ifAllGranted roles="ROLE_ADMIN">
		  		<span class="menuButton"><g:link action="list">Admin</g:link></span>
		  	</sec:ifAllGranted>
		  	<sec:ifNotLoggedIn>
		  		<span class="menuButton"><g:link controller="login" action="auth">Login</g:link></span>
		  	</sec:ifNotLoggedIn>
		  	<sec:ifLoggedIn>
		  		<span class="menuButton"><sec:username /> (<g:link controller="logout">Logout</g:link>)</span>
		  	</sec:ifLoggedIn>
        </div>

  <div class="body" id="quote">
	<q>${quote.content}</q>
	<p>${quote.author }</p>  
  </div>
</body>
</html>