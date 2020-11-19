var ObjectID = require('mongodb').ObjectId;
let fs = require('fs');

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
                return
            }

			collection.find(objectId(id)).toArray((err, results) => {
				if(err){
					res.json(err);
				} else {
					let data = fs.readFileSync(results[0].url_pdf);
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