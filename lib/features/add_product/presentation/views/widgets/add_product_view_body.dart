import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Product Name',
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16),
              CustomTextField(
                hintText: 'Product Price',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextField(
                hintText: 'Product Code',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextField(
                hintText: 'Product Description',
                keyboardType: TextInputType.text,
                maxLines: 5,
              ),
              SizedBox(height: 16),
              ImageField(
                onFileChanged: (image) {
                  // Handle the image file change
                  if (image != null) {
                    // Do something with the selected image
                    print('Selected image: ${image.path}');
                  } else {
                    print('No image selected');
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
