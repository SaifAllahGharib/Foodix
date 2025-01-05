import 'package:firebase_core/firebase_core.dart';
import 'package:yummy_home/firebase_options.dart';

Future<void> initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
