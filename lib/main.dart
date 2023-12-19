/* import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly'
]);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google SigniIn',
      home:  SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late GoogleSignInAccount currentUser;

  @override
  void initstate() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account!;
      });
      if (_currentUser != null) {
        print('user is already authenticated');
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print("sign in error: " + error.toString());
    }
  }

  Future<void> handleSignOut() => _googleSignIn.disconnect();

  Widget buildBody() {
    GoogleSignInAccount user = _currentUser;
    if(user!=null){
      return Column(
        children: [
          const SizedBox(height: 90),
          GoogleUserCircleAvatar(identity: user),
          const SizedBox(height:20),
          Center(
            child: Text(
              user.displayName ?? '',textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 20),
            ),
           SizedBox(height: 10),
            Center(
              child: Text(user.email,textAlign: TextAlign.center),
            ),
            const SizedBox(height: 60),
           /*  Center(
              child: 
              Text('Welcome', style: TextStyle(color: Colors.white.fontsize: 20,textAlign: TextAlign.center)),
          ), */
          const SizedBox(height: 48,),
          ElevatedButton(onPressed: handleSignOut,child: Text('Sign Out'),),


       ) ],
      );
    }else{
      return Column(
        children: [
          const SizedBox(height: 40,),
          Center(
            child: Image.asset("assets/Google.png", height: 200,width: 200,),
          ),
          const SizedBox(height: 40,),
          const Padding(padding: EdgeInsets.all(8.0),child: Text('welcome to google auth', textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold,),),),
          const SizedBox(height: 30,),
          Center(
            child: SizedBox(
              width: 250,
              child: ElevatedButton(onPressed: handleSignIn, child: padding(padding: EdgeInsets.all(15.0),
              child:
              Row(
                children: [
                  Image.asset("assets/google.png"),
                  const SizedBox(width: 20,),
                  const Text("Google sign in")
                ],
              ),)
            ),)

        )],);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Container(
        child:buildBody()
      ),
    );
  }
} */

/* import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly'
]);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google SignIn',
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late GoogleSignInAccount _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account!;
      });
      if (_currentUser != null) {
        print('user is already authenticated');
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print("sign in error: " + error.toString());
    }
  }

  Future<void> handleSignOut() => _googleSignIn.disconnect();

  Widget buildBody() {
    GoogleSignInAccount user = _currentUser;
    if (user != null) {
      return Column(
        children: [
          const SizedBox(height: 90),
          GoogleUserCircleAvatar(identity: user),
          const SizedBox(height: 20),
          Center(
            child: Text(
              user.displayName ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(user.email, textAlign: TextAlign.center),
          ),
          const SizedBox(height: 60),
          const SizedBox(
            height: 48,
          ),
          ElevatedButton(
            onPressed: handleSignOut,
            child: const Text('Sign Out'),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Image.asset(
              "assets/Google.png",
              height: 200,
              width: 200,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Welcome to Google Auth',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: handleSignIn,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/google.png"),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text("Google Sign In")
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
      body: Container(
        child: buildBody(),
      ),
    );
  }
}
 */

/* import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly'
]);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google SignIn',
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late GoogleSignInAccount _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account!;
      });
      if (_currentUser != null) {
        print('user is already authenticated');
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print("sign in error: " + error.toString());
    }
  }

  Future<void> handleSignOut() => _googleSignIn.disconnect();

  Widget buildBody() {
    if (_currentUser != null) {
      GoogleSignInAccount user = _currentUser;
      return Column(
        children: [
          const SizedBox(height: 90),
          GoogleUserCircleAvatar(identity: user),
          const SizedBox(height: 20),
          Center(
            child: Text(
              user.displayName ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(user.email, textAlign: TextAlign.center),
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
          const SizedBox(height: 40),
          Center(
            child: Image.asset("assets/Google.png", height: 200, width: 200),
          ),
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Welcome to Google Auth',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: handleSignIn,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/google.png"),
                      const SizedBox(width: 20),
                      const Text("Google Sign In"),
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
      body: Container(
        child: buildBody(),
      ),
    );
  }
}
 */
/* import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
      // After successful sign-in, you can navigate to the home screen or perform other actions.
      // For example, you can check _googleSignIn.currentUser for user details.
      // ignore: avoid_print
      print(_googleSignIn.currentUser);
    } catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Login Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _handleSignIn,
          child: const Text('Sign in with Google'),
        ),
      ),
    );
  }
}
 */
/* import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String userEmail;

  HomeScreen({required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, $userEmail!'),
            // Add your home screen content here
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
      if (_googleSignIn.currentUser != null) {
        // Navigate to the home screen with user email
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                HomeScreen(userEmail: _googleSignIn.currentUser!.email),
          ),
        );
      }
    } catch (error) {
      // Handle sign-in errors
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Login Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _handleSignIn,
          child: const Text('Sign in with Google'),
        ),
      ),
    );
  }
}
 */

/* import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String userEmail;

  HomeScreen({required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, $userEmail!'),
            // Add your home screen content here
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _handleSignIn() async {
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        // Display a card with account information
        _showAccountSelectionCard(account);
      }
    } catch (error) {
      // Handle sign-in errors
      print(error);
    }
  }

  void _showAccountSelectionCard(GoogleSignInAccount account) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Google Account'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Email: ${account.email}'),
              Text('Display Name: ${account.displayName}'),
              // Add more account information as needed
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Close the dialog and navigate to the home screen
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(userEmail: account.email),
                  ),
                );
              },
              child: Text('Continue'),
            ),
            TextButton(
              onPressed: () {
                // Close the dialog without navigating
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Login Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _handleSignIn,
          child: const Text('Sign in with Google'),
        ),
      ),
    );
  }
} */

/* import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly'
]);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Sign-In',
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        print('User is already authenticated');
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
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
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
          const SizedBox(height: 40),
          Center(
            child: Image.asset("assets/google.png", height: 20, width: 20),
          ),
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Welcome to Google Auth',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: handleSignIn,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset("assets/google.png"),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: const Text("Google Sign In"),
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
} */
/* import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly'
]);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Sign-In',
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GoogleSignInAccount? _currentUser;

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
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
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
          const SizedBox(height: 40),
          Center(
            child: Image.asset("assets/google.png", height: 20, width: 20),
          ),
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Welcome to Google Auth',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: handleSignIn,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset("assets/google.png"),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: const Text("Google Sign In"),
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

class DashboardPage extends StatelessWidget {
  final GoogleSignInAccount user;

  const DashboardPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GoogleUserCircleAvatar(identity: user),
          const SizedBox(height: 20),
          Center(
            child: Text(
              user.displayName ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
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
} */

/* import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly'
]);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Sign-In',
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GoogleSignInAccount? _currentUser;

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
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
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
          const SizedBox(height: 40),
          Center(
            child: Image.asset("assets/google.png", height: 20, width: 20),
          ),
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Welcome to Google Auth',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: handleSignIn,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset("assets/google.png"),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: const Text("Google Sign In"),
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
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to the SettingsPage
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GoogleUserCircleAvatar(identity: user),
          const SizedBox(height: 20),
          Center(
            child: Text(
              user.displayName ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
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

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: const Text('This is the Settings Page'),
      ),
    );
  }
}
 */

/* import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly'
]);

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Sign-In',
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GoogleSignInAccount? _currentUser;

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
          const SizedBox(height: 40),
          Center(
            child: Image.asset("assets/google.png", height: 20, width: 20),
          ),
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Welcome to Google Auth',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: handleSignIn,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset("assets/google.png"),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: const Text("Google Sign In"),
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
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to the SettingsPage
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GoogleUserCircleAvatar(identity: user),
          const SizedBox(height: 20),
          Center(
            child: Text(
              user.displayName ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
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

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Theme Settings'),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: Provider.of<ThemeProvider>(context).isDarkMode,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .setTheme(value);
              },
            ),
            const SizedBox(height: 20),
            const Text('Font Size'),
            Slider(
              value: Provider.of<ThemeProvider>(context).fontSize,
              min: 10.0,
              max: 30.0,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .setFontSize(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ThemeProvider with ChangeNotifier {
  late ThemeData _themeData;
  double _fontSize = 16.0;
  final String _themeKey = 'theme';
  final String _fontSizeKey = 'font_size';

  ThemeProvider() {
    _loadTheme();
  }

  ThemeData get themeData => _themeData;
  double get fontSize => _fontSize;
  bool get isDarkMode => _themeData.brightness == Brightness.dark;

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool(_themeKey) ?? false;
    setTheme(isDarkMode);
    final fontSize = prefs.getDouble(_fontSizeKey) ?? 16.0;
    setFontSize(fontSize);
  }

  void setTheme(bool isDarkMode) {
    _themeData = isDarkMode ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }

  void setFontSize(double fontSize) {
    _fontSize = fontSize;
    notifyListeners();
    saveFontSize();
  }

  void setDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_themeKey, true);
    setTheme(true);
  }

  void setLightMode() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_themeKey, false);
    setTheme(false);
  }

  void saveFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble(_fontSizeKey, _fontSize);
  }
}
 */

/* import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly'
]);

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Google Sign-In',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GoogleSignInAccount? _currentUser;

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
          const SizedBox(height: 40),
          Center(
            child: Image.asset("assets/google.png", height: 20, width: 20),
          ),
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Welcome to Google Auth',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: handleSignIn,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset("assets/google.png"),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: const Text("Google Sign In"),
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
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to the SettingsPage
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GoogleUserCircleAvatar(identity: user),
          const SizedBox(height: 20),
          Center(
            child: Text(
              user.displayName ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
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

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Theme Settings'),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: Provider.of<ThemeProvider>(context).isDarkMode,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .setTheme(value);
              },
            ),
            const SizedBox(height: 20),
            const Text('Font Size'),
            Slider(
              value: Provider.of<ThemeProvider>(context).fontSize,
              min: 10.0,
              max: 30.0,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .setFontSize(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ThemeProvider with ChangeNotifier {
  late ThemeData _themeData;
  double _fontSize = 16.0;
  final String _themeKey = 'theme';
  final String _fontSizeKey = 'font_size';

  ThemeProvider() {
    _loadTheme();
  }

  ThemeData get themeData => _themeData;
  double get fontSize => _fontSize;
  bool get isDarkMode => _themeData.brightness == Brightness.dark;

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool(_themeKey) ?? false;
    setTheme(isDarkMode);
    final fontSize = prefs.getDouble(_fontSizeKey) ?? 16.0;
    setFontSize(fontSize);
  }

  void setTheme(bool isDarkMode) {
    _themeData = isDarkMode ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }

  void setFontSize(double fontSize) {
    _fontSize = fontSize;
    notifyListeners();
    saveFontSize();
  }

  void setDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_themeKey, true);
    setTheme(true);
  }

  void setLightMode() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_themeKey, false);
    setTheme(false);
  }

  void saveFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble(_fontSizeKey, _fontSize);
  }
}
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'components/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}
