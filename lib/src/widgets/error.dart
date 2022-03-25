import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../controller/helth_repository.dart';
import '../utils/strings.dart';


class Error extends StatelessWidget {
  const Error({required this.controller, Key? key}) : super(key: key);
  final HealthRepository controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            AppText.error,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          TextButton(
            onPressed: () => controller.fetchHealthData(),
            child: const Text(AppText.retry),
          ),
          TextButton(
            onPressed: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else if (Platform.isIOS) {
                exit(0);
              }
            },
            child: const Text(AppText.exit),
          ),
        ],
      ),
    );
  }
}
