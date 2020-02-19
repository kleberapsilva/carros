import 'package:carros/pages/carro/carro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritoService {
  CollectionReference get _carros => Firestore.instance.collection("carros");

  Stream<QuerySnapshot> get stream => _carros.snapshots();

  Future<bool> favoritar(Carro c) async {
    DocumentReference docRef = _carros.document("${c.id}");

    DocumentSnapshot doc = await docRef.get();

    final exists = doc.exists;

    if (exists) {
      // Remove dos favoritos
      docRef.delete();

      return false;
    } else {
      // Adiciona nos favoritos
      docRef.setData(c.toMap());

      return true;
    }
    // Favorito f = Favorito.fromCarro(c);
    // final dao = FavoritoDAO();
    // final exists = await dao.exists(c.id);
    // if (exists) {
    //   dao.delete(c.id);
    //   Provider.of<FavoritosBloc>(context).fetch();
    //   return false;
    // } else {
    //   dao.save(f);
    //   Provider.of<FavoritosBloc>(context).fetch();
    //   return true;
    // }
  }

  // static Future<List<Carro>> getCarros() async {
  //   List<Carro> carros = await CarroDAO().query("select * from carro c,favorito f where c.id = f.id");

  //   return carros;
  // }

  Future<bool> isFavorito(Carro c) async {
    // final dao = FavoritoDAO();
    // final exists = dao.exists(c.id);

    // return exists;
    DocumentReference docRef = _carros.document("${c.id}");

    DocumentSnapshot doc = await docRef.get();

    final exists = doc.exists;

    return exists;
  }

  // Future<bool> deleteCarros() async {
  //   print("Delete carros do usuário logado: $firebaseUserUid");

  //   // Deleta os carros
  //   final query = await _carros.getDocuments();
  //   for (DocumentSnapshot doc in query.documents) {
  //     await doc.reference.delete();
  //   }

  //   // Deleta a referencia do usuário
  //   _users.document(firebaseUserUid).delete();

  //   return true;
  // }
}
