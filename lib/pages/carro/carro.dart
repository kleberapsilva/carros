import 'package:carros/pages/favoritos/entity.dart';

class Carro extends Entity {
	String tipo;
	String urlVideo;
	String urlFoto;
	String latitude;
	String nome;
	int id;
	String descricao;
	String longitude;

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
}
