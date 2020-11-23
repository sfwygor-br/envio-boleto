let objectID = require('mongodb').ObjectId;
function tabelionatoDAO(conexao){
    this._conexao = conexao();
}

tabelionatoDAO.prototype.createTabelionato = function(tabelionato_dados, res){
    this._conexao.open((err, mongoclient) => {
        if (err) {
            console.log('Erro ao abrir conexão => '+ err);
            return;
        }

        mongoclient.collection('tabelionato', (err, collection) => {
            if (err) {
                console.log('Erro ao abrir collection => '+ err);
                return;
            }

            collection.insert(tabelionato_dados, (err, records) => {
                if(err){
                    res.json({'status' : 'erro', 'dados' : err});
                } else {
                    res.json({'status' : 'registro de tabelionato adicionado', 'dados' : tabelionato_dados});
                }
                mongoclient.close();
            });
        });
    });
}

tabelionatoDAO.prototype.readTabelionatoId = function(id, res){
    if (id == 'null'){
        res.status(201);
        res.json({'status' : 'parâmetro id não informado'});
        return;
    }
    this._conexao.open((err, mongoclient) => {
        if (err) {
            console.log('Erro ao abrir conexão => '+ err);
            return;
        }

        mongoclient.collection('tabelionato', (err, collection) => {            
            if (err) {
                console.log('Erro ao abrir collection => '+ err);                
                res.status(201);
                res.json({'status' : 'informação de tabelionato não encontrada', 'dados' : err});
                return;
            }

            collection.find(objectID(id)).toArray((err, results) => {
				if(err){
					res.json({'status' : 'erro', 'dados' : err});
				} else {
                    res.status(200);
					res.json({'status' : 'registro de tabelionato encontrado', 'dados' : results[0]});
                }                
			});
        });    
    });
}

tabelionatoDAO.prototype.updateTabelionatoId = function(id, tabelionato_dados, res){
    console.log(tabelionato_dados);
    this._conexao.open((err, mongoclient) => {
        if (err) {
            console.log('Erro ao abrir conexão => '+ err);
            return;
        }

        mongoclient.collection('tabelionato', (err, collection) => {
            if (err) {
                console.log('Erro ao abrir collection => '+ err);
                return;
            }

            collection.replaceOne({_id : objectID(id)}, 
                                 {$set : tabelionato_dados},
                                 (err, results) => {
                if (err) {
                    res.json({'status' : 'erro', 'dados' : err});
                } else {
                    res.json({'status' : 'registro de tabelionato atualizado', 'dados' : results});
                }
            });
        });
    })
}

module.exports = function(){
    return tabelionatoDAO;
}