module.exports.getBoletosDashboard = function(application, req, res){
	let conexao = application.config.MongoDBConnection;
  let boletoDAO = new application.app.models.boletoDAO(conexao);
	boletoDAO.getBoletosDashboard(req, res);
}