

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/helth_repository.dart';
import '../../utils/font_style.dart';
import '../../utils/image_path.dart';
import '../../utils/loading_shimmer.dart';
import '../../utils/strings.dart';
import '../../widgets/error.dart' as error;
import '../../widgets/home_card.dart';


class Home extends GetView<HealthRepository> {
  const Home({Key? key}) : super(key: key);

  /// route: '/home'
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 10),

        /// featch data from repository
        child: Obx(() {
          final _healthPoint = controller.healthPoint;
          num steps;
          num calories;
          if (controller.error.isNotEmpty) {
            return error.Error(controller: controller);
          }

          /// get data from repository and assing to steps and calories
          if (_healthPoint.isNotEmpty) {
            steps = _healthPoint.first.value;
            calories = _healthPoint.last.value;
          } else {
            steps = 0;
            calories = 0;
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppText.hi,
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: AppFont.nunito,
                      fontWeight: FontWeight.w700,
                    ),
                  ),


                ],
              ),
              const SizedBox(height: 40),

              /// if steps is null show shimmer
              LoadingShimmer(
                loading: controller.isLoading.value,
                //if steps is not null show steps
                child: HomeCard(
                  iconPath: ImagePath(context).iconFootSteps,
                  heading: AppText.steps,
                  value: steps.toDouble(),
                  title: '$steps',
                  goal: '15,000',
                ),
              ),

              /// if calories is null show shimmer
              LoadingShimmer(
                loading: controller.isLoading.value,
                //if calories is not null show calories
                child: HomeCard(
                  iconPath: ImagePath(context).iconKcal,
                  heading: AppText.caloriesBurned,
                  value: calories.toDouble(),
                  title: '$calories',
                  goal: '1,000',
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
