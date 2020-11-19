module.exports = function(application){
    application.post('/api/createTabelionato', function(req, res){
        application.app.controllers.tabelionato.createTabelionato(application, req, res);
    });
}