﻿let mongo = require('mongodb');

let con = function(){
	let db = new mongo.Db(
			'escriba',
			new mongo.Server(
				'localhost',
				27017,
				{}
			),
			{}
	);
	return db;
}

module.exports = function(){
	return con;
}