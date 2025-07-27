import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/product_entity.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/managers/add_product/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_check_box.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/is_organic_check_box.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late num price, expirationsMonths, numberOfCalories, unitAmount;
  File? image;
  bool isFeatured = false;
  bool isOrganic = false;

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
                onSaved: (value) {
                  if (value != null && value.isNotEmpty) {
                    name = value;
                  } else {
                    name = ''; // Default value if empty
                  }
                },
              ),
              SizedBox(height: 16),
              CustomTextField(
                hintText: 'Product Price',
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  if (value != null && value.isNotEmpty) {
                    price = num.parse(value);
                  } else {
                    price = 0; // Default value if empty
                  }
                },
              ),
              SizedBox(height: 16),
              CustomTextField(
                hintText: 'Expiration Months',
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  if (value != null && value.isNotEmpty) {
                    expirationsMonths = num.parse(value);
                  } else {
                    expirationsMonths = 0; // Default value if empty
                  }
                },
              ),
              SizedBox(height: 16),
              CustomTextField(
                hintText: 'Number of Calories',
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  if (value != null && value.isNotEmpty) {
                    numberOfCalories = num.parse(value);
                  } else {
                    numberOfCalories = 0; // Default value if empty
                  }
                },
              ),
              SizedBox(height: 16),
              CustomTextField(
                hintText: 'Unit Amount',
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  if (value != null && value.isNotEmpty) {
                    unitAmount = int.parse(value);
                  } else {
                    unitAmount = 0; // Default value if empty
                  }
                },
              ),
              SizedBox(height: 16),
              CustomTextField(
                hintText: 'Product Code',
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  if (value != null && value.isNotEmpty) {
                    code = value.toLowerCase();
                  } else {
                    code = ''; // Default value if empty
                  }
                },
              ),
              SizedBox(height: 16),
              CustomTextField(
                hintText: 'Product Description',
                keyboardType: TextInputType.text,
                maxLines: 5,
                onSaved: (value) {
                  if (value != null && value.isNotEmpty) {
                    description = value;
                  } else {
                    description = ''; // Default value if empty
                  }
                },
              ),
              SizedBox(height: 16),
              IsFeaturedCheckBox(
                onChanged: (isFeatured) {
                  setState(() {
                    this.isFeatured = isFeatured;
                  });
                },
              ),
              SizedBox(height: 16),
              IsOrganicCheckBox(
                onChanged: (isOrganic) {
                  setState(() {
                    this.isOrganic = isOrganic;
                  });
                },
              ),
              SizedBox(height: 16),
              ImageField(
                onFileChanged: (image) {
                  setState(() {
                    this.image = image;
                  });
                },
              ),
              SizedBox(height: 24),
              CustomButton(
                title: 'Add Product',
                onPressed: () {
                  if (image != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ProductEntity addProductEntity = ProductEntity(
                        name: name,
                        code: code,
                        description: description,
                        price: price,
                        image: image!,
                        isFeatured: isFeatured,
                        expirationsMonths: expirationsMonths.toInt(),
                        numberOfCalories: numberOfCalories.toInt(),
                        unitAmount: unitAmount.toInt(),
                        isOrganic: isOrganic,
                        reviews: [],
                      );

                      context.read<AddProductCubit>().addProduct(addProductEntity);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    showError(context);
                  }
                },
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Please select an image for the product.'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
