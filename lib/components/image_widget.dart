import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_weather_project/extentions/sizes.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.path,
    required this.imgWidth,
    required this.imgHeight,
  });

  final String path;
  final double imgWidth;
  final double imgHeight;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: path,
      height: imgHeight,
      width: imgWidth,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) => SizedBox(
        height: context.getHeight() / 4,
        width: 150,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: 40,
            ),
             Text(
              'Image not found',
            )
          ],
        ),
      ),
    );
  }
}
