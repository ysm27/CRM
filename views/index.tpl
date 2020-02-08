{% extends './layout.tpl' %}

{% block css %}
  <link rel="stylesheet" href="./stylesheets/index.css">
{% endblock %}

{% block content %}
  <div class="page">
    <div class="page-header">
      <div class="header-nav">
        <img class="logo" src="/images/benz-logo.png" alt="benz-logo">
      </div>
      <div class="header-info">
        <a class="login" href="/login">登录 | </a>
        <a class="book" href="/book">立即预约</a>
      </div>
    </div>
    <div class="page-mainer">
      <div class="show">
        <div class="show-words">2020梅赛德斯-奔驰冰雪对决<span>无处不从容</span></div>
        <img class="show-pic" src="/images/image-1.jpg" alt="image-1">
        <div class="show-word">冰雪对决</div>
        <video class="show-video" autoplay="" loop="" muted="" src="https://www.mercedes-benz.com.cn/content/dam/mb-cn/winter-experience/gallery/video4_1%20.mp4">
        </video>
        <img class="show-pic" src="/images/image-2.jpg" alt="image-2">
      </div>
    </div>
    <div class="page-footer">Copyright © 2019 极客学院体验技术部出品</div>
  </div>
{% endblock %}

{% block js %}
  <script src="https://lib.baomitu.com/jquery/3.3.1/jquery.min.js"></script>
  <script src="/javascripts/login.js"></script>
{% endblock %}