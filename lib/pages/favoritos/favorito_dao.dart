
import 'package:carros/utils/sql/base_dao.dart';
import 'package:carros/pages/favoritos/favorito.dart';

class FavoritoDAO extends BaseDAO<Favorito> {
  @override
  fromMap(Map<String, dynamic> map) {
    // TODO: implement fromMap
    return Favorito.fromMap(map);
  }

  @override
  // TODO: implement tableName
  String get tableName => 'favorito';
  
}