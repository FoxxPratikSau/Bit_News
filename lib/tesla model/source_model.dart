class SourceTesla {
  String? id;
  String? name;

  SourceTesla({ this.id, this.name}); //constructor

  //map
  factory SourceTesla.fromJson(Map<String, dynamic> json) {
    return SourceTesla(id: json['id'], name: json['name']);
  }
}
