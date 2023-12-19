import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dashboard_page.dart';
import 'theme_provider.dart';
import 'package:google_sign_in/google_sign_in.dart'; // Add this line

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GoogleSignInAccount? _currentUser;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly'
  ]);

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        print('User is already authenticated');
        // Navigate to the dashboard after successful sign-in
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardPage(user: _currentUser!),
          ),
        );
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print('Sign in error: $error');
    }
  }

  Future<void> handleSignOut() async {
    await _googleSignIn.disconnect();
    setState(() {
      _currentUser = null;
    });
  }

  Widget buildBody() {
    if (_currentUser != null) {
      return Column(
        children: [
          const SizedBox(height: 90),
          GoogleUserCircleAvatar(identity: _currentUser!),
          const SizedBox(height: 20),
          Center(
            child: Text(
              _currentUser!.displayName ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: Provider.of<ThemeProvider>(context).fontSize,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(_currentUser!.email, textAlign: TextAlign.center),
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            onPressed: handleSignOut,
            child: const Text('Sign Out'),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          const SizedBox(height: 100),
          Center(
            child: Image.asset("assets/google.png", height: 50, width: 50),
          ),
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Welcome to Google Account',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 300),
          Center(
            child: SizedBox(
              width: 190,
              child: ElevatedButton(
                onPressed: handleSignIn,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 8, 6),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Image.asset(
                            "assets/google.png",
                            height: 50,
                            width: 50,
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Container(child: buildBody()),
    );
  }
}
