{% extends '../admin_layout.tpl' %}

{% block css %}
  <link rel="stylesheet" href="/stylesheets/clue_log.css">
{% endblock %}

{% block content %}
  <div class="content">
    <a class="content-title" href="/admin/clue">返回线索列表 >></a>
    <div class="clue">
      {% if userInfo.role == 1 %}
      <div class="clue-info" >
        <ul class="info-list">
          {% for val in clue  %}
          <li class="info-item">客户名称：<span>{{val.name}}</span></li>
          <li class="info-item">联系电话：<span>{{val.phone}}</span></li>
          <li class="info-item">线索来源：<span>{{val.utm}}</span></li>
          <li class="info-item">创建时间: <span>{{val.created_time_display}}</span></li>
          <li class="info-item">用户状态：
            <select class="state">
              <option value="0">请选择线索状态</option>
              <option value="1" {% if val.state == 1 %} selected {% endif%}>没有意向</option>
              <option value="2" {% if val.state == 2 %} selected {% endif%}>意向一般</option>
              <option value="3" {% if val.state == 3 %} selected {% endif%}>意向强烈</option>
              <option value="4" {% if val.state == 4 %} selected {% endif%}>完成销售</option>
              <option value="5" {% if val.state == 5 %} selected {% endif%}>取消销售</option>
            </select>
            {% endfor %}
          <li class="info-item">当前分配销售：
            <select class="user_id">
              {% for sale in users  %}
              <option value="{{sale.id}}" {% if clue[0].user_id == sale.id %} selected {% endif%}>{{sale.name}}</option>
              {% endfor %}
            </select>
          <div class="add-input">
            <div class="log-item">备注：<textarea class="remark" name="remark" cols="30" rows="10" placeholder="请输入本次备注～"></textarea></div>
            <button id="save" class="save" data-id="{{clue.id}}">保存</button>
          </div>
        </ul>
      </div>
      {% endif %}
      <div class="clue-log">
        <ul class="log-list">
          {% for val in clueLog  %}
          <li class="log-item">
            <span class="log-time">{{val.created_time_display}}</span>
            <span class="log-content">{{val.content}}</span>
          </li>
          {% endfor %}

          <div class="add-input">
            <div class="log-item">添加记录：<textarea class="add-log" name="clue_log" cols="30" rows="10" placeholder="请输入本次跟踪的记录～"></textarea></div>
            <button id="add" class="add" data-id="{{clue[0].id}}">添加</button>
          </div>
        </ul>
      </div>
    </div>
  </div>
{% endblock %}

{% block js %}
  <script src="/javascripts/clue_log.js"></script>
{% endblock %}
