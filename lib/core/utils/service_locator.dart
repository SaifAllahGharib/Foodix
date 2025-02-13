import 'package:get_it/get_it.dart';
import 'package:yummy_home/core/services/auth_services.dart';
import 'package:yummy_home/core/services/db_services.dart';
import 'package:yummy_home/core/services/firebase_auth_services.dart';
import 'package:yummy_home/core/services/firebase_db_services.dart';
import 'package:yummy_home/core/services/firebase_service.dart';
import 'package:yummy_home/core/utils/image_picker_helper.dart';
import 'package:yummy_home/core/utils/my_shared_preferences.dart';
import 'package:yummy_home/features/home/data/repos/profile/profile_repo_imp.dart';
import 'package:yummy_home/features/login/data/repos/login_repo_imp.dart';
import 'package:yummy_home/features/signup/data/repos/signup_repo_imp.dart';
import 'package:yummy_home/features/verification/data/repos/verificatoin_repo_imp.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FirebaseService>(FirebaseService());

  final firebaseService = getIt<FirebaseService>();

  getIt.registerSingleton<AuthServices>(FirebaseAuthServices(firebaseService));

  getIt.registerSingleton<DBServices>(FirebaseDBServices(firebaseService));

  final authServices = getIt<AuthServices>();
  final dbServices = getIt<DBServices>();

  getIt.registerSingleton<SignupRepositoryImp>(
      SignupRepositoryImp(authServices, dbServices));

  getIt.registerSingleton<VerificationRepositoryImp>(
      VerificationRepositoryImp(authServices));

  getIt.registerSingleton<LoginRepositoryImp>(LoginRepositoryImp(authServices));

  getIt.registerSingleton<ProfileRepositoryImp>(
      ProfileRepositoryImp(authServices));

  getIt.registerSingleton<ImagePickerHelper>(ImagePickerHelper());

  getIt.registerSingleton<MySharedPreferences>(MySharedPreferences());
}
