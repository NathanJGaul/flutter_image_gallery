import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ArtImage extends StatelessWidget {
  const ArtImage({
    Key? key,
    required this.currentImageUrl,
  }) : super(key: key);

  final String currentImageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: currentImageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator.adaptive(value: downloadProgress.progress),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
