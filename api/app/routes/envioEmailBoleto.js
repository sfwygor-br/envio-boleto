module.exports = function(application){
    application.patch('/api/patchEmailBoleto', function (application, req, res){
        application.app.controllers.envioEmailBoleto.patchEmailBoleto(application, req, res);
    });
}