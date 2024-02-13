import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChallengeAuthenticationViewModel extends GetxController {
  final _image = Rx<XFile?>(null);
  XFile? get image => _image.value;

  void getImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      _image.value = image;
    }
  }

  void removeImage() {
    _image.value = null;
  }
}
