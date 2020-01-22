import 'package:carros/utils/event_bus.dart';
import 'package:carros/utils/sql/entity.dart';
import 'dart:convert' as convert;

import 'package:google_maps_flutter/google_maps_flutter.dart';

class CarroEvent extends Event {
  CarroEvent(this.acao, this.tipo);
  String acao;
  String tipo;

  @override
  String toString() {
    return 'CarroEvent{acao: $acao, tipo: $tipo}';
  }
}

class Carro extends Entity {
  String tipo;
  String urlVideo;
  String urlFoto;
  String latitude;
  String nome;
  int id;
  String descricao;
  String longitude;
  get latlng => LatLng(latitude == null || latitude.isEmpty ? 0.0 : double.parse(latitude), longitude == null || longitude.isEmpty ? 0.0 : double.parse(longitude));

  Carro({this.tipo, this.urlVideo, this.urlFoto, this.latitude, this.nome, this.id, this.descricao, this.longitude});

  Carro.fromMap(Map<String, dynamic> map) {
    tipo = map['tipo'];
    urlVideo = map['urlVideo'];
    urlFoto = map['urlFoto'];
    latitude = map['latitude'];
    nome = map['nome'];
    id = map['id'];
    descricao = map['descricao'];
    longitude = map['longitude'];
  }
  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tipo'] = this.tipo;
    data['urlVideo'] = this.urlVideo;
    data['urlFoto'] = this.urlFoto;
    data['latitude'] = this.latitude;
    data['nome'] = this.nome;
    data['id'] = this.id;
    data['descricao'] = this.descricao;
    data['longitude'] = this.longitude;
    return data;
  }

  String toJson() {
    String json = convert.json.encode(toMap());
    return json;
  }
}
