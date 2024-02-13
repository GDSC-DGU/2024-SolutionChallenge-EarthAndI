import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChallengeAuthenticationViewModel extends GetxController {
  late final Rxn<XFile?> _image;

  XFile? get image => _image.value;

  @override
  void onInit() {
    super.onInit();
    _image = Rxn<XFile?>();
  }

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

  @override
  void dispose() {
    super.dispose();
    _image.close();
  }
}
