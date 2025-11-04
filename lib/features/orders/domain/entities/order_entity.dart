import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_product_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

class OrderEntity {
  final String uId;
  final String orderId;
  final double totalPrice;
  final ShippingAddressEntity shippingAddressEntity;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;
  final OrderStatusEnum status;

  OrderEntity({
    required this.uId,
    required this.orderId,
    required this.totalPrice,
    required this.shippingAddressEntity,
    required this.orderProducts,
    required this.paymentMethod,
    required this.status,
  });
}
