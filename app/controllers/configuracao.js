module.exports.getConfiguracao = function(application, req, res){
    let conexao = application.config.MongoDBConection;
    let configuracaoDAO = new application.app.models.configuracaoDAO(conexao);
    configuracaoDAO.getConfiguracao(req, res);
};