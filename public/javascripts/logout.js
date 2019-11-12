const PAGE = {
  init: function(){
    this.bind();
  },
  bind: function(){
    $('#sign-out').on('click',this.logout);
  },
  logout: function(){
    $.ajax({
      url: '/api/logout',
      type: 'POST',
      success: function(data){
        if(data.code === 200){
          alert('退出成功');
        }else{
          console.log(data)
        }
      },
      error: function(err){
        console.log(err);
      }
    })
  }
}
PAGE.init();