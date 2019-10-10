class Carro {
	String tipo;
	String urlVideo;
	String urlFoto;
	String latitude;
	String nome;
	int id;
	String descricao;
	String longitude;

	Carro({this.tipo, this.urlVideo, this.urlFoto, this.latitude, this.nome, this.id, this.descricao, this.longitude});

	Carro.fromJson(Map<String, dynamic> json) {
		tipo = json['tipo'];
		urlVideo = json['urlVideo'];
		urlFoto = json['urlFoto'];
		latitude = json['latitude'];
		nome = json['nome'];
		id = json['id'];
		descricao = json['descricao'];
		longitude = json['longitude'];
	}

	Map<String, dynamic> toJson() {
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
