import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/order_product_model.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/shipping_address_model.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

class OrderModel {
  final String uId;
  final double totalPrice;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String? status;
  final String orderID;

  OrderModel({
    required this.uId,
    required this.totalPrice,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
    required this.status,
    required this.orderID,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      uId: json['uId'],
      totalPrice: json['totalPrice'],
      shippingAddressModel: ShippingAddressModel.fromJson(json['shippingAddress']),
      orderProducts: List<OrderProductModel>.from(
          json['orderProducts'].map((e) => OrderProductModel.fromJson(e))),
      paymentMethod: json['paymentMethod'],
      status: json['status'],
      orderID: json['orderId'],
    );
  }

  toJson() {
    return {
      'uId': uId,
      'status': 'pending',
      'dateTime': DateTime.now().toIso8601String(),
      'totalPrice': totalPrice,
      'shippingAddress': shippingAddressModel.toJson(),
      'orderProducts': orderProducts.map((orderProduct) => orderProduct.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }

  toEntity() {
    return OrderEntity(
      uId: uId,
      totalPrice: totalPrice,
      shippingAddressEntity: shippingAddressModel.toEntity(),
      orderProducts: orderProducts.map((orderProduct) => orderProduct.toEntity()).toList(),
      paymentMethod: paymentMethod,
      orderId: orderID,
      status: fetchEnum(),
    );
  }

  OrderStatusEnum fetchEnum() {
    return OrderStatusEnum.values.firstWhere((e) {
      var enumStatus = e.name.toString();
      return enumStatus == (status ?? 'pending');
    });
  }
}
