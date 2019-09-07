const express = require('express');
const pool = require('../pool.js');
var router = express.Router();

router.post('/getlaptop', (req, res) => {
	var i = req.body;
	pool.query('select * from apple_laptop where lid=?', [i.lid], (err, result) => {
		if (err) throw err;
		res.send(result);
	})
});

//查找电脑id号
router.post('/findlaptop', (req, res) => {
	var i = req.body;
	var sql = "select * from apple_laptop where cpu=? and memory=? and disk=? and keyboard=? and spec=?";
	pool.query(sql, [i.cpu, i.memory, i.disk, i.keyboard, i.color], (err, result) => {
		if (err) throw err;
		res.send(result);
	})
});

//向购物车添加商品
router.post('/addCart', (req, res) => {
	var i = req.body;

	var productsql = "select lid from apple_laptop where cpu=? and memory=? and disk=? and keyboard=? and spec=?";
	var addsql = "insert into apple_shoppingcart_item values (null,?,?,1,true);"
	
	pool.query(productsql, [i.cpu, i.memory, i.disk, i.keyboard, i.color], (err, result1) => {
		if (err) throw err;
		if (result1.length > 0) {
			pool.query(addsql, [i.uid, result1[0].lid], (err, result2) => {
				if (err) throw err;
				if(result2.affectedRows > 0){
					res.send(true);
				}else{
					res.send(false);
				}
			})
		}else{
			res.send(false);
		}
	})
});

//根据用户id获取所有已购买电脑
router.post('/getCart',(req,res)=>{
	var i = req.body;
	
	var sql="select * from apple_shoppingcart_item where user_id=?";
	pool.query(sql,[i.uid],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send(result);
		}else{
			res.send(false);
		}
	});
});

//删除购物车中物品
router.post('/deleteCart',(req,res)=>{
	var i = req.body;
	
	var sql="delete from apple_shoppingcart_item where iid=?";
	pool.query(sql,[i.iid],(err,result)=>{
		if(err) throw err;
		if(result.affectedRows>0){
			res.send(true);
		}else{
			res.send(false);
		}
	});
});

//改变选中状态
//删除购物车中物品
router.post('/changeChecked',(req,res)=>{
	var i = req.body;
	var sql="update apple_shoppingcart_item set is_checked=? where iid=?";
	pool.query(sql,[i.is_checked,i.iid],(err,result)=>{
		if(err) throw err;
		if(result.affectedRows>0){
			res.send(true);
		}else{
			res.send(false);
		}
	});
});



module.exports = router;
