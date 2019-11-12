var express = require('express');
var router = express.Router();
var userController = require('../controllers/user');
var clueController = require('../controllers/clue');
var authController = require('../controllers/auth');

router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});
router.post('/admin/user', userController.insert);
router.put('/admin/user', userController.update);
router.delete('/admin/user', userController.delete);

router.post('/admin/clue', clueController.insert);
router.put('/admin/clue/:id', clueController.update);
router.post('/admin/clue/:id/log', clueController.addLog);


router.post('/login', authController.login);
router.post('/logout', authController.logout);

module.exports = router;
