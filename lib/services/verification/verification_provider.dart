import 'package:image_picker/image_picker.dart';

abstract class VerificationProvider {
  Future getVerificationDetails() async {}

  addShopCategory(String categoryName) async {}

  Future uploadShopPhotos(List<XFile> shopPhotos) async {}

  Future uploadPancardPhotos(List<XFile> pancardPhotos) async {}

  Future submitVerificationDetails({
    required List<String> shopPhotosList,
    required List<String> panCardDetailsList,
    required String pancardNumber,
    required List<double> businessLocation,
  }) async {}
}
