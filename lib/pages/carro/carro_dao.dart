import 'dart:async';

import 'package:carros/pages/carro/carro.dart';
import 'package:carros/utils/sql/base_dao.dart';


// Data Access Object
class CarroDAO extends BaseDAO<Carro> {
  @override
  // TODO: implement tableName
  String get tableName => 'carro';

  @override
  Carro fromMap(Map<String, dynamic> map) {
    // TODO: implement fromJson
    return Carro.fromMap(map);
  }

  Future<List<Carro>> findAllByTipo(String tipo)  {
//    final dbClient = await db;
//
//    final list = await dbClient
//        .rawQuery('select * from carro where tipo =? ', [tipo]);
//
//    return list.map<Carro>((json) => fromMap(json)).toList();
  return query('select * from carro where tipo =? ', [tipo]);
  }
}
