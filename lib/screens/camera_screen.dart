import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFiles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // If images are picked, display a carousel, otherwise show a placeholder
          _imageFiles != null ? buildCarousel() : buildPlaceholder(),

          // Add button to pick images
          ElevatedButton(
            onPressed: () async {
              final List<XFile>? files = await _picker.pickMultiImage();
              setState(() {
                _imageFiles = files;
              });
            },
            child: const Text('Pick Images'),
          ),
        ],
      ),
    );
  }

  // Widget to display when no images are picked
  Widget buildPlaceholder() {
    return const Expanded(
      child: Center(
        child: Text('No images picked.'),
      ),
    );
  }

  // Widget to display the image carousel
  Widget buildCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * .7, // Full screen height
        viewportFraction: 1.0, // Full screen width
        enlargeCenterPage: true, // For a 'cover flow' effect
        autoPlay: true, // For automatic sliding
      ),
      items: _imageFiles!.map((file) {
        return Image.file(
          File(file.path),
          fit: BoxFit.cover, // To make the image fill the carousel
        );
      }).toList(),
    );
  }
}
