class ShippingAddressEntity {
  String? name;
  String? phoneNumber;
  String? address;
  String? email;
  String? city;
  String? floorNumber;

  ShippingAddressEntity({
    this.name,
    this.phoneNumber,
    this.address,
    this.email,
    this.city,
    this.floorNumber,
  });

  String get fullAddress {
    return '$address, $city, مبنى رقم: $floorNumber';
  }

  factory ShippingAddressEntity.fromJson(Map<String, dynamic> json) {
    return ShippingAddressEntity(
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      email: json['email'],
      city: json['city'],
      floorNumber: json['floorNumber'],
    );
  }

  toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
      'email': email,
      'city': city,
      'floorNumber': floorNumber,
    };
  }
}
