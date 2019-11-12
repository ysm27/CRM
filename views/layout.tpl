<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>{{title}}</title>
  {% block css %}
    <link rel="stylesheet" href="/stylesheets/common.css">
  {% endblock %}
</head>
<body>
  {% block content %}
  {% endblock %}

  {% block js %}
  {% endblock %}


</body>
</html>