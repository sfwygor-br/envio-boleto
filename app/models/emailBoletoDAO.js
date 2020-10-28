objectId = require('mongodb').ObjectId;
let mailer = require('nodemailer');
let fs = require('fs');

function boletoDAO(conexao){
	this._conexao = conexao();
}

boletoDAO.prototype.getBoletosDashboard = function(req, res){
	this._conexao.open(function(err, mongoclient){
		mongoclient.collection('boleto', function(err, collection){
			collection.find().toArray(function(err, result){
				if (result[0] != undefined){
					res.render('dashboard', {boleto : result});
				} else {
					res.render('dashboard', {boleto : {}});
				}
			});
		});
		mongoclient.close();
	});
}

boletoDAO.prototype.enviarEmailBoleto = function(req, res){
	this._conexao.open(function(err, mongoclient){
		mongoclient.collection('boleto', function(err, collection){
			collection.find().toArray(async function(err, result){
				//prepara o cenario para envio de email				
				
				let transport = mailer.createTransport({
				host: "smtp.office365.com",
				port: 587,
				secure: false,
				auth: {
					user: "wygor.souza@escriba.com.br",
					pass: "Hexadecimal123#"
				}
				});

				let attachment = {};
				let message = {};
				let data = undefined;

				
				// enviar o email para cada registro pendente
				for (i = 0; i < result.length; i++){

					attachment = {
						'filename' : result[i].boleto, 
						'contentType' : 'application/pdf'
					};
					
					data = fs.readFileSync(result[i].url_pdf);
					attachment['content'] = data;
					
					message = {   
								sender: "wygor.souza@escriba.com.br",    
								to: "feecaragua@gmail.com",   
								subject: 'Teste',    
								html: '<h1>email sent with attachment: ' + result[i].boleto + '</h1>',
								attachments: [attachment] 
					};
					
					await transport.sendMail(message, function(err){
						if(!err){
							console.log('email sent');
						} else {
							console.log(err);
						}
					});
					
					//apaga o boleto					
					await collection.remove({_id : objectId(result[i]._id)}, function(err, records){
						if(err){
							console.log(err);
						} else {
							console.log(records);
						}
					});

					//unlink pdf
					fs.unlink(result[i].url_pdf, function(err){
						if(err){
							console.log(err);
						}
					})
					
					
				}			

				if (result[0] != undefined){
					res.render('dashboard', {boleto : result});
				} else {
					res.render('dashboard', {boleto : {}});
				}
			});
		});
	});
}

module.exports = function(){
	return boletoDAO;
}