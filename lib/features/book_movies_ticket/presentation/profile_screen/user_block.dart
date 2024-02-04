// user_bloc.dart
import 'package:book_my_movie/features/book_movies_ticket/presentation/profile_screen/user_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserProfileEmpty()) {
    on<FetchUserProfile>((event, emit) {
      // Simulate fetching user data
      emit(UserProfileLoading());
      Future.delayed(Duration(seconds: 2), () {
        emit(UserProfileLoaded(username: "John Doe", bio: "Movie enthusiast"));
      });
    });
  }
}
