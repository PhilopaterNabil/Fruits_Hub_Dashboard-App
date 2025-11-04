import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub_dashboard/core/helper/extensions.dart';
import 'package:fruits_hub_dashboard/core/routing/routes.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            onPressed: () => context.pushTo(Routes.addProductScreen),
            title: 'Add New Item Data',
          ),
          SizedBox(height: 16.h),
          CustomButton(
            onPressed: () => context.pushTo(Routes.ordersScreen),
            title: 'View All Orders',
          ),
        ],
      ),
    );
  }
}
