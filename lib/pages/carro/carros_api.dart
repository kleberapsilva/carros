import 'dart:convert' as convert;
import 'dart:io';

import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/upload_api.dart';

import 'package:carros/utils/http_helper.dart' as http;
import '../api_response.dart';

class TipoCarro {
  static final String classicos = 'classicos';
  static final String esportivos = 'esportivos';
  static final String luxo = 'luxo';
}

class CarrosApi {
  static Future<List<Carro>> getCarros(String tipo) async {
    var url = 'http://carros-springboot.herokuapp.com/api/v2/carros/tipo/$tipo';
    print("GET > $url");
    var response = await http.get(url);
    String json = response.body;

    List list = convert.json.decode(json);

    List<Carro> carros = list.map<Carro>((map) => Carro.fromMap(map)).toList();

    return carros;
  }

  static Future<ApiResponse<bool>> save(Carro c, File file) async {
    try {
      if (file != null) {
        ApiResponse<String> response = await UploadApi.upload(file);
        if (response.ok) {
          String urlFoto = response.result;
          c.urlFoto = urlFoto;
        }
      }
      var url = 'https://carros-springboot.herokuapp.com/api/v2/carros';
      if (c.id != null) {
        url += '/${c.id}';
      }

      print("POST > $url");

      String json = c.toJson();

      print("   JSON > $json");

      var response = await (c.id == null ? http.post(url, body: json) : http.put(url, body: json));

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map mapResponse = convert.json.decode(response.body);

        Carro carro = Carro.fromMap(mapResponse);

        print("Novo carro: ${carro.id}");

        return ApiResponse.ok(result: true);
      }

      if (response.body == null || response.body.isEmpty) {
        return ApiResponse.error(msg: 'Não foi possivel salvar!');
      }

      Map mapResponse = convert.json.decode(response.body);
      return ApiResponse.error(msg: mapResponse["error"]);
    } catch (e) {
      return ApiResponse.error(msg: 'Não foi possivel salvar!');
    }
  }

  static delete(Carro c) async {
    try {
      var url = 'https://carros-springboot.herokuapp.com/api/v2/carros/${c.id}';

      print("DELETE > $url");

      var response = await http.delete(url);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        return ApiResponse.ok(result: true);
      }

      return ApiResponse.error(msg: 'Não foi possivel deletar!');
    } catch (e) {
      return ApiResponse.error(msg: 'Não foi possivel deletar!');
    }
  }
}
