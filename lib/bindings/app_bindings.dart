import 'package:get/get.dart';

import '../controllers/base_app_controller.dart';

class AppBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(BaseAppController());
  }
}