import 'package:fruits_hub_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? phoneNumber;
  String? address;
  String? email;
  String? city;
  String? floorNumber;

  ShippingAddressModel({
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

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
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

  toEntity() {
    return ShippingAddressEntity(
      name: name,
      phoneNumber: phoneNumber,
      address: address,
      email: email,
      city: city,
      floorNumber: floorNumber,
    );
  }
}
