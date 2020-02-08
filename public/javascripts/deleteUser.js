let userPage = {  
  init: function(){
    this.bind();
  },
  bind: function(){
    $('.table-content').on('click','#delete-user', this.deleteUser);
  },
  deleteUser: function(){
    let id = $(this).data('id');
    if(!id){
      alert('缺少重要参数');
      return
    }
    $.ajax({
      url: '/api/admin/user',
      data: {id},
      type: 'DELETE',
      success: function(data){
        if(data.code === 200){
          alert('删除成功');
          location.reload();
        }else{
          console.log(data)
        }
      },
      error: function(err){
        console.log(err)
      }
    })
  }
}
userPage.init();