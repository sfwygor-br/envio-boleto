function tabelionatoDAO(conexao){
    this._conexao = conexao();
}

tabelionatoDAO.prototype.createTabelionato = function(tabelionato_dados, res){
    this._conexao.open((err, mongoclient) => {
        if (err) {
            console.log('Erro ao abrir conexão => '+ err);
            return
        }

        mongoclient.collection('tabelionato', (err, collection) => {
            if (err) {
                console.log('Erro ao abrir collection => '+ err);
                return
            }

            collection.insert(tabelionato_dados, (err, records) => {
                if(err){
                    res.json({'status' : 'erro', 'dados' : err});
                } else {
                    res.json({'status' : 'registro de tabelionato adicionado', 'dados' : tabelionato_dados});
                }
                mongoclient.close();
            });
        })
    })
}

module.exports = function(){
    return tabelionatoDAO;
}