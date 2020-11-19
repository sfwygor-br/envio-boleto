let multer = require('multer');
let storage = multer.diskStorage({
	destination : function(req, file, cb){
		cb(null, 'app/public/uploads/');
	},
	filename : function(req, file, cb){
		cb(null, file.fieldname);
	}
});

let upload = multer({storage : storage});

module.exports = function(application){
    application.post('/api/createEmailBoleto', upload.any(), function(req, res){
        application.app.controllers.emailBoleto.createEmailBoleto(application, req, res);
    });

    application.get('/api/readEmailBoletoId/:id', function(req, res){
        application.app.controllers.emailBoleto.readEmailBoletoId(application, req, res);
    });
}

