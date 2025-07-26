import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/custom_check_box.dart';

class IsOrganicCheckBox extends StatefulWidget {
  const IsOrganicCheckBox({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<IsOrganicCheckBox> createState() => _IsOrganicCheckBoxState();
}

class _IsOrganicCheckBoxState extends State<IsOrganicCheckBox> {
  bool isOrganic = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
              text: 'Is Product Organic?',
              style:
                  AppTextStyles.font13AccentGreenSemiBold.copyWith(color: AppColors.lightGreyColor),
            ),
          ),
        ),
        Spacer(),
        CustomCheckBox(
          isChecked: isOrganic,
          onChecked: (value) {
            setState(() {
              isOrganic = value;
              widget.onChanged(value);
            });
          },
        ),
      ],
    );
  }
}
