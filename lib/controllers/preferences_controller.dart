import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// All preferences in one place.
class PreferencesController extends GetxController {
  static PreferencesController get to => Get.find<PreferencesController>();

  final _prefs = GetStorage();

  var _theme = 'system'.obs; // Theme: light, dark, system.

  PreferencesController() {
    _theme.value = _prefs.read('theme') ?? 'system';
  }

  // Theme.
  String get theme => _theme.value;

  set theme(String theme) {
    _theme.value = theme;
    _prefs.write('theme', theme);
  }
}
