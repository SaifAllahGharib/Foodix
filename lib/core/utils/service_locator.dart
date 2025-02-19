import 'package:get_it/get_it.dart';
import 'package:yummy_home/core/services/auth_services.dart';
import 'package:yummy_home/core/services/db_services.dart';
import 'package:yummy_home/core/services/firebase_auth_services.dart';
import 'package:yummy_home/core/services/firebase_db_services.dart';
import 'package:yummy_home/core/services/firebase_service.dart';
import 'package:yummy_home/core/utils/image_picker_helper.dart';
import 'package:yummy_home/core/utils/my_shared_preferences.dart';
import 'package:yummy_home/features/add_food/data/repos/add_food_repo_imp.dart';
import 'package:yummy_home/features/home/data/repos/home/home_repo_imp.dart';
import 'package:yummy_home/features/home/data/repos/main_seller/main_seller_repo_imp.dart';
import 'package:yummy_home/features/home/data/repos/profile/profile_repo_imp.dart';
import 'package:yummy_home/features/login/data/repos/login_repo_imp.dart';
import 'package:yummy_home/features/signup/data/repos/signup_repo_imp.dart';
import 'package:yummy_home/features/verification/data/repos/verificatoin_repo_imp.dart';

final GetIt getIt = GetIt.instance;

void registerSharedPreferences() {
  getIt.registerSingleton<MySharedPreferences>(MySharedPreferences());
}

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

  getIt.registerSingleton<HomeRepositoryImp>(HomeRepositoryImp(dbServices));

  getIt.registerSingleton<ProfileRepositoryImp>(
      ProfileRepositoryImp(authServices, dbServices));

  getIt.registerSingleton<MainSellerRepositoryImp>(
      MainSellerRepositoryImp(dbServices));

  getIt.registerSingleton<AddFoodRepositoryImp>(
      AddFoodRepositoryImp(dbServices));

  getIt.registerSingleton<ImagePickerHelper>(ImagePickerHelper());
}
