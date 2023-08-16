class AddressModel {
  final String name;
  final double latitude;
  final double longitude;
  AddressModel({
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      name: map['name'] ?? 'Unknown',
      latitude: map['latitude'] ?? 0,
      longitude: map['longitude'] ?? 0,
    );
  }
}
