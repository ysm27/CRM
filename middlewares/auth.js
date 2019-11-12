const authMiddleware = {
  mustLogin: function(req,res,next){
    if(!res.locals.isLogin){
      res.redirect('/login');
      return
    }
    next();
  },
  mustRoot: function(req,res,next){
    if(res.locals.userInfo.role != 1){
      res.writeHead(403);
      res.end(" 403 Forbidden");
      return
    }
    next();
  }
}

module.exports = authMiddleware;