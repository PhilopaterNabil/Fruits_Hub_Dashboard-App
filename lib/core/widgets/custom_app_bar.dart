import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/helper/extensions.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruits_hub_dashboard/core/widgets/notification_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.onPressed,
    this.isLeading = true,
    this.isNotificationEnabled = false,
  });

  final String title;
  final void Function()? onPressed;
  final bool isLeading;
  final bool isNotificationEnabled;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: isLeading
          ? IconButton(
              onPressed: onPressed ?? () => context.pop(),
              icon: Icon(Icons.arrow_back_ios_new),
            )
          : null,
      title: Text(title, style: AppTextStyles.font19BlackBold),
      centerTitle: true,
      actions: isNotificationEnabled
          ? [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: NotificationWidget(),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
