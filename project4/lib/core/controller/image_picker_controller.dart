import 'package:image_picker/image_picker.dart';

class ImagePickerController {
  final ImagePicker picker = ImagePicker();
  final cameraImage = (ImageSource.camera);
  final galleryImage = (ImageSource.gallery);
  XFile? selectedImage;

  Future<String?> getImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      selectedImage = image;
      return image.path;
    } else {
      return null;
    }
  }
}
