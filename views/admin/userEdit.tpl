{% extends '../admin_layout.tpl' %}

{% block css %}
  <link rel="stylesheet" href="/stylesheets/userEdit.css">
{% endblock %}

{% block content %}
  <div class="content">
    <a class="content-title" href="/admin/user">返回用户列表 >></a>
    <div class="info-list">
      <input id="new-name" class="info-item" type="text" name="name" value="{{users.name}}">
      <input id="new-phone" class="info-item" type="text" name="phone" value="{{users.phone}}">
      <input id="new-password" class="info-item" type="text" name="password" value="{{users.password}}">
    </div>
    <div class="role">角色</div>
    <div class="role-item">
      <input name="role" type="radio" value="1" {{'checked' if users.role == 1 else ''}}>&nbsp 销售经理 &nbsp
      <input name="role" type="radio" value="2" 
      {{'checked' if users.role == 2 else ''}}>&nbsp 销售
    </div>
    <button id="save-btn" class="save" data-id="{{users.id}}">保存</button>
  </div>
{% endblock %}

{% block js %}
  <script src="/javascripts/editUser.js"></script>
{% endblock %}