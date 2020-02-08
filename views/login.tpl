{% extends './layout.tpl' %}

{% block css %}
  <link rel="stylesheet" href="./stylesheets/login.css">
{% endblock %}

{% block content %}
  <div class="page">
    <div class="page-header">
      <div class="header-nav">
        <img class="logo" src="/images/benz-logo.png" alt="benz-logo">
      </div>
    </div>
    <div class="page-mainer">
      <div class="login">
        <div class="login-title">MERCEDS-BENZ</div>
        <input id="telephone"  class="telephone" type="text" placeholder="请输入你的手机">
        <input id="password"  class="password" type="password" placeholder="请输入你的密码">
        <button id="login" class="login-now">马上登录</button>
      </div>
    </div>
    <div class="page-footer">Copyright © 2019 极客学院体验技术部出品</div>
  </div>
{% endblock %}

{% block js %}
  <script src="https://lib.baomitu.com/jquery/3.3.1/jquery.min.js"></script>
  <script src="/javascripts/login.js"></script>
{% endblock %}