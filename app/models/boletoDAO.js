function boletoDAO(conexao){
	this._conexao = conexao();
}

boletoDAO.prototype.getBoletosDashboard = function(req, res){
	this._conexao.open(function(err, mongoclient){
		mongoclient.collection('boleto', function(err, collection){
			collection.find().toArray(function(err, result){
				if (result[0] != undefined){
					res.render('dashboard', {boleto : result});
				} else {
					res.render('dashboard', {boleto : {}});
				}
			});
		});
		mongoclient.close();
	});
}

module.exports = function(){
	return boletoDAO;
}