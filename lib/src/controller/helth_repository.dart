import 'package:get/get.dart';
import 'package:health/health.dart';

import '../services/health_services.dart';

class HealthRepository extends GetxController {
  var healthPoint = <HealthDataPoint>[].obs;
  var error = "".obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchHealthData();
  }

  void fetchHealthData() async {
    try {
      isLoading.value = true;
      final healthData = await HealthService.fetchHealthData();
      healthPoint.assignAll(healthData);
      error.value = "";
      isLoading.value = false;
    } catch (e) {
      error.value = e.toString();
    }
    update();
  }
}
