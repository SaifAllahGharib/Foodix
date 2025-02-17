abstract class MainSellerState {}

class MainSellerInit extends MainSellerState {}

class MainSellerLoading extends MainSellerState {}

class MainSellerSuccess extends MainSellerState {}

class MainSellerAddCategory extends MainSellerState {}

class MainSellerAddFood extends MainSellerState {}

class MainSellerEnableButton extends MainSellerState {}

class MainSellerFailure extends MainSellerState {
  final String errorMsg;

  MainSellerFailure(this.errorMsg);
}
