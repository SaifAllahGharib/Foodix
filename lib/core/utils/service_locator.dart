import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:yummy_home/features/login/data/repos/login_repo_imp.dart';
import 'package:yummy_home/features/signup/data/repos/signup_repo_imp.dart';

import 'api.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton(Api(Dio()));
  getIt.registerSingleton<SignupRepositoryImp>(
    SignupRepositoryImp(getIt.get<Api>()),
  );
  getIt.registerSingleton<LoginRepositoryImp>(
    LoginRepositoryImp(getIt.get<Api>()),
  );
}
