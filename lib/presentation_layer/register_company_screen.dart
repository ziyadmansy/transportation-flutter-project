import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterCompanyScreen extends StatefulWidget {
  const RegisterCompanyScreen({Key? key}) : super(key: key);

  @override
  State<RegisterCompanyScreen> createState() => _RegisterCompanyScreenState();
}

class _RegisterCompanyScreenState extends State<RegisterCompanyScreen> {
  XFile? image;

  Future<void> pickImageGallery() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          image == null
              ? SizedBox(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: Text(
                      'Pick an Image',
                    ),
                  ))
              : Image.file(
                  File(image!.path),
                  width: 100,
                  height: 100,
                ),
        ],
      ),
    );
  }
}
