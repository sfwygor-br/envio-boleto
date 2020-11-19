let express = require('express');
let consign = require('consign');
let bodyParser = require('body-parser');
let expressSession = require('express-session');

let app = express();
app.set('view engine', 'ejs');
app.set('views', './app/views');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));
app.use(express.static('./app/public'));
app.use(expressSession({
	secret: '?sdgH3bkY&kKjxyZ2G@a',
	resave: false,
	saveUninitialized: false
}));
		
consign()
	.include('app/routes')
	.then('app/models')
	.then('app/controllers')
	.then('config/MongoDBConnection.js')
	.into(app);

module.exports = app;