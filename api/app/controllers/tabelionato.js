module.exports.createTabelionato = function(application, req, res){
    let tabelionato_dados = req.body;

    let conexao = application.config.MongoDBConnection;
    let tabelionatoDAO = new application.app.models.tabelionatoDAO(conexao);
    tabelionatoDAO.createTabelionato(tabelionato_dados, res);
}

module.exports.readTabelionatoId = function(application, req, res){
    let id = req.params.id;

    let conexao = application.config.MongoDBConnection;
    let tabelionatoDAO = new application.app.models.tabelionatoDAO(conexao);
    tabelionatoDAO.readTabelionatoId(id, res);
}

module.exports.updateTabelionatoId = function(application, req, res){
    let id = req.params.id;
    let tabelionato_dados = req.body;

    let conexao = application.config.MongoDBConnection;
    let tabelionatoDAO = new application.app.models.tabelionatoDAO(conexao);
    tabelionatoDAO.updateTabelionatoId(id, tabelionato_dados, res);
}