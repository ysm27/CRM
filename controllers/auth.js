let User = require('../models/user');
const authCodeFunc = require('../utils/authCode');

const authController = {
  login: async function(req,res,next){
    let phone = req.body.phone;
    let password = req.body.password;
    if( !phone || !password){
      res.json({ code: 0, data: 'params empty!'});
      return
    }
    try{
      const users = await User.select({ phone, password});
      const user = users[0];
      if(user){
        let auth_code = phone + '\t' + password + '\t' + user.id + '\t' + user.role;
        auth_code = authCodeFunc(auth_code, 'ENCODE');
        res.cookie('ac', auth_code, {maxAge: 24 * 60 * 60 * 1000, httpOnly: true});
        res.cookie('user_name', user.name, {maxAge: 24 * 60 * 60 * 1000, httpOnly: true});
        res.json({ code: 200, message: '登录成功'});
      }else{
        res.json({ code: 0, data: { msg: '登录失败,没有此用户' }});
      }
    }catch(e){
      res.json({ code: 0, data: e});
    }
  },
  logout: function(req,res,next){
    res.clearCookie('ac');
    res.redirect('/login');
  },
  renderLogin: async function(req,res,next){
    if(res.locals.isLogin){
      res.redirect('/admin/user');
      return
    }else{
      res.render('login', res.locals);
    }
  }
}

module.exports = authController;