const express = require('express');
const pool = require('../pool.js');
var router = express.Router();

// 注册模块
router.post('/reg', (req, res) => {
	var obj = req.body;

	var sql = 'insert into apple_user set ?';
	pool.query(sql, [obj], (err, result) => {
		if (err) throw err;
		if (result.affectedRows > 0) {
			res.send({
				code: 200,
				msg: 'res success'
			});
		}
	})
});

//检测账号模块
router.post('/check', (req, res) => {
	var obj = req.body;

	var sql = 'select * from apple_user where uname=?';
	pool.query(sql, obj.uname, (err, result) => {
		if (err) throw err;
		if (result.length > 0) {
			res.send(true);
		} else {
			res.send(false);
		}
	})
});

//用户登录模块
router.post('/login', (req, res) => {
	var obj = req.body;

	var sql = 'select * from apple_user where uname=? and upwd=?';
	pool.query(sql, [obj.uname, obj.upwd], (err, result) => {
		if (err) throw err;
		if (result.length > 0) {
			req.session.uname = obj.uname;
			res.send(result);
		} else {
			res.send(false);
		}
	})
});

module.exports = router;
