const express = require('express');
const cors = require("cors");
const session = require('express-session');
const cookieParser = require('cookie-parser');
//引入用户路由
const userRouter = require('./routes/user.js');
const productRouter = require('./routes/product.js');
//引入中间件
const bodyParser = require('body-parser');

var app = express();
app.listen(8080);

//跨域
app.use(cors({
	origin: ["http://127.0.0.1:8848",
		"http://localhost:8848"
	], //中间件 不能用 *
	credentials: true
}));
//session
app.use(session({
	secret: 'keyboard cat',
	resave: false,
	saveUninitialized: true,
	cookie: {
		maxAge: 60000
	}
}));

//托管静态资源到public
//app.use(express.static('public'));

//使用中间件
app.use(bodyParser.urlencoded({
	extended: false
}));

//使用路由
app.use('/user', userRouter);
app.use('/product', productRouter);