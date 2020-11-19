let app = require('./config/server');

app.listen(81, function(){
	console.log('Servidor: tudo pronto!.');
})
/*
app.get('/api/configuracoes/:cpf', function(req, res){
	conexao.open( function(err, mongoclient){
		mongoclient.collection('configuracao', function(err, collection){
			collection.find({"cpf" : req.params.cpf}).toArray(function(err, results){
				if(err){
					res.json(err);
				} else {				
					res.json(results[0]);
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

*/