import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoint.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService databaseService;

  const OrdersRepoImpl(this.databaseService);

  @override
  Stream<Either<Failures, List<OrderEntity>>> fetchOrders() async* {
    try {
      await for (var (dataList) in databaseService.streamData(path: BackendEndpoint.getOrders)) {
        databaseService.streamData(path: BackendEndpoint.getOrders);

        List<OrderEntity> ordersEntityList = (dataList as List<dynamic>)
            .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
            .toList();

        yield Right(ordersEntityList);
      }
    } catch (e) {
      yield Left(ServerFailure('Failed to fetch orders: $e'));
    }
  }

  @override
  Future<Either<Failures, void>> updateOrder(
      {required OrderStatusEnum status, required String orderId}) async {
    try {
      await databaseService.updateData(path: BackendEndpoint.updateOrder, data: {'status': status.name}, documentId: orderId);
      return right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to update order: $e'));
    }
  }
}
