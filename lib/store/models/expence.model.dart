class ExpenceModel {
  ExpenceModel(
      {this.userId,
      this.purseId,
      this.suma,
      this.date,
      this.name,
      this.description,
      this.id});
  final String userId;
  final String purseId;
  final int suma;
  final String date;
  final String name;
  final String description;
  final String id;

  Map<String, dynamic> toMap(Map<String, dynamic> json) {
    return <String, dynamic>{
      'userId': userId,
      'purseId': purseId,
      'suma': suma,
      'date': date,
      'name': name,
      'description': description,
      'id': id
    };
  }

  // ignore: sort_constructors_first
  factory ExpenceModel.fromJson(Map<String, dynamic> json) {
    return ExpenceModel(
        userId: json['userId'].toString(),
        purseId: json['purseId'].toString(),
        date: json['data'].toString(),
        suma: json['suma'] as int,
        name: json['name'].toString(),
        description: json['description'].toString(),
        id: json['_id'].toString());
  }
  // ignore: prefer_constructors_over_static_methods
  static ExpenceModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return ExpenceModel(
        userId: map['userId'].toString(),
        purseId: map['purseId'].toString(),
        date: map['data'].toString(),
        suma: map['suma'] as int,
        name: map['name'].toString(),
        description: map['description'].toString(),
        id: map['_id'].toString());
  }
}
