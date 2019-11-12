{% extends '../admin_layout.tpl' %}

{% block css %}
  <link rel="stylesheet" href="/stylesheets/clue.css">
{% endblock %}

{% block content %}
  <div class="content">
    <div class="content-title">线索管理</div>
    <table cellspacing="0" class="table-content">
      <tr>
        <th>姓名</th>
        <th>电话</th>
        <th>来源</th>
        <th>创建时间</th>
        <th>跟踪销售</th>
        <th>状态</th>
        <th>操作</th>
      </tr>
      {% for val in clue  %}
      <tr>
        <td>{{val.name}}</td>
        <td>{{val.phone}}</td>
        <td>{{val.utm}}</td>
        <td>{{val.created_time_display}}</td>
        <td>{{val.sale_name}}</td>
        <td>
          {% if val.state == 1 %}
            没有意向
          {% elif val.state == 2 %}
            意向一般
          {% elif val.state == 3 %}    
            意向强烈
          {% elif val.state == 4 %}    
            完成销售
          {% elif val.state == 5 %}    
            取消销售
          {% endif %}
        </td>
        <td><a href="/admin/clue/{{val.id}}" data-id="{{val.id}}">跟踪</a></td>
      </tr>
      {% endfor %}
    </table>
  </div>
{% endblock %}
