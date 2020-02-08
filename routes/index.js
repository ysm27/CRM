var express = require('express');
var router = express.Router();
var userController = require('./../controllers/user');
var clueController = require('./../controllers/clue');
var authController = require('./../controllers/auth');
var authMiddleware = require('./../middlewares/auth');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index');
});
router.get('/book', function(req, res, next) {
  res.render('book');
});

router.get('/admin/user', authMiddleware.mustLogin, authMiddleware.mustRoot, userController.show);
router.get('/admin/userCreate', authMiddleware.mustLogin, authMiddleware.mustRoot, userController.renderCreate);
router.get('/admin/userEdit/:id', authMiddleware.mustLogin, authMiddleware.mustRoot, userController.renderEdit);

router.get('/admin/clue', authMiddleware.mustLogin, clueController.show);
router.get('/admin/clue/:id', authMiddleware.mustLogin, clueController.renderClue);

router.get('/login', authController.renderLogin);

module.exports = router;
