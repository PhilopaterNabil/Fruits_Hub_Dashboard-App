import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/order_item_widget.dart';

class OrderItemListView extends StatelessWidget {
  const OrderItemListView({super.key, required this.ordersEntity});

  final List<OrderEntity> ordersEntity;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ordersEntity.length,
      itemBuilder: (context, index) => OrderItemWidget(
        orderentity: ordersEntity[index],
      ),
    );
  }
}
