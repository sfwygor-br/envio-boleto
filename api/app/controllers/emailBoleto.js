module.exports.createEmailBoleto = function(application, req, res){
    let boleto_dados = req.body;
    let boleto_pdf   = req.files;

    let conexao = application.config.MongoDBConnection;
    let emailBoletoDAO = new application.app.models.emailBoletoDAO(conexao);
    emailBoletoDAO.createEmailBoleto(boleto_dados, res);
}

module.exports.readEmailBoletoId = function(application, req, res){
    let id = req.params.id;
    let conexao = application.config.MongoDBConnection;
    let emailBoletoDAO = new application.app.models.emailBoletoDAO(conexao);
    emailBoletoDAO.readEmailBoletoId(id, res);        
}