import 'package:flutter/material.dart';

class AvatarStack extends StatelessWidget {
  final List<String> imagePaths;
  final double size;
  final double overlap;

  const AvatarStack({
    super.key,
    required this.imagePaths,
    this.size = 35,
    this.overlap = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8),
      height: size,
      width: size + (imagePaths.length - 1) * (size - overlap),
      child: Stack(
        children: imagePaths.asMap().entries.map((entry) {
          final index = entry.key;
          final path = entry.value;
          return Positioned(
            left: index * (size - overlap),
            child: CircleAvatar(
              radius: size / 2,
              backgroundImage: AssetImage(path),
            ),
          );
        }).toList(),
      ),
    );
  }
}
