import 'package:flutter_image_gallery/Carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_gallery/models/imageRef.dart';
import 'package:flutter_image_gallery/providers/images.dart';
import 'package:flutter_image_gallery/widgets/ArtImage.dart';

class ImageGrid extends StatefulWidget {
  const ImageGrid({super.key});

  @override
  State<ImageGrid> createState() => _ImageGridState();
}

class _ImageGridState extends State<ImageGrid> {
  List<ImageRef> images = <ImageRef>[];

  @override
  void initState() {
    super.initState();
    _initImages();
  }

  Future<void> _initImages() async {
    List<ImageRef> newImages = await getImages();

    setState(() {
      images = newImages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                // go to selected carousel image index
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Carousel(images: images, index: index);
                }));
              },
              child: ArtImage(currentImageUrl: images[index].downloadUrl),
            );
          }),
    );
  }
}
