import 'dart:io';

import 'package:aleef/repository/api_network.dart';
import 'package:image_picker/image_picker.dart';

/// Controller to manage loading and adding images for the Paw Gallery.
class PawGallaryController {
  // List holding URLs of images fetched from the network
  List<String> imageURl = [];
  // Loading state to indicate whether images are being fetched
  bool isLoading = true;

  /// Fetches 10 images asynchronously from the remote API.
  getImage() async {
    isLoading = true;
    imageURl.clear();
    for (var i = 0; i < 10; i++) {
      final dataResponse = await ApiNetwork.getImage();
      imageURl.add(dataResponse["url"]);
    }
    isLoading = false;
  }

  /// Opens the device gallery to pick a single image.
  Future<void> getImageLocale(List<File> imagePick) async {
    final ImagePicker picker = ImagePicker();
    final response = await picker.pickImage(source: ImageSource.gallery);
    if (response != null) {
      imagePick.add(File(response.path));
    } else {
      print('Not found');
    }
  }
}
