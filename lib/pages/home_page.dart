import 'package:chatezy/models/user_profile.dart';
import 'package:chatezy/pages/chat_page.dart';
import 'package:chatezy/services/alert_service.dart';
import 'package:chatezy/services/auth_service.dart';
import 'package:chatezy/services/database_service.dart';
import 'package:chatezy/services/navigation_service.dart';
import 'package:chatezy/widgets/chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GetIt _getIt = GetIt.instance;
  late AuthService _authService;
  late NavigationService _navigationService;
  late AlertService _alertService;
  late DatabaseService _databaseService;

  @override
  void initState() {
    super.initState();
    _authService = _getIt.get<AuthService>();
    _navigationService = _getIt.get<NavigationService>();
    _alertService = _getIt.get<AlertService>();
    _databaseService = _getIt.get<DatabaseService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 225, 226, 234),
              Color.fromARGB(255, 107, 235, 235),
            ],
          ),
        ),
        child: _buildUI(),
      ),
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: Column(
        children: [
          _header(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 20.0,
              ),
              child: _chatsList(),
            ),
          ),
          Text('Made By Promit Chaudhuri'), // added this line
        ],
      ),
    );
  }

  Widget _header() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 211, 232, 230),
      title: Center(
        child: Text(
          "Messages",
          style: TextStyle(
              color: Color.fromARGB(255, 44, 74, 220),
              fontWeight: FontWeight.w900),
           // changed here
        ),
      ),
      actions: [
        IconButton(
          onPressed: () async {
            bool result = await _authService.logout();
            if (result) {
              _alertService.showToast(
                text: "Logged Out!",
                icon: Icons.check_circle,
              );
              _navigationService.pushReplacementNamed('/login');
            }
          },
          color: Colors.red,
          icon: Icon(
            Icons.logout,
            color: Color.fromARGB(255, 255, 0, 0), // changed here
          ),
        )
      ],
    );
  }

  Widget _chatsList() {
    return StreamBuilder(
      stream: _databaseService.getUSerProfiles(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Unable to load data",
              style: TextStyle(color: Colors.white), // changed here
            ),
          );
        }
        print(snapshot.data);
        if (snapshot.hasData && snapshot.data!= null) {
          final users = snapshot.data!.docs;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: ((context, index) {
              UserProfile user = users[index].data();
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: ChatTile(
                  userProfile: user,
                  onTap: () async {
                    final chatExists = await _databaseService.checkChatExists(
                      _authService.user!.uid,
                      user.uid!,
                    );
                    if (!chatExists) {
                      await _databaseService.createNewChat(
                        _authService.user!.uid,
                        user.uid!,
                      );
                    }
                    _navigationService.push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ChatPage(
                            chatUser: user,
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            }),
          );
        }
        return Center(
          child: CircularProgressIndicator(
            color: Colors.white, // changed here
          ),
        );
      },
    );
  }
}