let express = require('express');
let	bodyParser = require('body-parser');
let	mongodb = require('mongodb');
let objectId = require('mongodb').ObjectId;
let mime = require('mime');
let fs = require('fs');
let multer = require('multer');
let storage = multer.diskStorage({
	destination : function(req, file, cb){
		cb(null, 'app/public/uploads/');
	},
	filename : function(req, file, cb){
		cb(null, file.fieldname);
	}
});
let upload = multer({storage : storage});

let app = express();

//body-parser
app.use(bodyParser.urlencoded({ extended:true }));
app.use(bodyParser.json());

app.listen(81);

let conexao = new mongodb.Db(
	'escriba',
	new mongodb.Server(
		'localhost', 
		27017, 
		{}
	),
	{}
);

console.log('Server status: initialized.');

app.get('/', function(req, res){

	res.send({msg:'Olá!'});
});

//POST (create)
app.post('/api', upload.any(), function(req, res){
		
		let boleto_dados = req.body;
		let boleto_pdf   = req.files;

		console.log(boleto_pdf);
		//console.log(boleto_dados);

		conexao.open( function(err, mongoclient){
			mongoclient.collection('boleto', function(err, collection){
				collection.insert(boleto_dados, function(err, records){
					if(err){
						res.json({'status' : 'erro'});
					} else {
						res.json({'status' : 'inclusao realizada com sucesso'});
					}
					mongoclient.close();
				});
			});
		});

});

app.get('/api/:id', function(req, res){
	conexao.open( function(err, mongoclient){
		mongoclient.collection('boleto', function(err, collection){
			collection.find(objectId(req.params.id)).toArray(function(err, results){
				if(err){
					res.json(err);
				} else {
					let data = fs.readFileSync(results[0].url_pdf);
					res.contentType("application/pdf");
					res.send(data);
				}
				mongoclient.close();
			});
		});
	});

});


