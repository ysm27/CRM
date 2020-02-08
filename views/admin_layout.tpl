<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>{{title}}</title>
  <link rel="stylesheet" href="/stylesheets/admin_layout.css">
  {% block css %}
  {% endblock %}
</head>
<body>
  <div class="page">
    <div class="page-header">
      <div class="header-nav">
        <img class="logo" src="/images/benz-logo.png" alt="benz-logo">
        <div class="user-info">
          <div class="user-name">{{userInfo.name}}</div>
          <a id="sign-out" class="sign-out" href="/api/logout">退出</a>
        </div>
      </div>
    </div>
    <div class="page-mainer">
      <div class="page-nav">
        <div class="nav-list" id="nav-list">
          {% if userInfo.role == 1 %}
          <a class="nav-item {% if nav == 'user' %}active{% endif %}" href="/admin/user">人员管理</a>
          {% endif %}
          <a class="nav-item {% if nav == 'clue' %}active{% endif %}" href="/admin/clue">线索管理</a>
        </div>
      </div>
      {% block content %}
      {% endblock %}
    </div>
    <div class="page-footer">Copyright © 2019 极客学院体验技术部出品</div>
  </div>

  <script src="https://lib.baomitu.com/jquery/3.3.1/jquery.min.js"></script>
  <script src="/javascripts/logout.js"></script>
  
  {% block js %}
  {% endblock %}
  
</body>
</html>