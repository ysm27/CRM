const Clue = {
  init: function(){
    this.bind();
  },
  bind: function(){
    $('#save').on('click',this.saveFunc);
    $('#add').on('click',this.addFunc);
  },
  saveFunc: function(){
    let id = $('#save').data('id');
    let state = $('.state').val();
    let user_id = $('.user_id').val();
    let remark = $('.remark').val();
    if(!state || !user_id){
      alert('缺少必要参数');
      return
    }
    $.ajax({
      url: '/api/admin/clue/' + id,
      data: {state,user_id,remark},
      type: 'PUT',
      beforeSend: function(){
        $('#save').attr('disabled',true);
      },
      success: function(data){
        if(data.code === 200){
          alert('保存成功');
          window.location = 'http://localhost:3000/admin/clue';
        }else{
          alert(data.message);
        }
      },
      error: function(e){
        console.log(e)
      },
      complete: function(){
        $('#save').attr('disabled',false);
      }
    })
  },
  addFunc: function(){
    console.log(this)
    let id = $(this).data('id');
    let content = $('.add-log').val();
    console.log(id)
    if(!content){
      alert('缺少必要参数');
      return
    }
    $.ajax({
      url: '/api/admin/clue/' + id + '/log',
      data: {content},
      type: 'POST',
      beforeSend: function(){
        $('#add').attr('disabled', true);
      },
      success: function(data){
        if(data.code === 200){
          alert('添加成功');
          location.href = '/admin/clue';
        }else{
          alert(data.message);
        }
      },
      error: function(e){
        console.log(e)
      },
      complete: function(){
        $('#add').attr('disabled',false);
      }
    })
  }
}
Clue.init();