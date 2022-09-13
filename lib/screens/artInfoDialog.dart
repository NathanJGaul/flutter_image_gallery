import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:dio/dio.dart';

Future<void> artInfoDialog(
    BuildContext context, String prompt, String downloadUrl) {
  return showGeneralDialog<void>(
    context: context,
    barrierColor: Colors.black38,
    barrierLabel: 'Art Info',
    barrierDismissible: true,
    pageBuilder: (_, __, ___) => GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text(
            prompt,
            style: const TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'downloadBtn',
          onPressed: () {
            saveImageToGallery(downloadUrl);
          },
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          child: const Icon(Icons.download),
        ),
      ),
    ),
  );
}

void saveImageToGallery(String imageUrl) async {
  var response = await Dio()
      .get(imageUrl, options: Options(responseType: ResponseType.bytes));
  final result = await ImageGallerySaver.saveImage(
      Uint8List.fromList(response.data),
      quality: 100,
      name: "hello");
}
