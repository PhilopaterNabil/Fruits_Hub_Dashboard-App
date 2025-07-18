import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub_dashboard/core/routing/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Fruits Hub Dashboard',
        // localizationsDelegates: [
        //   // S.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        // supportedLocales: S.delegate.supportedLocales,
        // locale: const Locale('ar'),
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   scaffoldBackgroundColor: Colors.white,
        //   appBarTheme: AppBarTheme(
        //     backgroundColor: Colors.white,
        //     elevation: 0,
        //   ),
        //   // fontFamily: FontType.kCairo,
        //   useMaterial3: true,
        // ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
