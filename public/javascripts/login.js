const loginPage = {
  init: function(){
    this.bind();
  },
  bind: function(){
    $('#login').on('click',this.login);
  },
  login: function(){
    let phone = $('#telephone').val();
    let password = $('#password').val();
    if( !phone || !password){
      alert('params empty');
      return
    }
    $.ajax({
      url: '/api/login',
      data: {phone,password},
      type: 'POST',
      success: function(data){
        if(data.code === 200){
          alert('登录成功');
          location.href = '/admin/clue';
        }else{
          alert('账号或密码错误');
        }
      },
      error: function(err){
        console.log(err);
      }
    })
  }
}
loginPage.init();