let objectId = require('mongodb').ObjectId;

function configuracaoDAO(conexao){
    this._coneaxo = conexao();
}

configuracaoDAO.prototype.getConfiguracao = function(req, res){
    /*
    this._coneaxo.open(function(err, mongoclient){
        mongoclient.collection('configuracao', function(err, collection){
            collection.find(objectId(req.session.au))
        });
    });
    */
}