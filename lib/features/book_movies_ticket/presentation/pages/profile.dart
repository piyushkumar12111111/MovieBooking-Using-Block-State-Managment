import 'package:book_my_movie/features/book_movies_ticket/presentation/profile_screen/user_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../profile_screen/user_event.dart';
// Import your user bloc

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(FetchUserProfile()),
      child: Scaffold(
        appBar: AppBar(title: Text("Profile")),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserProfileLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UserProfileLoaded) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Username: ${state.username}",
                        style: TextStyle(fontSize: 24)),
                    SizedBox(height: 10),
                    Text("Bio: ${state.bio}", style: TextStyle(fontSize: 18)),
                  ],
                ),
              );
            } else if (state is UserProfileError) {
              return Center(child: Text("Failed to fetch profile"));
            }
            return Container(); // Empty state
          },
        ),
      ),
    );
  }
}
