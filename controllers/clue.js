const Clue = require('../models/clue');
const ClueLog = require('../models/clue_log');
const User = require('../models/user');
const { formatTime } = require('../utils/date');

const clueController = {
  show: async function(req,res,next){
    try{
      const clue = await Clue.all()
      .leftJoin('user','user.id','clue.user_id')
      .column('clue.id',
        'clue.name',
        'clue.phone',
        'clue.utm',
        'clue.user_id',
        'clue.state',
        'clue.remark',
        'clue.created_time',
        'clue.is_deleted',
        {'sale_name':'user.name'});
      res.locals.clue = clue.map(data => {
        data.created_time_display = formatTime(data.created_time);
        return data
      });
      res.locals.nav = 'clue';
      res.render('admin/clue.tpl', res.locals);
    }catch(e){
      res.locals.error = e;
      res.render('error', res.locals);
    }
  },
  insert: async function(req,res,next){
    let name = req.body.name;
    let phone = req.body.phone;
    let utm = req.body.utm;
    let created_time = new Date();
    if( !name || !phone){
      res.json({code: 0, data: 'params empty'});
      return
    }
    try{
      const clue = await Clue.insert({name,phone,utm,created_time});
      res.json({code: 200, data: clue});
    }catch(e){
      console.log(e)
      res.json({code: 0, message: '内部错误'})
    }
  },
  renderClue: async function(req,res,next){
    try{
      let id = req.params.id;
      const clue = await Clue.select({id});
      res.locals.clue = clue.map(data => {
        data.created_time_display = formatTime(data.created_time);
        return data
      });
      const users = await User.all();
      res.locals.users = users;
      const clueLog = await ClueLog.select({clue_id:id});
      res.locals.clueLog = clueLog.map(data => {
        data.created_time_display = formatTime(data.created_time);
        return data
      });
      res.locals.nav = 'clue';
      res.render('admin/clue_log.tpl',res.locals);
    }catch(e){
      res.locals.error = e;
      res.render('error', res.locals);
    }
  },
  update: async function(req,res,next){
    let id = req.params.id;
    let state = req.body.state;
    let user_id = req.body.user_id;
    let remark = req.body.remark;
    if(!state || !user_id){
      res.json({ code: 0, data: 'param empty!'});
      return
    }
    try{
      const clue = await Clue.update(id, {state,user_id,remark});
      res.json({ code: 200, data: clue});
    }catch(e){
      console.log(e);
      res.json({ code: 0, message: '内部错误'})
    }
  },
  addLog: async function(req,res,next){
    let clue_id = req.params.id;

    let content = req.body.content;
    let created_time = new Date();
    if(!clue_id || !content){
      res.json({ code: 0, data: 'params empty!'});
      return
    }
    try{
      await ClueLog.insert({clue_id, content, created_time});
      res.json({ code: 200, data: '添加成功'});
    }catch(err){
      console.log(err);
      res.json({ code: 0, message: '内部错误'});
    }
  },

}
module.exports = clueController;
