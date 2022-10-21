part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class AppThemeModeUpdatedState extends GlobalState {}

class AppLocaleUpdatedState extends GlobalState {}

class CheckingSavedUserLoadingState extends GlobalState {}

class CheckingSavedUserLoadedState extends GlobalState {}

class CheckingSavedUserLoadingErrorState extends GlobalState {
  final String message;

  CheckingSavedUserLoadingErrorState(this.message);
}

class LoginLoadingState extends GlobalState {}

class LoginLoadedState extends GlobalState {
  final String message;
  final String phone;

  LoginLoadedState(this.message, this.phone);
}

class LoginLoadingErrorState extends GlobalState {
  final String message;

  LoginLoadingErrorState(this.message);
}

class VerifyUserLoadingState extends GlobalState {}

class VerifyUserLoadedState extends GlobalState {
  final String message;

  VerifyUserLoadedState(this.message);
}

class VerifyUserLoadingErrorState extends GlobalState {
  final String message;

  VerifyUserLoadingErrorState(this.message);
}

class LogoutLoadingState extends GlobalState {}

class LogoutLoadedState extends GlobalState {
  final String message;

  LogoutLoadedState(this.message);
}

class LogoutLoadingErrorState extends GlobalState {
  final String message;

  LogoutLoadingErrorState(this.message);
}

class FetchingHelpsLoadingState extends GlobalState {}

class FetchingHelpsLoadedState extends GlobalState {}

class FetchingHelpsLoadingErrorState extends GlobalState {
  final String message;

  FetchingHelpsLoadingErrorState(this.message);
}

class FetchingProductsLoadingState extends GlobalState {}

class FetchingProductsLoadedState extends GlobalState {}

class FetchingProductsLoadingErrorState extends GlobalState {
  final String message;

  FetchingProductsLoadingErrorState(this.message);
}

class SelectedProductsCategoryUpdatedState extends GlobalState {}

class CheckingSavedFavouriteLoadedState extends GlobalState {}

class CheckingSavedChartLoadedState extends GlobalState {}

class ToggleProductToChartLoadingState extends GlobalState {}

class ToggleProductToChartLoadedState extends GlobalState {}

class ToggleProductToChartLoadingErrorState extends GlobalState {
  final String message;

  ToggleProductToChartLoadingErrorState(this.message);
}

class ToggleProductToFavouriteLoadingState extends GlobalState {}

class ToggleProductToFavouriteLoadedState extends GlobalState {}

class ToggleProductToFavouriteLoadingErrorState extends GlobalState {
  final String message;

  ToggleProductToFavouriteLoadingErrorState(this.message);
}
