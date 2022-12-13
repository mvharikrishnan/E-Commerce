import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FireBaseApi {
  static uploadFile(String destination, File file) async {
    //final String ImageURL = 'https://propertywiselaunceston.com.au/wp-content/themes/property-wise/images/no-image.png';
    final ref = FirebaseStorage.instance.ref(destination);
    final UploadTask = ref.putFile(file);
    // try {
      final snapshot = await UploadTask.whenComplete(() {});
      final ImageURL = await snapshot.ref.getDownloadURL();
      log('image $ImageURL');
    // } on FirebaseException catch (e) {
    //   return log('Exception occured $e');
    // }
    return ImageURL;
  }
}
