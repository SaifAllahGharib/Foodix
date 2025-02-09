import 'package:get_it/get_it.dart';
import 'package:yummy_home/core/services/auth_service.dart';
import 'package:yummy_home/core/services/firebase_auth_services.dart';
import 'package:yummy_home/core/services/firebase_service.dart';
import 'package:yummy_home/features/signup/data/repos/signup_repo_imp.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseService>(FirebaseService());

  getIt.registerSingleton<AuthService>(
    FirebaseAuthServices(getIt.get<FirebaseService>()),
  );

  getIt.registerSingleton<SignupRepositoryImp>(
    SignupRepositoryImp(getIt.get<AuthService>()),
  );

  // getIt.registerSingleton<LoginRepositoryImp>(
  //   LoginRepositoryImp(getIt.get<Api>()),
  // );
  //
  // getIt.registerSingleton<VerificationRepositoryImp>(
  //   VerificationRepositoryImp(getIt.get<Api>()),
  // );
  //
  // getIt.registerSingleton<ForgetPasswordRepositoryImp>(
  //   ForgetPasswordRepositoryImp(getIt.get<Api>()),
  // );
  //
  // getIt.registerSingleton<ChangePasswordRepositoryImp>(
  //   ChangePasswordRepositoryImp(getIt.get<Api>()),
  // );
}
