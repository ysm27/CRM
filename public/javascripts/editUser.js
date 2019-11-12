const edit = {
  init: function(){
    this.bind();
  },
  bind: function(){
    $('#save-btn').on('click', this.editUser);
  },
  editUser: function(){
    let id = $(this).data('id');
    let name = $('#new-name').val();
    let phone = $('#new-phone').val();
    let password = $('#new-password').val();
    let role = $('input:radio:checked').val();
    if(!id || !name || !phone || !password || !role){
      alert('缺少参数');
      return
    }
    $.ajax({
      url: '/api/admin/user',
      data: {id,name,phone,password,role},
      type: 'PUT',
      success: function(data){
        if(data.code === 200){
          alert('修改成功');
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
edit.init();