import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/enums/order_status_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/managers/update_order_cubit/update_order_cubit.dart';

class OrderActionButtons extends StatelessWidget {
  const OrderActionButtons({
    super.key,
    required this.orderEntity,
  });

  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Visibility(
          visible: orderEntity.status == OrderStatusEnum.pending,
          child: ElevatedButton(
            onPressed: () {
              context
                  .read<UpdateOrderCubit>()
                  .updateOrder(status: OrderStatusEnum.accepted, orderId: orderEntity.orderId);
            },
            child: const Text('Accept'),
          ),
        ),
        Visibility(
          visible: orderEntity.status == OrderStatusEnum.pending,
          child: ElevatedButton(
            onPressed: () {
              context
                  .read<UpdateOrderCubit>()
                  .updateOrder(status: OrderStatusEnum.cancelled, orderId: orderEntity.orderId);
            },
            child: const Text('Reject'),
          ),
        ),
        Visibility(
          visible: orderEntity.status == OrderStatusEnum.accepted,
          child: ElevatedButton(
            onPressed: () {
              context
                  .read<UpdateOrderCubit>()
                  .updateOrder(status: OrderStatusEnum.delivered, orderId: orderEntity.orderId);
            },
            child: const Text('Delivered'),
          ),
        ),
      ],
    );
  }
}
