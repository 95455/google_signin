import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googlesignin/components/settings_page.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class DashboardPage extends StatelessWidget {
  final GoogleSignInAccount user;

  const DashboardPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Container(
              height: 100,
              width: 100,
              child: GoogleUserCircleAvatar(identity: user)),
          const SizedBox(height: 20),
          Center(
            child: Text(
              user.displayName ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: Provider.of<ThemeProvider>(context).fontSize,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(user.email, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
