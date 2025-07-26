import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper/build_bar.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_progress_hud.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/managers/add_product/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductViewBodyBlocBuilder extends StatelessWidget {
  const AddProductViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          buildBar(context, 'Product added successfully');
        } else if (state is AddProductFailure) {
          buildBar(context, state.errMessage);
        }
      },
      builder: (context, state) => CustomProgressHud(
        isLoading: state is AddProductLoading,
        child: AddProductViewBody(),
      ),
    );
  }
}
