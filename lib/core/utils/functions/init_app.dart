import 'package:firebase_core/firebase_core.dart';
import 'package:yummy_home/core/utils/my_shared_preferences.dart';
import 'package:yummy_home/core/utils/service_locator.dart';
import 'package:yummy_home/firebase_options.dart';

Future<void> initializeApp() async {
  await Future.wait([
    MySharedPreferences().init(),
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
  ]);

  setupServiceLocator();
}
