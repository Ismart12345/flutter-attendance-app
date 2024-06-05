import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:student/bindings/general_bindings.dart';
import 'package:student/features/authentication/controllers/authentication_repsotory.dart';
import 'package:student/features/authentication/screens/onboarding/onboarding.dart';
import 'package:student/features/navigate_screens/your_location_screen.dart';
import 'package:student/firebase_options.dart';
import 'package:student/utils/theme/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  final WidgetsBinding widgetBinding =
      WidgetsFlutterBinding.ensureInitialized();
  // GETX LOCAL STORAGE
  await GetStorage.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  // Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialBinding: GeneralBindings(),
      debugShowCheckedModeBanner: false,
      theme: MyAppTheme.lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: MyAppTheme.darkTheme,
      home: OnBoardingScreen(),
    );
  }
}
