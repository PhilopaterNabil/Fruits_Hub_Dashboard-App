import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper/get_order_dummy_data.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/managers/fetch_orders_cubit/fetch_orders_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/orders_view_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrdersViewBodyBlocBuilder extends StatelessWidget {
  const OrdersViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOrdersCubit, FetchOrdersState>(
      builder: (context, state) {
        if (state is FetchOrdersSuccess) {
          return OrdersViewBody(ordersEntity: state.orders);
        } else if (state is FetchOrdersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FetchOrdersFailure) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return Skeletonizer(
            child: OrdersViewBody(
              ordersEntity: [
                getDummyOrder(),
                getDummyOrder(),
                getDummyOrder(),
              ],
            ),
          );
        }
      },
    );
  }
}
