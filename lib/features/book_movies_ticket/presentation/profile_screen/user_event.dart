// user_event.dart
abstract class UserEvent {}

class FetchUserProfile extends UserEvent {}

// user_state.dart
abstract class UserState {}

class UserProfileEmpty extends UserState {}

class UserProfileLoading extends UserState {}

class UserProfileLoaded extends UserState {
  final String username;
  final String bio;

  UserProfileLoaded({required this.username, required this.bio});
}

class UserProfileError extends UserState {}
