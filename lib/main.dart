import 'package:flutter/material.dart';
import 'package:flutter_template/pages/home_page.dart';
import 'package:flutter_template/pages/second_page.dart';
import 'dart:ui';

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/preferences_controller.dart';
import 'controllers/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get and set the locale.
  Intl.defaultLocale = window.locale.languageCode;
  await initializeDateFormatting(window.locale.countryCode);

  await GetStorage.init();

  // Lazily initialize the GetX controllers.
  Get.lazyPut<ThemeController>(() => ThemeController());
  Get.lazyPut<PreferencesController>(() => PreferencesController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Template',

      // Theme.
      theme: ThemeData.light().copyWith(primaryColor: Colors.lightGreen),
      darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.green),
      themeMode: ThemeController.to.theme.value,

      // Routing.
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/second', page: () => SecondPage()),
        // Add more pages here.
      ],
      home: HomePage(),
    );
  }
}
