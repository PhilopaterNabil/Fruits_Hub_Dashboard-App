import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onFileChanged});

  final ValueChanged<File?> onFileChanged;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          setState(() {
            isLoading = true;
          });
          try {
            await pickImage();
          } catch (e) {
            print(e);
          }

          setState(() {
            isLoading = false;
          });
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: selectedImage != null ? null : 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
              ),
              child: selectedImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(selectedImage!),
                    )
                  : Icon(
                      Icons.image_outlined,
                      size: 80,
                    ),
            ),
            Visibility(
              visible: selectedImage != null,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    selectedImage = null;
                    widget.onFileChanged(selectedImage);
                  });
                },
                icon: const Icon(
                  Icons.close_outlined,
                  color: AppColors.mistGreyColor,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    image != null ? selectedImage = File(image.path) : null;
    if (selectedImage != null) {
      widget.onFileChanged(selectedImage!);
    }
  }
}
