module.exports.cadastro = function(application, req, res){
	res.render('cadastro');
}

module.exports.cadastrar = function(application, req, res){
	let dadosLogin = req.body;	
	let conexao = application.config.MongoDBConnection;
	let usuarioDAO = new application.app.models.usuarioDAO(conexao);
	usuarioDAO.cadastrar(dadosLogin, req, res);
}

module.exports.autenticar = function(application, req, res){
	let dadosLogin = req.body;
	let conexao = application.config.MongoDBConnection;
    let usuarioDAO = new application.app.models.usuarioDAO(conexao);
	usuarioDAO.autenticar(dadosLogin, req, res);
}