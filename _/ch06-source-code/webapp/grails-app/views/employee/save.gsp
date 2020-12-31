<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sample title</title>
  </head>
  <body>
    <h1>Employee Info Saved</h1>
    <font style="size:12pt">
    First Name = ${employee?.firstName}<br>
    Last Name = ${employee?.lastName}<br>
    Title = ${employee?.title}<br>
    Address = ${employee?.address}<br>
    </font>
  </body>
</html>
