import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit(this.ordersRepo) : super(UpdateOrderInitial());

  final OrdersRepo ordersRepo;

  Future<void> updateOrder({required OrderStatusEnum status, required String orderId}) async {
    emit(UpdateOrderLoading());

    final result = await ordersRepo.updateOrder(status: status, orderId: orderId);

    result.fold((f) {
      emit(UpdateOrderFailure(f.message));
    }, (r) {
      emit(UpdateOrderSuccess());
    });
  }
}
