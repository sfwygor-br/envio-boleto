module.exports = function(application){
	
	application.get('/', function(req, res){
		application.app.controllers.home.index(application, req, res);
	});
	
	application.get('/dashboard', function(req, res){
		application.app.controllers.emailBoleto.getBoletosDashboard(application, req, res);
	});
	
	application.get('/cadastro', function(req, res){
		application.app.controllers.usuario.cadastro(application, req, res);
	});

	application.get('/emailBoleto', function(req, res){
		application.app.controllers.emailBoleto.enviarEmailBoleto(application, req, res);
	});

	application.post('/autenticar', function(req, res){
		application.app.controllers.usuario.autenticar(application, req, res);
	});
	
	application.post('/cadastrar', function(req, res){
		application.app.controllers.usuario.cadastrar(application, req, res);
	});

	application.post('/configuracao', function(req, res){
		application.app.controllers.configuracao.getConfiguracao(application, req, res);
	});

};