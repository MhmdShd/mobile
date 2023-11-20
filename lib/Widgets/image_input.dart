import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class imageInput extends StatefulWidget {
  const imageInput({required this.passFunction, super.key});
  final Function(XFile) passFunction;
  @override
  State<StatefulWidget> createState() {
    return _imageInputState();
  }
}

class _imageInputState extends State<imageInput> {
  File? _selectedImage;
  String? _selectedImageName;
  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _selectedImage = File(pickedImage.path);
      widget.passFunction(pickedImage);
      _selectedImageName = pickedImage.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      icon: const Icon(Icons.camera),
      label: const Text('Upload Image'),
      onPressed: _takePicture,
    );
    if (_selectedImage != null) {
      content = TextButton.icon(
        icon: const Icon(Icons.camera),
        label: Text(_selectedImageName!),
        onPressed: _takePicture,
      );
    }
    return Container(
        height: 50,
        width: 50,
        child: content);
  }
}
