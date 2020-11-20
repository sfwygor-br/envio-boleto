let objectID = require('mongodb').ObjectId;
let fs = require('fs');
let path = require('path');

function emailBoletoDAO(conexao){
    this._conexao = conexao();
}

emailBoletoDAO.prototype.createEmailBoleto = function (boleto_dados, res) {
    this._conexao.open((err, mongoclient) => {
        if (err) {
            console.log('Erro ao abrir conexão => '+ err);
            return
        }

        mongoclient.collection('emailBoleto', (err, collection) => {
            if (err) {
                console.log('Erro ao abrir collection => '+ err);
                return
            }

            collection.insert(boleto_dados, (err, records) => {
                if(err){                    
                    res.json({'status' : 'erro', 'dados' : err});
                } else {
                    res.json({'status' : 'despacho de boleto por e-mail adicionado à lista', 'dados' : boleto_dados});
                }
                mongoclient.close();
            });
        })
    });
}

emailBoletoDAO.prototype.readEmailBoletoId = function (id, res){
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

			collection.find(objectID(id)).toArray((err, results) => {
                
				if(err){
					res.json(err);
				} else {
                    let arquivoDir = path.normalize(path.join(__dirname, '../public/uploads/' + results[0].boleto_pdf)); 
					let data = fs.readFileSync(arquivoDir);
					res.contentType("application/pdf");
					res.send(data);
				}
			});
		});
	});
}

module.exports = () => {
    return emailBoletoDAO;
}