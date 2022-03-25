
import 'package:get/get.dart';

import '../controller/helth_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HealthRepository());
  }
}
