// user_bloc.dart
import 'package:book_my_movie/features/book_movies_ticket/presentation/profile_screen/user_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_my_movie/features/book_movies_ticket/presentation/profile_screen/user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserProfileEmpty()) {
    on<FetchUserProfile>((event, emit) async {
      emit(UserProfileLoading());
      try {
        // Simulate fetching data from a repository or service
        await Future.delayed(Duration(seconds: 2));
        // Simulate successful data fetching
        emit(UserProfileLoaded(
          avatarUrl:
              'https://via.placeholder.com/150', // Replace with actual image URL
          name: 'Robi',
          email: 'robi123@gmail.com',
          phoneNumber: '8967452743',
          orderHistory: [], // Replace with actual order history data
          shippingAddress:
              '123 Main St, City, Country', // Replace with actual address
          // Add other properties as needed
        ));
      } catch (error) {
        emit(UserProfileError(message: "Failed to fetch profile"));
      }
    });
  }
}
