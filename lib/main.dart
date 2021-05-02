import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'package:flutter_template/pages/pages.dart';
import 'package:flutter_template/pages/home_page.dart';
import 'package:flutter_template/pages/second_page.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/preferences_controller.dart';
import 'controllers/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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

      onReady: () async {
        // Get and set the locale.
        Intl.defaultLocale = window.locale.languageCode;
        await initializeDateFormatting(window.locale.countryCode);
      },

      // Routing.
      initialRoute: Pages.initialPage,
      getPages: [
        GetPage(name: Pages.homePage, page: () => HomePage()),
        GetPage(name: Pages.secondPage, page: () => SecondPage()),
        // Add more pages here.
      ],
      home: HomePage(),
    );
  }
}
