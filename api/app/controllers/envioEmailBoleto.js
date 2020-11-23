module.exports.patchEmailBoleto = function(application, req, res){
    let conexao = application.config.MongoDBConnection;
    req.param.id = '5fb7d7b6919cb629f4190079';

    let tabelionato = application.app.controller.tabelionato(application, req, res);
    tabelionato.readTabelionato()

  	let envioRmailBoletoDAO = new application.app.models.envioEmailBoletoDAO(conexao);
    envioEmailBoletoDAO.patchEmailBoleto(req, res);
}