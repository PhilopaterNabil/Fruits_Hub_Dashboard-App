import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/di/dependency_injection.dart';
import 'package:fruits_hub_dashboard/core/routing/routes.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/managers/add_product/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/add_product_view.dart';
import 'package:fruits_hub_dashboard/features/dashboard/views/dashboard_view.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/managers/cubit/update_order_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/managers/fetch_orders_cubit/fetch_orders_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/orders_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.dashboardScreen,
    routes: [
      GoRoute(
        path: Routes.dashboardScreen,
        builder: (context, state) => const DashboardView(),
      ),
      GoRoute(
        path: Routes.addProductScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<AddProductCubit>(),
          child: const AddProductView(),
        ),
      ),
      GoRoute(
        path: Routes.ordersScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<FetchOrdersCubit>()..fetchOrders(),
            ),
            BlocProvider(
              create: (context) => getIt<UpdateOrderCubit>(),
            ),
          ],
          child: const OrdersView(),
        ),
      ),
    ],
  );
  // Route<dynamic>? generateRoute(RouteSettings settings) {
  //   // final arguments = settings.arguments;

  //   switch (settings.name) {
  //     case Routes.splashScreen:
  //       return MaterialPageRoute(
  //         builder: (context) => BlocProvider(
  //           create: (context) => SplashCubit(getIt())..navigateNext(),
  //           child: const SplashView(),
  //         ),
  //       );
  //     case Routes.onBoardingScreen:
  //       return MaterialPageRoute(builder: (context) => const OnBoardingView());
  //     case Routes.loginScreen:
  //       return MaterialPageRoute(builder: (context) => const LoginView());
  //     default:
  //       return null;
  //   }
  // }
}
