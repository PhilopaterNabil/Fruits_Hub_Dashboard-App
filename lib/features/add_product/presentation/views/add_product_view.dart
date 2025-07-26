import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_app_bar.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body_bloc_builder.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Add Product'),
      body: AddProductViewBodyBlocBuilder(),
    );
  }
}
