import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_gallery/models/imageRef.dart';

Future<List<ImageRef>> getImages() async {
  final storageRef = FirebaseStorage.instance.ref().child("art/");
  final listResult = await storageRef.listAll();

  final images = [
    for (final item in listResult.items)
      ImageRef(item.name, await item.getDownloadURL())
  ];
  
  return images;
}
