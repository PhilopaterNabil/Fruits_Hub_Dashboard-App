import 'package:fruits_hub_dashboard/core/routing/routes.dart';
import 'package:fruits_hub_dashboard/features/dashboard/views/dashboard_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.dashboardScreen,
    routes: [
      GoRoute(
        path: Routes.dashboardScreen,
        builder: (context, state) => const DashboardView(),
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
