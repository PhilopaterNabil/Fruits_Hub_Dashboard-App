import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';

part 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  FetchOrdersCubit(this.ordersRepo) : super(FetchOrdersInitial());
  final OrdersRepo ordersRepo;

  StreamSubscription? _ordersSubscription;
  void fetchOrders() {
    emit(FetchOrdersLoading());
    _ordersSubscription = ordersRepo.fetchOrders().listen((result) {
      result.fold(
        (failure) => emit(FetchOrdersFailure(failure.message)),
        (orders) => emit(FetchOrdersSuccess(orders)),
      );
    });
  }

  @override
  Future<void> close() {
    _ordersSubscription?.cancel();
    return super.close();
  }
}
