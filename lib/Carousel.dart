import 'package:flutter/material.dart';
import 'screens/artInfoDialog.dart';
import 'models/imageRef.dart';
import 'package:flutter_image_gallery/widgets/ArtImage.dart';

class Carousel extends StatefulWidget {
  final int index;
  final List<ImageRef> images;
  const Carousel({
    Key? key,
    required this.images,
    required this.index,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PageView.builder(
          allowImplicitScrolling: true,
          itemCount: widget.images.length,
          pageSnapping: true,
          controller: _pageController,
          itemBuilder: (context, pagePosition) {
            final ImageRef currentImage = widget.images[pagePosition];

            return Scaffold(
              floatingActionButton: FloatingActionButton(
                heroTag: 'backBtn$pagePosition',
                onPressed: () {
                  Navigator.of(context).pop();
                },
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                child: const Icon(Icons.chevron_left_outlined),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.startTop,
              body: GestureDetector(
                onTap: () {
                  artInfoDialog(
                      context, currentImage.name, currentImage.downloadUrl);
                },
                child: ArtImage(currentImageUrl: currentImage.downloadUrl),
              ),
            );
          }),
    );
  }
}
