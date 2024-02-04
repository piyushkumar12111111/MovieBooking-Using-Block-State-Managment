// user_event.dart
abstract class UserEvent {}

class FetchUserProfile extends UserEvent {}

// user_state.dart
abstract class UserState {}

class UserProfileEmpty extends UserState {}

class UserProfileLoading extends UserState {}

class UserProfileLoaded extends UserState {
  final String avatarUrl;
  final String name;
  final String email;
  final String phoneNumber;
  final List<dynamic> orderHistory;
  final String shippingAddress;

  UserProfileLoaded({
    required this.avatarUrl,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.orderHistory,
    required this.shippingAddress,
  });
}

class UserProfileError extends UserState {
  final String message;
  UserProfileError({required this.message});
}
