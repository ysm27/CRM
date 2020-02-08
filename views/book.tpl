{% extends './layout.tpl' %}

{% block css %}
  <link rel="stylesheet" href="/stylesheets/book.css">
{% endblock %}

{% block content %}
  <div class="page">
    <div class="page-header">
      <div class="header-nav">
        <img class="logo" src="/images/benz-logo.png" alt="benz-logo">
      </div>
    </div>
    <div class="page-mainer">
      <div class="book-section">
        <div class="book-title">预约试驾</div>
        <div class="book-content">
          <div class="content-description">欢迎在线预约试驾。只需填写姓名及手机号，我们会第一时间与您联系，安排试驾事宜。
          </div>
          <input id="name"  class="name" type="text" placeholder="你的名字">
          <input id="telephone" class="telephone" type="text" placeholder="你的电话">
          <button id="book" class="book-now">马上抢占名额</button>
        </div>
      </div>
    </div>
    <div class="page-footer">Copyright © 2019 极客学院体验技术部出品</div>
  </div>
{% endblock %}

{% block js %}
  <script src="https://lib.baomitu.com/jquery/3.3.1/jquery.min.js"></script>
  <script src="/javascripts/book.js"></script>
{% endblock %}
