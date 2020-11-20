function envioEmailBoletoDAO(conexao){
    this._conexao = conexao();
}

envioEmailBoletoDAO.prototype.patchEmailBoleto = function(req, res){
    this._conexao.open((err, mongoclient) => {
        if (err) {
            console.log('Erro ao abrir conexão => '+ err);
            return
        }

		mongoclient.collection('emailBoleto', (err, collection) => {
            if (err) {
                console.log('Erro ao abrir collection => '+ err);
                return;
            }

			collection.find().toArray(async function(err, result){
                if(err){
					res.json(err);
				} else {

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
                            'filename' : result[i].boleto_pdf, 
                            'contentType' : 'application/pdf'
                        };
                        
                        let arquivoDir = path.normalize(path.join(__dirname, '../public/uploads/' + result[i].boleto_pdf));
                        data = fs.readFileSync(arquivoDir);
                        attachment['content'] = data;
                        
                        message = {   
                                    sender: "wygor.souza@escriba.com.br",    
                                    to: "feecaragua@gmail.com",   
                                    subject: 'Teste',    
                                    html: '<h1>email sent with attachment: ' + result[i].boleto_pdf + '</h1>',
                                    attachments: [attachment] 
                        };
                        
                        transport.sendMail(message, function(err){
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

                        /*
                        //unlink pdf
                        fs.unlink(result[i].url_pdf, function(err){
                            if(err){
                                console.log(err);
                            }
                        })
                        */
                        
                    }			
                }
			});
		});
	});
}

module.exports = (application, req, res) => {
    return envioEmailBoletoDAO;
}