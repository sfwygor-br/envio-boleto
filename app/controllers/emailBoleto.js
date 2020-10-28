module.exports.getBoletosDashboard = function(application, req, res){
	let conexao = application.config.MongoDBConnection;
  	let emailBoletoDAO = new application.app.models.emailBoletoDAO(conexao);
	emailBoletoDAO.getBoletosDashboard(req, res);
}

module.exports.enviarEmailBoleto = function(application, req, res){	
	let conexao = application.config.MongoDBConnection;
  	let emailBoletoDAO = new application.app.models.emailBoletoDAO(conexao);
	emailBoletoDAO.enviarEmailBoleto(req, res);
}