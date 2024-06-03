import 'package:chatezy/models/user_profile.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final UserProfile userProfile;
  final Function onTap;

  const ChatTile({
    super.key,
    required this.userProfile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap();
      },
      dense: false,
      leading: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: 70, // Set the width
          height: 150, // Set the height
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              userProfile.pfpURL!,
            ),
          ),
        ),
      ),
      title: Text(
        userProfile.name!,
      ),
    );
  }
}
