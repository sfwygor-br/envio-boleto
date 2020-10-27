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

usuarioDAO.prototype.cadastrar = function(dados){
	this._conexao.open(function(err, mongoclient){
		mongoclient.collection('usuario', function(err, collection){
			collection.insert(dados);
		});
		mongoclient.close();
	});
}

module.exports = function(){
	return usuarioDAO;
}