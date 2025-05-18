import 'package:flutter/material.dart';
import 'package:project4/core/widget/custom_list_tile.dart';
import 'package:project4/features/receipt/presentation/controller/image_controller.dart';

class ImageOption extends StatefulWidget {
  const ImageOption({
    super.key,
    required this.imageState,
    required this.controller,
  });
  final ImageController controller;
  final Function(String?) imageState;

  @override
  State<ImageOption> createState() => _ImageOptionState();
}

class _ImageOptionState extends State<ImageOption> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTile(
          title: Text("Take Photo"),
          child: IconButton(
            onPressed: () async {
              final result = await widget.controller.getImage(
                widget.controller.cameraImage,
              );
              widget.imageState(result ?? "There is no Image ");
            },
            icon: Icon(Icons.camera_alt),
          ),
        ),
        CustomListTile(
          title: Text("Choose from Gallery"),
          child: IconButton(
            onPressed: () async {
              final result = await widget.controller.getImage(
                widget.controller.galleryImage,
              );
              widget.imageState(result ?? "There is no Image ");
            },
            icon: Icon(Icons.photo_library),
          ),
        ),
        CustomListTile(
          title: Text("Upload a File"),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.insert_drive_file),
          ),
        ),
      ],
    );
  }
}
