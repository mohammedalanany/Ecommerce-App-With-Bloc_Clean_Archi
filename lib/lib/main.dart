import 'package:flutter/material.dart';
import 'package:round/src/my_app.dart';

import 'core/dependency_injection/locator.dart';
import 'core/dependency_injection/locator_service.dart';
import 'core/theme/loading_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServices();
  await LocatorService.cacheHelper.cacheInitialization();

  configLoading();
  runApp(MyApp());
}
