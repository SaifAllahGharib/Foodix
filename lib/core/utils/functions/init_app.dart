import 'package:firebase_core/firebase_core.dart';
import 'package:yummy_home/core/utils/functions/set_portrait_orientation.dart';
import 'package:yummy_home/core/utils/my_shared_preferences.dart';
import 'package:yummy_home/core/utils/service_locator.dart';
import 'package:yummy_home/firebase_options.dart';

Future<void> initializeApp() async {
  registerSharedPreferences();

  await Future.wait([
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    getIt.get<MySharedPreferences>().init(),
  ]);

  setupServiceLocator();
  setPortraitOrientation();
}
