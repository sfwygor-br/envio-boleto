module.exports = function(application){
    application.post('/api/createTabelionato', function(req, res){
        application.app.controllers.tabelionato.createTabelionato(application, req, res);
    });

    application.get('/api/readTabelionatoId/:id', function(req, res){
        application.app.controllers.tabelionato.readTabelionatoId(application, req, res);
    });

    application.put('/api/updateTabelionatoId/:id', function(req, res){
        application.app.controllers.tabelionato.updateTabelionatoId(application, req, res);
    });
}