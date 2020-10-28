let objectId = require('mongodb').ObjectId;
function usuarioDAO(conexao){
	this._conexao = conexao();
}

usuarioDAO.prototype.autenticar = function(dados, req, res){
	this._conexao.open(function(err, mongoclient){
		mongoclient.collection('usuario', function(err, collection){
			collection.find(dados).toArray(function(err, result){
				if (result[0] != undefined){
					req.session.autenticado = true;
					res.redirect('dashboard');
				} else {
					req.session.autenticado = true;
					res.redirect('/');
				}
			});
		});
		mongoclient.close();
	});
}

usuarioDAO.prototype.cadastrar = function(dados, req, res){
	// insere documento na colection configuracao e retorna o tenantID
	let jsonConfiguracao = {
		'chave_acesso' : dados.chave_acesso, 
		'smtp_host' : dados.smtp_host,
		'smtp_porta' : dados.smtp_porta,
		'smtp_email' : dados.smtp_email,
		'smtp_senha' : dados.smtp_senha
	};

	this._conexao.open(function(err, mongoclient){
		mongoclient.collection('configuracao', function(err, collection){
			collection.insert(jsonConfiguracao, function(err, records){
				
				// insere documento na colection usuario
								
				let jsonUsuario = {
					'tenantID' : objectId(records.ops[0]._id),
					'nome' : dados.nome,
					'usuario' : dados.usuario,
					'senha' : dados.senha
				};
				
				mongoclient.collection('usuario', function(err, collection){
					collection.insert(jsonUsuario);
				});
			});			
		});
		//mongoclient.close();
	});

	res.redirect('/');
}

module.exports = function(){
	return usuarioDAO;
}