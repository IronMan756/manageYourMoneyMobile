class IncomeModel {
  IncomeModel(
      {this.id,
      this.userId,
      this.purseId,
      this.suma,
      this.data,
      this.name,
      this.description});
  final String id;
  final String userId;
  final String purseId;
  final int suma;
  final String data;
  final String name;
  final String description;

  Map<String, dynamic> toMap(Map<String, dynamic> json) {
    return <String, dynamic>{
      'userId': userId,
      'purseId': purseId,
      'id': id,
      'suma': suma,
      'data': data,
      'name': name,
      'description': description
    };
  }

  // ignore: sort_constructors_first
  factory IncomeModel.fromJson(Map<String, dynamic> json) {
    return IncomeModel(
      id: json['_id'].toString(),
      userId: json['userId'].toString(),
      purseId: json['purseId'].toString(),
      data: json['data'].toString(),
      suma: json['suma'] as int,
      name: json['name'].toString(),
      description: json['description'].toString(),
    );
  }
  // ignore: prefer_constructors_over_static_methods
  static IncomeModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return IncomeModel(
        id: map['_id'].toString(),
        userId: map['userId'].toString(),
        purseId: map['purseId'].toString(),
        data: map['data'].toString(),
        suma: map['suma'] as int,
        name: map['name'].toString(),
        description: map['description'].toString());
  }
}
