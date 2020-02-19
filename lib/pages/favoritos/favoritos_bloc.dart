import 'dart:async';

import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carros_api.dart';
import 'package:carros/pages/carro/carro_dao.dart';
import 'package:carros/pages/favoritos/favorito_service.dart';
import 'package:carros/utils/network.dart';

class FavoritosBloc {
  final _streamController = StreamController<List<Carro>>();

  get stream => _streamController.stream;

  // fetch() async {
  //   try {

  //     List<Carro> carros = await FavoritoService.getCarros();

  //     _streamController.add(carros);
  //   } catch (e) {
  //     _streamController.addError(e);
  //   }
  // }

  // void dispose() {
  //   // TODO: implement dispose

  //   _streamController.close();
  // }
}
