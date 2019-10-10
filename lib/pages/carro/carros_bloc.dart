import 'dart:async';

import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carros_api.dart';

class CarrosBloc {
  final _streamController = StreamController<List<Carro>>();

  get stream => _streamController.stream;

  fetch(String tipo) async {
    List<Carro> carros = await CarrosApi.getCarros(tipo);

    _streamController.add(carros);
  }

  void dispose() {
    // TODO: implement dispose

    _streamController.close();
  }
}
