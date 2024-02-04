
import 'package:book_my_movie/features/book_movies_ticket/presentation/profile_screen/user_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../profile_screen/user_event.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(FetchUserProfile()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.orange),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserProfileLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is UserProfileLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(state.avatarUrl), // Placeholder for profile image URL
                    ),
                    SizedBox(height: 8),
                    Text(state.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Text(state.email, style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ListView(
                      shrinkWrap: true,
                      children: [
                        ProfileListItem(icon: Icons.history, text: 'Order History'),
                        ProfileListItem(icon: Icons.location_on, text: 'Shipping Address'),
                        // Add more items here
                        ProfileListItem(icon: Icons.logout, text: 'Log out'),
                      ],
                    ),
                  ],
                ),
              );
            } else if (state is UserProfileError) {
              return Center(child: Text("Failed to fetch profile"));
            }
            return Center(child: Text("Please wait..."));
          },
        ),
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const ProfileListItem({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(text),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.orange),
      onTap: () {
        // Handle item tap
      },
    );
  }
}
