module.exports.index = function(application, req, res){
	res.render('index');
}

module.exports.dashboard = function(application, req, res){
	res.render('dashboard');
}

module.exports.autenticar = function(application, req, res){
	let dadosLogin = req.body;
	let conexao = application.config.MongoDBConnection;
  let usuarioDAO = new application.app.models.usuarioDAO(conexao);
	usuarioDAO.autenticar(dadosLogin, req, res);
}

module.exports.cadastrar = function(application, req, res){
	let dadosLogin = req.body;
	let conexao = application.config.MongoDBConnection;
  let usuarioDAO = new application.app.models.usuarioDAO(conexao);
	usuarioDAO.cadastrar(dadosLogin);
}