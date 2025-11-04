import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/orders_view_body_bloc_builder.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/update_order_bloc_consumer.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: UpdateOrderBlocConsumer(
        child: OrdersViewBodyBlocBuilder(),
      ),
    );
  }
}
