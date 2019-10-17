import 'dart:async';

import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carros_api.dart';
import 'package:carros/pages/favoritos/carro_dao.dart';
import 'package:carros/utils/network.dart';

class CarrosBloc {
  final _streamController = StreamController<List<Carro>>();

  get stream => _streamController.stream;

  fetch(String tipo) async {
    try {
      bool networkOn = await isNetworkOn();
      if(! networkOn){
        List<Carro> carros =  await CarroDAO().findAllByTipo(tipo);
        _streamController.add(carros);
        return carros;
      }
      List<Carro> carros = await CarrosApi.getCarros(tipo);
      if (carros.isNotEmpty) {
        final dao = CarroDAO();
        //carros.forEach(dao.save);
        for (Carro c in carros) {
          dao.save(c);
        }
      }

      _streamController.add(carros);
    } catch (e) {
      _streamController.addError(e);
    }
  }

  void dispose() {
    // TODO: implement dispose

    _streamController.close();
  }
}
