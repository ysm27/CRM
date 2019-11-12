{% extends '../admin_layout.tpl' %}

{% block css %}
  <link rel="stylesheet" href="/stylesheets/clue.css">
{% endblock %}

{% block content %}
  <div class="content">
    <div class="content-title">人员管理</div>
    <table cellspacing="0" class="table-content">
      <tr>
        <th>姓名</th>
        <th>电话</th>
        <th>密码</th>
        <th>创建时间</th>
        <th>角色</th>
      </tr>
      {% for val in users  %}
      <tr>
        <td>{{val.name}}</td>
        <td>{{val.phone}}</td>
        <td>{{val.password}}</td>
        <td>{{val.created_time_display}}</td>
        <td class="user-edit">
          {% if val.role == 1 %}
            销售经理
          {% else %}
           销售
          {% endif %}
          <span class="edit-btn">
            <a href="/admin/userEdit/{{val.id}}" data-id="{{val.id}}">编辑</a>
            <span id="delete-user" class="delete-btn" data-id="{{val.id}}">删除</span>
          </span>
        </td>
      </tr>
      {% endfor %}
    </table>
      <div class="create-btn">
        <a href="/admin/userCreate">新建</a>
      </div>
  </div>
{% endblock %}

{% block js %}
  <script src="/javascripts/deleteUser.js"></script>
{% endblock %}

