part of 'update_order_cubit.dart';

sealed class UpdateOrderState extends Equatable {
  const UpdateOrderState();

  @override
  List<Object> get props => [];
}

final class UpdateOrderInitial extends UpdateOrderState {}

final class UpdateOrderLoading extends UpdateOrderState {}

final class UpdateOrderFailure extends UpdateOrderState {
  final String errMessage;

  const UpdateOrderFailure(this.errMessage);
}

final class UpdateOrderSuccess extends UpdateOrderState {}
