{% extends './userEdit.tpl' %}

{% block css %}
  <link rel="stylesheet" href="/stylesheets/userEdit.css">
{% endblock %}

{% block content %}
  <div class="content">
    <a class="content-title" href="/admin/user">返回用户列表 >></a>
    <div class="info-list">
      <input id="new-name" class="info-item" type="text" name="name" placeholder="姓名">
      <input id="new-phone" class="info-item" type="text" name="phone" placeholder="电话">
      <input id="new-password" class="info-item" type="text" name="password" placeholder="密码">
    </div>
    <div class="role">角色</div>
      <div class="role-item">
        <input name="role" type="radio" value="1">&nbsp 销售经理 &nbsp
        <input name="role" type="radio" value="2">&nbsp 销售
      </div>
    <button id="create-btn" class="save">新建</button>
  </div>
{% endblock %}

{% block js %}
  <script src="/javascripts/createUser.js"></script>
{% endblock %}