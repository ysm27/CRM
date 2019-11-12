const create = {
  init: function(){
    this.bind();
  },
  bind: function(){
    $('#create-btn').on('click', this.createUser);
  },
  createUser: function(){
    let name = $('#new-name').val();
    let phone = $('#new-phone').val();
    let password = $('#new-password').val();
    let role = $('input:radio:checked').val();
    if( !name || !phone || !password || !role){
      alert('缺少参数');
      return
    }
    $.ajax({
      url: '/api/admin/user',
      data: {name,phone,password,role},
      type: 'POST',
      success: function(data){
        if(data.code === 200){
          alert('添加成功');
          location.href = '/admin/user';
        }else{
          console.log(data);
        }
      },
      error: function(err){
        console.log(err);
      }
    })
  }
}
create.init();