abstract class Failure {
  final String errorMsg;

  Failure(this.errorMsg);
}

class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure(super.errorMsg);
}

class FirebaseFailure extends Failure {
  FirebaseFailure(super.errorMsg);
}
