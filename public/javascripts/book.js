const PAGE = {
  init: function(){
    this.bind();
  },
  bind: function(){
    $('#book').on('click',this.submit);
  },
  submit: function(){
    let name = $('#name').val();
    let phone = $('#telephone').val();
    let utm = PAGE.getQuery('utm');
    if(!name || !phone){
      alert('请输入必要参数');
      return
    }
    $.ajax({
      url: '/api/admin/clue',
      data: {name,phone,utm},
      type: 'POST',
      beforeSend: function(){
        $('#book').attr('disabled',true);
      },
      success: function(data){
        if(data.code === 200){
          alert('申请成功！');
        }else{
          alert(data.message);
        }
      },
      erroe: function(e){
        console.log(e);
      },
      complete: function(){
        $('#book').attr('disabled',false);
      }
    })
  },
  getQuery: function(name){
    var result = location.search.match(new RegExp("[\?\&]" + name+ "=([^\&]+)","i"));
    if(result == null || result.length < 1){
      return "";
    }
    return result[1];
  }
}
PAGE.init();