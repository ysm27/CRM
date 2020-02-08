const User = require('../models/user');
const {formatTime} =require('../utils/date');

const userController = {
  show: async function(req,res,next){
    try{
      if(!res.locals.isLogin){
        res.redirect('/login');
        return
      }
      const users = await User.all();
      res.locals.users = users.map(data => {
        data.created_time_display = formatTime(data.created_time);
        return data
      })
      res.locals.nav = 'user';
      res.render('admin/user.tpl', res.locals);
    }catch(e){
      res.locals.error = e;
      res.render('error', res.locals);
    }
  },
  insert: async function(req,res,next){
    let name = req.body.name;
    let phone = req.body.phone;
    let password = req.body.password;
    let role = req.body.role;
    let created_time = new Date();
    if(!name || !phone || !password || !role){
      res.json({ code: 0, data: 'params empty!'});
      return
    }
    try{
      const users = await User.insert({name, phone, password, role,created_time});
      res.json({ code: 200, data: users});
    }catch(e){
      console.log(e);
      res.json({ code: 0, message: '内部错误'});
    }
  },
  update: async function(req,res,next){
    let name = req.body.name;
    let phone = req.body.phone;
    let password = req.body.password;
    let id = req.body.id;
    let role = req.body.role;
    if(!name || !phone || !password || !role || !id){
      res.json({ code: 0, data: 'param empty!'});
      return
    }
    try{
      const users = await User.update(id, {name,phone,password,role});
      res.json({ code: 200, data: users});
    }catch(e){
      console.log(e);
      res.json({ code: 0, message: '内部错误'})
    }
  },
  delete: async function(req,res,next){
    let id = req.body.id;
    if(!id){
      res.json({ code: 0, data: 'params empty!'});
      return
    }
    try{
      const users = await User.delete(id);
      res.json({ code: 200, data: users});
    }catch(e){
      console.log(e);
      res.json({ code: 0, message: '内部错误'});
    }
  },
  renderEdit: async function(req,res,next){
    try{
      let id = req.params.id;
      const users = await User.select({id});
      users.forEach(data=>{
        res.locals.users = data;
      });
      res.locals.nav = 'user';
      res.render('admin/userEdit.tpl', res.locals);
    }catch(e){
      res.locals.error = e;
      res.render('error', res.locals);
    }
  },
  renderCreate: async function(req,res,next){
      res.locals.nav = 'user';
      res.render('admin/userCreate');
  },
}

module.exports = userController;