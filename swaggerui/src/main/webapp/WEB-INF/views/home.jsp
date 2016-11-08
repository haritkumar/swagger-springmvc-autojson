<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="context" value="${pageContext.request.contextPath}" />


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Api - Swagger UI</title>
  <link rel="icon" type="image/png" href="${context}/resources/images/favicon-32x32.png" sizes="32x32" />
  <link rel="icon" type="image/png" href="i${context}/resources/images/favicon-16x16.png" sizes="16x16" />
  <link href='${context}/resources/css/typography.css' media='screen' rel='stylesheet' type='text/css'/>
  <link href='${context}/resources/css/reset.css' media='screen' rel='stylesheet' type='text/css'/>
  <link href='${context}/resources/css/screen.css' media='screen' rel='stylesheet' type='text/css'/>
  <link href='${context}/resources/css/reset.css' media='print' rel='stylesheet' type='text/css'/>
  <link href='${context}/resources/css/print.css' media='print' rel='stylesheet' type='text/css'/>

  <script src='${context}/resources/lib/object-assign-pollyfill.js' type='text/javascript'></script>
  <script src='${context}/resources/lib/jquery-1.8.0.min.js' type='text/javascript'></script>
  <script src='${context}/resources/lib/jquery.slideto.min.js' type='text/javascript'></script>
  <script src='${context}/resources/lib/jquery.wiggle.min.js' type='text/javascript'></script>
  <script src='${context}/resources/lib/jquery.ba-bbq.min.js' type='text/javascript'></script>
  <script src='${context}/resources/lib/handlebars-4.0.5.js' type='text/javascript'></script>
  <script src='${context}/resources/lib/lodash.min.js' type='text/javascript'></script>
  <script src='${context}/resources/lib/backbone-min.js' type='text/javascript'></script>
  <script src='${context}/resources/swagger-ui.js' type='text/javascript'></script>
  <script src='${context}/resources/lib/highlight.9.1.0.pack.js' type='text/javascript'></script>
  <script src='${context}/resources/lib/highlight.9.1.0.pack_extended.js' type='text/javascript'></script>
  <script src='${context}/resources/lib/jsoneditor.min.js' type='text/javascript'></script>
  <script src='${context}/resources/lib/marked.js' type='text/javascript'></script>
  <script src='${context}/resources/lib/swagger-oauth.js' type='text/javascript'></script>

  <!-- Some basic translations -->
  <!-- <script src='${context}/resources/lang/translator.js' type='text/javascript'></script> -->
  <!-- <script src='${context}/resources/lang/ru.js' type='text/javascript'></script> -->
  <!-- <script src='${context}/resources/lang/en.js' type='text/javascript'></script> -->

  <script type="text/javascript">
    $(function () {
      var url = window.location.search.match(/url=([^&]+)/);
      if (url && url.length > 1) {
        url = decodeURIComponent(url[1]);
      } else {
        url = "${context}/resources/default.json";
      }

      hljs.configure({
        highlightSizeThreshold: 5000
      });

      // Pre load translate...
      if(window.SwaggerTranslator) {
        window.SwaggerTranslator.translate();
      }
      window.swaggerUi = new SwaggerUi({
        url: url,
        dom_id: "swagger-ui-container",
        supportedSubmitMethods: ['get', 'post', 'put', 'delete', 'patch'],
        onComplete: function(swaggerApi, swaggerUi){
          if(typeof initOAuth == "function") {
            initOAuth({
              clientId: "your-client-id",
              clientSecret: "your-client-secret-if-required",
              realm: "your-realms",
              appName: "your-app-name",
              scopeSeparator: " ",
              additionalQueryStringParams: {}
            });
          }

          if(window.SwaggerTranslator) {
            window.SwaggerTranslator.translate();
          }
        },
        onFailure: function(data) {
          log("Unable to Load SwaggerUI");
        },
        docExpansion: "none",
        jsonEditor: false,
        defaultModelRendering: 'schema',
        showRequestHeaders: false
      });

      window.swaggerUi.load();

      function log() {
        if ('console' in window) {
          console.log.apply(console, arguments);
        }
      }
  });
  </script>
</head>

<body class="swagger-section">
<div id='header'>
  <div class="swagger-ui-wrap">
    <a id="logo" href="${context}/"><img class="logo__img" alt="swagger" height="30" width="30" src="${context}/resources/images/logo_small.png" /><span class="logo__title">Api SwaggerUI</span></a>
    <form id='api_selector'>
      <div class='input'><input placeholder="http://example.com/api" id="input_baseUrl" name="baseUrl" type="text"/></div>
      <div id='auth_container'></div>
      <div class='input'><a id="explore" class="header__btn" href="#" data-sw-translate>Explore</a></div>
    </form>
  </div>
</div>

<div id="message-bar" class="swagger-ui-wrap" data-sw-translate>&nbsp;</div>
<div id="swagger-ui-container" class="swagger-ui-wrap"></div>
<div align="center" style="margin-top: 15px;">
	<strong><a href="http://editor.swagger.io/#/" target="blank">Swagger Online Editor</a></strong>
</div>
</body>
</html>
