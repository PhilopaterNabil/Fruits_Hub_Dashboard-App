import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

abstract class OrdersRepo {
  Stream<Either<Failures, List<OrderEntity>>> fetchOrders();

  Future<Either<Failures, void>> updateOrder({
    required OrderStatusEnum status,
    required String orderId,
  });
}
