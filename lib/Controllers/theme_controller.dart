import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  Rx<ThemeMode> theme = ThemeMode.light.obs;
  void changeTheme(ThemeMode themeMode) {
    theme.value = themeMode;
    Get.changeThemeMode(themeMode);
  }
}
