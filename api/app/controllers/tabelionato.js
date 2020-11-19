module.exports.createTabelionato = function(application, req, res){
    let tabelionato_dados = req.body;
    console.log(tabelionato_dados);
    let conexao = application.config.MongoDBConnection;
    let tabelionatoDAO = new application.app.models.tabelionatoDAO(conexao);
    tabelionatoDAO.createTabelionato(tabelionato_dados, res);
}