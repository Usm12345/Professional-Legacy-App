import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:prof_legacy_app/MyCourses.dart';
import 'package:prof_legacy_app/myprofile.dart';

import 'package:prof_legacy_app/trainingcourses.dart';
import 'dart:convert';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      home: SplashScreen(), // Set SplashScreen as the home screen
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Delay navigation to the main screen by 5 seconds
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the main screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });

    return Scaffold(
      body: Container(
        color: Color(0xFF0395FF), // Set the background color
        child: Center(
          child: SizedBox(
            width: 900,
            height: 900,
            child: Image.asset('assets/Splash Screen.png'),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Professional\'s Legacy',
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    width: 39,
                    height: 33,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Logo.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Add some space between the Container and Text
                  Text(
                    'PROFESSIONAL’S LEGACY',
                    style: TextStyle(

                      color: Color(0xFF000636),
                      fontSize: 15,
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 0.0),
                child:Center(
                  child: Container(
                    width: 335,
                    height: 354,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Mainpage.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),


              Center(
                child: Text(
                  'Hello !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF000636),
                    fontSize: 30,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),

              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child : Center(
                  child: Text(
                    'Unlock Your Potential: Skills for Jobs \n& \nFinancial Triumph.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF010333),
                      fontSize: 13,
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Container(
                    width: 196,
                    height: 39,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the login page when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(Color(0xFF000636)),
                        // Set text color to white
                        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                        // Adjust other button properties here if needed
                      ),
                      child: Text('Login'),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child : Center(
                  child: Text(
                    'Don\'t have an account?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF010333),
                      fontSize: 12,
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Center(
                  child: Container(
                    width: 196,
                    height: 39,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the login page when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
                        // Set text color to dark blue
                        foregroundColor: WidgetStateProperty.all<Color>(Color(0xFF000636)),
                        // Set button border stroke

                      ),
                      child: Text('Sign up'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['email'], // Adjust scopes as needed
    clientId: '812885855279-apmgddbnh7jvlkqoatqqvpllmpjjab48.apps.googleusercontent.com', // Replace with your actual client ID
  );
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        // If user signs in with Google, register them in your database
        final String username = googleSignInAccount.displayName ?? '';
        final String email = googleSignInAccount.email;
        final String password = passwordController.text;
        // Send request to backend to insert user into database
        final Uri uri = Uri.parse('https://professionallegacy.org/register_mobile.php'); // Replace with your PHP script URL

        try {
          final response = await http.post(
            uri,
            body: {
              'username': username,
              'email': email, 
              // You might want to generate a random password or leave it empty depending on your database requirements
              'password': password,
            },
          );

          if (response.statusCode == 200) {
            // Registration successful
            final responseBody = json.decode(response.body);
            bool is_permitted = responseBody['is_permitted'] ?? false;
            bool is_permitted2 = responseBody['is_permitted2'] ?? false;
            bool is_permitted3 = responseBody['is_permitted3'] ?? false;
            bool is_permitted4 = responseBody['is_permitted4'] ?? false;
            bool is_permitted5 = responseBody['is_permitted5'] ?? false;
            bool is_permitted6 = responseBody['is_permitted6'] ?? false;
            bool is_permitted7 = responseBody['is_permitted7'] ?? false;
            bool is_permitted8 = responseBody['is_permitted8'] ?? false;

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MainPage(
                  username: username,
                  password: password,
                  is_permitted: is_permitted,
                  is_permitted2: is_permitted2,
                  is_permitted3: is_permitted3,
                  is_permitted4: is_permitted4,
                  is_permitted5: is_permitted5,
                  is_permitted6: is_permitted6,
                  is_permitted7: is_permitted7,
                  is_permitted8: is_permitted8,
                ),
              ),
            );
          } else {
            // Registration failed
            // Show registration failed dialog
          }
        } catch (error) {
          // Handle any exceptions that occur during registration
          print('Error during registration: $error');
          // You can show an error dialog here if needed
        }
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Sign-in Failed'),
              content: Text('Failed to sign in with Google. Please try again later.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      // Handle sign-in errors
      print('Error signing in with Google: $error');
    }
  }

  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    final String username = usernameController.text;
    final String password = passwordController.text;

    final String loginUrl = 'https://professionallegacy.org/login_mobile.php';

    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        body: {
          'fullname': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        if (data['status'] == 'success') {
          // Fetch permissions from the nested 'permissions' map
          Map<String, dynamic> permissions = data['permissions'];

          bool is_permitted = permissions['is_permitted'] == 1;
          bool is_permitted2 = permissions['is_permitted2'] == 1;
          bool is_permitted3 = permissions['is_permitted3'] == 1;
          bool is_permitted4 = permissions['is_permitted4'] == 1;
          bool is_permitted5 = permissions['is_permitted5'] == 1;
          bool is_permitted6 = permissions['is_permitted6'] == 1;
          bool is_permitted7 = permissions['is_permitted7'] == 1;
          bool is_permitted8 = permissions['is_permitted8'] == 1;

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainPage(
                username: username,
                password:password,
                is_permitted: is_permitted,
                is_permitted2: is_permitted2,
                is_permitted3: is_permitted3,
                is_permitted4: is_permitted4,
                is_permitted5: is_permitted5,
                is_permitted6: is_permitted6,
                is_permitted7: is_permitted7,
                is_permitted8: is_permitted8,
              ),
            ),
          );
        } else {
          _showErrorDialog(context, 'Login failed: ${data['message']}');
        }
      } else {
        _showErrorDialog(context, 'Server error: ${response.statusCode}');
      }
    } catch (error) {
      _showErrorDialog(context, 'Error during login: $error');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            'Welcome!',
            style: TextStyle(
              color: Color(0xFF000636),
              fontSize: 43,
              fontFamily: 'Inter, sans-serif',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Text(
                'Sign in to Continue',
                style: TextStyle(
                  color: Color(0xFF000636),
                  fontSize: 15,
                  fontFamily: 'Inter, sans-serif',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Center(
                child: Container(
                  width: 196,
                  height: 39,
                  child: ElevatedButton(
                    onPressed: () async {
                      await signInWithEmailAndPassword(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(Color(0xFF000636)),
                      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                    ),
                    child: Text('Login'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 190.0),
              child: Text('OR', style: TextStyle(fontSize: 16)),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      await signInWithGoogle(context);
                    },
                    icon: Icon(Icons.videogame_asset_sharp),
                    label: Text('Sign in with Google', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                },
                child: Text(
                  'Create Account',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignupPage extends StatelessWidget {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['email'], // Adjust scopes as needed
    clientId: '812885855279-apmgddbnh7jvlkqoatqqvpllmpjjab48.apps.googleusercontent.com', // Replace with your actual client ID
  );
  Future<void> registerUser(BuildContext context) async {
    final String username = fullnameController.text;
    final String password = passwordController.text;
    final String confirmPassword = confirmPasswordController.text;

    // Validate password and confirm password
    if (password != confirmPassword) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Passwords do not match.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    // Send request to backend to insert user into database
    final Uri uri = Uri.parse('https://professionallegacy.org/register_mobile.php');
    bool is_permitted = false;
    bool is_permitted2  = false;
    bool is_permitted3  = false;
    bool is_permitted4  = false;
    bool is_permitted5  = false;
    bool is_permitted6  = false;
    bool is_permitted7  = false;
    bool is_permitted8  = false; // Default value

    try {
      final response = await http.post(
        uri,
        body: {
          'fullname': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // After successful registration
        final responseBody = json.decode(response.body);
        is_permitted2 = responseBody['is_permitted2'] ?? false;
        is_permitted3 = responseBody['is_permitted3'] ?? false;
        is_permitted4 = responseBody['is_permitted4'] ?? false;
        is_permitted5 = responseBody['is_permitted5'] ?? false;
        is_permitted6 = responseBody['is_permitted6'] ?? false;
        is_permitted7 = responseBody['is_permitted7'] ?? false;
        is_permitted8 = responseBody['is_permitted8'] ?? false;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Registration Successful'),
              content: Text('You have successfully registered.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage(username:username ,password:password, is_permitted: is_permitted, is_permitted2: is_permitted2,is_permitted3: is_permitted3,is_permitted4: is_permitted4,is_permitted5: is_permitted5,is_permitted6: is_permitted6,is_permitted7: is_permitted7,is_permitted8: is_permitted8)),
                    );
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // Registration failed
        //  Registration failed
        // Show registration failed dialog
      }
    } catch (error) {
      // Handle any exceptions that occur during registration
      print('Error during registration: $error');
      // You can show an error dialog here if needed
    }
  }
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        // If user signs in with Google, register them in your database
        final String username = googleSignInAccount.displayName ?? '';
        final String email = googleSignInAccount.email;
        final String password = passwordController.text;
        // Send request to backend to insert user into database
        final Uri uri = Uri.parse('https://professionallegacy.org/register_mobile.php'); // Replace with your PHP script URL
        bool is_permitted = false;
        bool is_permitted2  = false;
        bool is_permitted3  = false;
        bool is_permitted4  = false;
        bool is_permitted5  = false;
        bool is_permitted6  = false;
        bool is_permitted7  = false;
        bool is_permitted8  = false;

        try {
          final response = await http.post(
            uri,
            body: {
              'username': username,
              'email': email,
              // You might want to generate a random password or leave it empty depending on your database requirements
              'password': password,
            },
          );

          if (response.statusCode == 200) {
            // Registration successful
            final responseBody = json.decode(response.body);
            is_permitted = responseBody['is_permitted'] ?? false;
            is_permitted2 = responseBody['is_permitted2'] ?? false;
            is_permitted3 = responseBody['is_permitted3'] ?? false;
            is_permitted4 = responseBody['is_permitted4'] ?? false;
            is_permitted5 = responseBody['is_permitted5'] ?? false;
            is_permitted6 = responseBody['is_permitted6'] ?? false;
            is_permitted7 = responseBody['is_permitted7'] ?? false;
            is_permitted8 = responseBody['is_permitted8'] ?? false;
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Registration Successful'),
                  content: Text('You have successfully registered.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the dialog
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage(username:username , password:password ,is_permitted: is_permitted, is_permitted2: is_permitted2,is_permitted3: is_permitted3,is_permitted4: is_permitted4,is_permitted5: is_permitted5,is_permitted6: is_permitted6,is_permitted7: is_permitted7,is_permitted8: is_permitted8)),
                        );
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          } else {
            // Registration failed
            // Show registration failed dialog
          }
        } catch (error) {
          // Handle any exceptions that occur during registration
          print('Error during registration: $error');
          // You can show an error dialog here if needed
        }
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Sign-in Failed'),
              content: Text('Failed to sign in with Google. Please try again later.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      // Handle sign-in errors
      print('Error signing in with Google: $error');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text(
            'Hi !',
            style: TextStyle(
              color: Color(0xFF000636),
              fontSize: 43,
              fontFamily: 'Inter, sans-serif',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20), // Add spacing between text and input fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Text(
                'Create a New Account',
                style: TextStyle(
                  color: Color(0xFF000636),
                  fontSize: 15,
                  fontFamily: 'Inter, sans-serif',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 80), // Add vertical spacing after text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
              child: TextField(
                controller: fullnameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0), // Adjust width
                ),
              ),
            ),
            SizedBox(height: 10), // Add spacing between input fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0), // Adjust width
                ),
              ),
            ),
            SizedBox(height: 10), // Add spacing between input fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0), // Adjust width
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Center(
                child: Container(
                  width: 196,
                  height: 39,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Call registerUser function
                      await registerUser(context);
                      // No need to navigate here since registerUser handles navigation upon successful registration
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(Color(0xFF000636)),
                      // Set text color to white
                      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                      // Adjust other button properties here if needed
                    ),
                    child: Text('Register'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Add spacing between buttons and text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 190.0),
              child: Text('OR', style: TextStyle(fontSize: 16)),
            ),
            SizedBox(height: 20), // Add spacing between text and buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      await signInWithGoogle(context);
                    },
                    icon: Icon(Icons.videogame_asset_sharp),
                    label: Text('Sign in with Google', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  final String username;
  final String password;
  final bool is_permitted;
  final bool is_permitted2;
  final bool is_permitted3;
  final bool is_permitted4;
  final bool is_permitted5;
  final bool is_permitted6;
  final bool is_permitted7;
  final bool is_permitted8;

  MainPage({
    required this.username,
    required this.password,
    required this.is_permitted,
    required this.is_permitted2,
    required this.is_permitted3,
    required this.is_permitted4,
    required this.is_permitted5,
    required this.is_permitted6,
    required this.is_permitted7,
    required this.is_permitted8,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {


    Color colorE9E3E3 = Color(0xFFE9E3E3);
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 1.0, // 100% of the screen width
          height: MediaQuery.of(context).size.height * 1.0, // 100% of the screen height
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: colorE9E3E3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(19),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: -5,
                child: Container(
                  width: 410,
                  height: 225,
                  decoration: ShapeDecoration(
                    color: Color(0xFF0516A2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 18,
                top: 24,
                child: SizedBox(
                  width: 245,
                  height: 35,
                  child: Text(
                    'Hi, ${widget.username} 👋',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),

              Positioned(
                left: 18,
                top: 65,
                child: SizedBox(
                  width: 157,
                  height: 17,
                  child: Text(
                    'Let’s start Learning !!!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 408,
                top: 180,
                child: Transform(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(2.41),
                  child: Container(
                    width: 56.64,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 408,
                top: 188,
                child: Transform(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(2.40),
                  child: Container(
                    width: 46.01,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 408,
                top: 197,
                child: Transform(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(2.40),
                  child: Container(
                    width: 32.56,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 3,
                top: 180,
                child: Transform(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(0.72),
                  child: Container(
                    width: 54.56,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 3,
                top: 188,
                child: Transform(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(0.72),
                  child: Container(
                    width: 43.93,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 3,
                top: 197,
                child: Transform(
                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(0.72),
                  child: Container(
                    width: 29.79,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Search Container
              Stack(
                children: [
                  // Your other widgets here
                  Positioned(
                    left: 86,
                    top: 119,
                    child: Container(
                      width: 214,
                      height: 29,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              _searchQuery = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Search Courses',
                            hintStyle: TextStyle(fontSize: 11),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (_searchQuery.isNotEmpty)
                    Positioned(
                      left: 86,
                      top: 160,
                      child: Container(
                        width: 214,
                        height: 70, // Adjust height as needed
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ListView(
                          children: [
                            ListTile(
                              dense: true, // This reduces the vertical padding
                              contentPadding: EdgeInsets.zero,
                              title: Container(
                                padding: EdgeInsets.only(top: 0),// Adjust top padding to center the text vertically
                                child: Text(
                                  'Course 1',
                                  style: TextStyle(fontSize: 12), // Adjust font size
                                ),
                              ),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Course1()));
                              },
                            ),
                            // Add more recommendations as needed
                          ],
                        ),
                      ),
                    ),



                ],
              ),
              Positioned(
                left: 17,
                top: 245,
                child: SizedBox(
                  width: 287,
                  height: 61,
                  child: Text(
                    'Explore Categories',
                    style: TextStyle(
                      color: Color(0xFF000636),
                      fontSize: 21,
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 300,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  TrainingCourses(username:widget.username , is_permitted: widget.is_permitted, is_permitted2: widget.is_permitted2,is_permitted3: widget.is_permitted3,is_permitted4: widget.is_permitted4,is_permitted5: widget.is_permitted5,is_permitted6: widget.is_permitted6,is_permitted7: widget.is_permitted7,is_permitted8: widget.is_permitted8)),
                    );
                  },
                  child: Container(
                    width: 153,
                    height: 143,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 153,
                            height: 143,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 9,
                          top: 117,
                          child: SizedBox(
                            width: 130,
                            height: 26,
                            child: Text(
                              'Training Courses',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF000636),
                                fontSize: 14,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 16,
                          top: 6,
                          child: Container(
                            width: 122,
                            height: 106,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/training.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),



              Positioned(
                top: 300,
                left: 220,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExploreColleges()),
                    );
                  },
                  child: Container(
                    width: 153,
                    height: 143,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 153,
                            height: 143,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 9,
                          top: 117,
                          child: SizedBox(
                            width: 130,
                            height: 26,
                            child: Text(
                              'Explore Colleges',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF000636),
                                fontSize: 14,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 16,
                          top: 6,
                          child: Container(
                            width: 122,
                            height: 106,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/collegespic.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 500,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Blogs()),
                    );
                  },
                  child: Container(
                    width: 153,
                    height: 143,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 153,
                            height: 143,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 9,
                          top: 117,
                          child: SizedBox(
                            width: 130,
                            height: 26,
                            child: Text(
                              'Blogs',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF000636),
                                fontSize: 14,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 16,
                          top: 6,
                          child: Container(
                            width: 122,
                            height: 106,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/Blogspic.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 500,
                left: 220,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WorkWithUs()),
                    );
                  },
                  child: Container(
                    width: 153,
                    height: 143,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 153,
                            height: 143,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 9,
                          top: 117,
                          child: SizedBox(
                            width: 130,
                            height: 26,
                            child: Text(
                              'Work With Us',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF000636),
                                fontSize: 14,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 16,
                          top: 6,
                          child: Container(
                            width: 122,
                            height: 106,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/workwithuspic.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),






              Positioned(
                left: 355,
                top: 17,
                child: IconButton(
                  icon: Icon(Icons.exit_to_app),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Logout()));
                  },
                ),
              ),
              Positioned(
                left: 0,
                bottom: 0, // Place the footer at the bottom of the screen
                child: Container(
                  width: MediaQuery.of(context).size.width, // Full width of the screen
                  height: 73,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 73,
                          decoration: BoxDecoration(color: Colors.white),
                        ),
                      ),

                      Positioned(
                        left: 46,
                        top: 7,
                        child: GestureDetector(

                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  MainPage(username:widget.username ,password:widget.password, is_permitted: widget.is_permitted, is_permitted2: widget.is_permitted2,is_permitted3: widget.is_permitted3,is_permitted4: widget.is_permitted4,is_permitted5: widget.is_permitted5,is_permitted6: widget.is_permitted6,is_permitted7: widget.is_permitted7,is_permitted8: widget.is_permitted8)),
                            );
                          },
                          child: Container(
                            width: 58,
                            height: 47,
                            child: Center(
                              child: Icon(
                                Icons.home, // Use the home icon provided by Flutter
                                color: Colors.blueAccent, // Set icon color to white
                                size: 52, // Optional: Adjust icon size as needed
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 55,
                        top: 53,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MainPage(username:widget.username , password:widget.password ,is_permitted: widget.is_permitted, is_permitted2: widget.is_permitted2,is_permitted3: widget.is_permitted3,is_permitted4: widget.is_permitted4,is_permitted5: widget.is_permitted5,is_permitted6: widget.is_permitted6,is_permitted7: widget.is_permitted7,is_permitted8: widget.is_permitted8)),
                            );
                          },
                          child: SizedBox(
                            width: 62,
                            height: 22,
                            child: Text(
                              'Home',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 13,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        left: 173,
                        top: 7,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyCourses(username:widget.username , password:widget.password,is_permitted: widget.is_permitted, is_permitted2: widget.is_permitted2,is_permitted3: widget.is_permitted3,is_permitted4: widget.is_permitted4,is_permitted5: widget.is_permitted5,is_permitted6: widget.is_permitted6,is_permitted7: widget.is_permitted7,is_permitted8: widget.is_permitted8)),
                            );
                          },
                          child: Container(
                            width: 58,
                            height: 47,
                            child: Center(
                              child: Icon(
                                Icons.book, // Use the home icon provided by Flutter
                                color: Colors.black, // Set icon color to white
                                size: 47, // Optional: Adjust icon size as needed
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 170,
                        top: 53,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyCourses(username:widget.username ,password:widget.password, is_permitted: widget.is_permitted, is_permitted2: widget.is_permitted2,is_permitted3: widget.is_permitted3,is_permitted4: widget.is_permitted4,is_permitted5: widget.is_permitted5,is_permitted6: widget.is_permitted6,is_permitted7: widget.is_permitted7,is_permitted8: widget.is_permitted8)),
                            );
                          },
                          child: SizedBox(
                            width: 162,
                            height: 22,
                            child: Text(
                              'My Course',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        left: 309,
                        top: 7,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  MyProfile(username:widget.username , password:widget.password, is_permitted: widget.is_permitted, is_permitted2: widget.is_permitted2,is_permitted3: widget.is_permitted3,is_permitted4: widget.is_permitted4,is_permitted5: widget.is_permitted5,is_permitted6: widget.is_permitted6,is_permitted7: widget.is_permitted7,is_permitted8: widget.is_permitted8)),
                            );
                          },
                          child: Container(
                            width: 58,
                            height: 47,
                            child: Center(
                              child: Icon(
                                Icons.person, // Use the person icon provided by Flutter
                                color: Colors.black, // Set icon color to black
                                size: 47, // Optional: Adjust icon size as needed
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 321,
                        top: 54,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyProfile(username:widget.username , password:widget.password,is_permitted: widget.is_permitted, is_permitted2: widget.is_permitted2,is_permitted3: widget.is_permitted3,is_permitted4: widget.is_permitted4,is_permitted5: widget.is_permitted5,is_permitted6: widget.is_permitted6,is_permitted7: widget.is_permitted7,is_permitted8: widget.is_permitted8)),
                            );
                          },
                          child: SizedBox(
                            width: 62,
                            height: 32,
                            child: Text(
                              'Profile',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ),


                      Positioned(
                        left: 119,
                        top: 73,
                        child: Container(
                          width: 135,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 5,
                                strokeAlign: BorderSide.strokeAlignCenter,
                              ),
                            ),
                          ),
                        ),
                      ),



                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


class Course1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Wrap the Container in SingleChildScrollView
          child: Container(
            width: MediaQuery.of(context).size.width * 1.0, // 80% of the screen width
            height: MediaQuery.of(context).size.height * 1.0,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19),
              ),
            ),
            child: Stack(
              children: [

                Positioned(
                  left: 0,
                  top: -5,
                  child: Container(
                    width: 360,
                    height: 209,
                    decoration: ShapeDecoration(
                      color: Color(0xFF0516A2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -15,
                  top: -18.49,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.1,
                    height: 230,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Course1pic.png"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Navigate back to the previous page (main page)
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  left: 160,
                  top: 52,
                  child: GestureDetector(
                    onTap: () => _playVideo(context),
                    child: Container(
                      width: 75,
                      height: 68,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Video (2).png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),


                Positioned(
                  left: -7,
                  top: 310,
                  child: Container(
                    width: 367,
                    height: 344,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 8,
                  top: 210.60,
                  child: Container(
                    width: 82,
                    height: 22.12,
                    decoration: ShapeDecoration(
                      color: Color(0x56FFD600),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 7,
                  top: 215.74,
                  child: SizedBox(
                    width: 82,
                    height: 12.38,
                    child: Text(
                      'Best Seller',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFFC600),
                        fontSize: 11,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 42,
                  top: 233,
                  child: SizedBox(
                    width: 289,
                    height: 52.39,
                    child: Text(
                      'Data Analysis with Advanced Excel ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF000636),
                        fontSize: 17,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 142,
                  top: 304.09,
                  child: SizedBox(
                    width: 72,
                    height: 22.12,
                    child: Text(
                      'About',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1D33DD),
                        fontSize: 12,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),



                Positioned(
                  left: 62,
                  top: 266,
                  child: Container(
                    width: 27,
                    height: 16,
                    child: Icon(
                      Icons.person,
                      size: 16, // Adjust size as needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                ),

                Positioned(
                  left: 37,
                  top: 270,
                  child: SizedBox(
                    width: 151,
                    height: 9,
                    child: Text(
                      '200+ Students',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 146,
                  top: 266,
                  child: Container(
                    width: 27,
                    height: 16,
                    child: Icon(
                      Icons.video_call,
                      size: 16, // Adjust size as needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                ),
                Positioned(
                  left: 167,
                  top: 270,
                  child: SizedBox(
                    width: 51,
                    height: 9,
                    child: Text(
                      '32 Lessons',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 235,
                  top: 266,
                  child: Container(
                    width: 27,
                    height: 16,
                    child: Icon(
                      Icons.emoji_events,
                      size: 16, // Adjust size as needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                ),
                Positioned(
                  left: 255,
                  top: 270,
                  child: SizedBox(
                    width: 51,
                    height: 9,
                    child: Text(
                      '32 Medals',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 318,
                  child: Container(
                    width: 563,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 150,
                  top: 318,
                  child: Container(
                    width: 64,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 4,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF0066FF),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -6,
                  top: 331,
                  child: SizedBox(
                    width: 152,
                    height: 24,
                    child: Text(
                      'About Course',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 415,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 15,
                  top: 362,
                  child: SizedBox(
                    width: 353,
                    height: 66,
                    child: Text(
                      'This course enhances your financial modeling and valuation skills using practical examples from listed companies. Gain exposure to real-world applications and learn about regulatory compliance in financial modeling and valuation analysis.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 23,
                  top: 440,
                  child: SizedBox(
                    width: 286,
                    height: 418,
                    child: Text(
                      '• Introduction to Excel functions\n'
                          '• Advanced Functions (IF, SUMIF, VLOOKUP, HLOOKUP, INDEX-MATCH)\n'
                          '• Logical Functions (AND, OR, NOT) including Date Function\n'
                          '• Nested Functions and Formulas',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 485,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 2',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 510,
                  child: SizedBox(
                    width: 286,
                    height: 218,
                    child: Text(
                      '• Filtering, sorting and formatting data\n'
                          '• Conditional FormattingA\n'
                          '• Pivot Tables and Charts\n'
                          '• Advanced Excel Tables'
                      ,

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 555,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 3',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 580,
                  child: SizedBox(
                    width: 286,
                    height: 218,
                    child: Text(

                      '• Creating Dashboards in Excel\n'
                          '• Interactive Dashboards\n'
                          '• Pivot Table Dashboards\n'
                          '• One click Demonstration',

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 625,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 4',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 650,
                  child: SizedBox(
                    width: 286,
                    height: 218,
                    child: Text(

                      '• Introduction to Power Query\n'
                          '• Data Import and Transformation\n'
                          '• Merging Data from Multiple sources\n'
                          '• Creating Tables and charts from Queries',

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 70,
                  top: 700,
                  child: SizedBox(
                    width: 202,
                    height: 24,
                    child: Text(
                      'Registration Form',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 120,
                  top: 730,
                  child: SizedBox(
                    width: 106,
                    height: 20, // Adjust the height as needed
                    child: ElevatedButton(
                      onPressed: () async {
                        final Uri url = Uri.parse('https://forms.gle/e8CFWLrppCpNNrTQ6');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue, // Light blue color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32), // Border radius of 32
                        ),
                      ),
                      child: Text(
                        'ENROLL Now',
                        style: TextStyle(
                          color: Colors.white, // White color text
                          fontSize: 6, // Adjust font size as needed
                          fontFamily: 'Work Sans', // Change font family if needed
                          fontWeight: FontWeight.w600, // Adjust font weight as needed
                        ),
                      ),
                    ),
                  ),
                ),



              ],
            ),
          )
      ),
    );
  }
  void _playVideo(BuildContext context) {
    final VideoPlayerController videoPlayerController =
    VideoPlayerController.asset('assets/EXCEL.mp4');
    final ChewieController chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );

    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color:Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                  videoPlayerController.dispose();
                  chewieController.dispose();
                },
              ),
            ),
            backgroundColor: Colors.black,
            body: Center(
              child: Chewie(
                controller: chewieController,
              ),
            ),
          ),
        );
      },
    ).then((_) {
      videoPlayerController.dispose();
      chewieController.dispose();
    });
  }

}

class Course2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Wrap the Container in SingleChildScrollView
          child: Container(
            width: MediaQuery.of(context).size.width * 1.0, // 80% of the screen width
            height: MediaQuery.of(context).size.height * 1.0,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19),
              ),
            ),

            child: Stack(
              children: [

                Positioned(
                  left: 0,
                  top: -5,
                  child: Container(
                    width: 360,
                    height: 209,
                    decoration: ShapeDecoration(
                      color: Color(0xFF0516A2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -15,
                  top: -18.49,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.1,
                    height: 230,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Course2pic.png"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Navigate back to the previous page (main page)
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  left: 160,
                  top: 52,
                  child: GestureDetector(
                    onTap: () => _playVideo(context),
                    child: Container(
                      width: 75,
                      height: 68,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Video (2).png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),


                Positioned(
                  left: -7,
                  top: 310,
                  child: Container(
                    width: 367,
                    height: 344,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 8,
                  top: 210.60,
                  child: Container(
                    width: 82,
                    height: 22.12,
                    decoration: ShapeDecoration(
                      color: Color(0x56FFD600),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 7,
                  top: 215.74,
                  child: SizedBox(
                    width: 82,
                    height: 12.38,
                    child: Text(
                      'Best Seller',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFFC600),
                        fontSize: 11,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 2,
                  top: 235,
                  child: SizedBox(
                    width: 409,
                    height: 52.39,
                    child: Text(
                      ' Financial Modeling & Valuation Analysis ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF000636),
                        fontSize: 17,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 142,
                  top: 304.09,
                  child: SizedBox(
                    width: 72,
                    height: 22.12,
                    child: Text(
                      'About',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1D33DD),
                        fontSize: 12,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),



                Positioned(
                  left: 62,
                  top: 266,
                  child: Container(
                    width: 27,
                    height: 16,
                    child: Icon(
                      Icons.person,
                      size: 16, // Adjust size as needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                ),

                Positioned(
                  left: 37,
                  top: 270,
                  child: SizedBox(
                    width: 151,
                    height: 9,
                    child: Text(
                      '200+ Students',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 146,
                  top: 266,
                  child: Container(
                    width: 27,
                    height: 16,
                    child: Icon(
                      Icons.video_call,
                      size: 16, // Adjust size as needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                ),
                Positioned(
                  left: 167,
                  top: 270,
                  child: SizedBox(
                    width: 51,
                    height: 9,
                    child: Text(
                      '32 Lessons',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 235,
                  top: 266,
                  child: Container(
                    width: 27,
                    height: 16,
                    child: Icon(
                      Icons.emoji_events,
                      size: 16, // Adjust size as needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                ),
                Positioned(
                  left: 255,
                  top: 270,
                  child: SizedBox(
                    width: 51,
                    height: 9,
                    child: Text(
                      '32 Medals',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 318,
                  child: Container(
                    width: 563,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 150,
                  top: 318,
                  child: Container(
                    width: 64,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 4,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF0066FF),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -6,
                  top: 331,
                  child: SizedBox(
                    width: 152,
                    height: 24,
                    child: Text(
                      'About Course',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 415,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 15,
                  top: 362,
                  child: SizedBox(
                    width: 353,
                    height: 66,
                    child: Text(
                      'This course enhances your financial modeling and valuation skills using practical examples from listed companies. Gain exposure to real-world applications and learn about regulatory compliance in financial modeling and valuation analysis.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 23,
                  top: 440,
                  child: SizedBox(
                    width: 286,
                    height: 418,
                    child: Text(
                      '• Understanding the purpose and importance of FMVA\n'
                          '• Overview of different types of financial models and valuation methods\n'
                          '• Best practices for building accurate and reliable models\n'
                          '• Excel fundamentals for financial modeling and valuation analysis',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 485,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 2',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 510,
                  child: SizedBox(
                    width: 286,
                    height: 218,
                    child: Text(
                      '• Understanding financial statements (balance sheet, income statement)\n'
                          '• Ratio analysis and financial statement forecasting techniques\n'
                          '• Analysing financial performance and identifying key drivers of profitability\n'
                          '• Building financial models to project future financial performance'
                      ,

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 555,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 3',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 580,
                  child: SizedBox(
                    width: 286,
                    height: 218,
                    child: Text(

                      '• Understanding the concept of time , value of money and its relevance\n'
                          '• Building a DCF model to estimate the intrinsic value of a company \n'
                          '• Sensitivity analysis and scenario analysis in DCF valuation\n'
                          '• Common issues and challenges in DCF valuation',

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 625,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 4',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 650,
                  child: SizedBox(
                    width: 306,
                    height: 218,
                    child: Text(

                      '• Understanding the concept of relative valuation and its relevance in valuation\n'
                          '• Overview of different multiples and ratios used in relative valuation\n'
                          '• Building a relative valuation model to compare the valuation of a company \n'
                          '• Interpreting and analyzing the results of relative valuation analysis',

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 70,
                  top: 700,
                  child: SizedBox(
                    width: 202,
                    height: 24,
                    child: Text(
                      'Registration Form',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 120,
                  top: 730,
                  child: SizedBox(
                    width: 106,
                    height: 20, // Adjust the height as needed
                    child: ElevatedButton(
                      onPressed: () async {
                        final Uri url = Uri.parse('https://forms.gle/e8CFWLrppCpNNrTQ6');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue, // Light blue color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32), // Border radius of 32
                        ),
                      ),
                      child: Text(
                        'ENROLL Now',
                        style: TextStyle(
                          color: Colors.white, // White color text
                          fontSize: 6, // Adjust font size as needed
                          fontFamily: 'Work Sans', // Change font family if needed
                          fontWeight: FontWeight.w600, // Adjust font weight as needed
                        ),
                      ),
                    ),
                  ),
                ),



              ],
            ),
          )
      ),
    );
  }
  void _playVideo(BuildContext context) {
    final VideoPlayerController videoPlayerController =
    VideoPlayerController.asset('assets/fmva.mp4');
    final ChewieController chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );

    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color:Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                  videoPlayerController.dispose();
                  chewieController.dispose();
                },
              ),
            ),
            backgroundColor: Colors.black,
            body: Center(
              child: Chewie(
                controller: chewieController,
              ),
            ),
          ),
        );
      },
    ).then((_) {
      videoPlayerController.dispose();
      chewieController.dispose();
    });
  }

}

class Course3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Wrap the Container in SingleChildScrollView
          child: Container(
            width: MediaQuery.of(context).size.width * 1.0, // 80% of the screen width
            height: MediaQuery.of(context).size.height * 1.0,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19),
              ),
            ),
            child: Stack(
              children: [

                Positioned(
                  left: 0,
                  top: -5,
                  child: Container(
                    width: 360,
                    height: 209,
                    decoration: ShapeDecoration(
                      color: Color(0xFF0516A2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -15,
                  top: -18.49,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.1,
                    height: 230,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Course3pic.png"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Navigate back to the previous page (main page)
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  left: 160,
                  top: 52,
                  child: GestureDetector(
                    onTap: () => _playVideo(context),
                    child: Container(
                      width: 75,
                      height: 68,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Video (2).png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),


                Positioned(
                  left: -7,
                  top: 310,
                  child: Container(
                    width: 367,
                    height: 344,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 8,
                  top: 210.60,
                  child: Container(
                    width: 82,
                    height: 22.12,
                    decoration: ShapeDecoration(
                      color: Color(0x56FFD600),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 7,
                  top: 215.74,
                  child: SizedBox(
                    width: 82,
                    height: 12.38,
                    child: Text(
                      'Best Seller',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFFC600),
                        fontSize: 11,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 17,
                  top: 237,
                  child: SizedBox(
                    width: 380,
                    height: 52.39,
                    child: Text(
                      'PREPARATION OF FINANCIAL STATEMENTS ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF000636),
                        fontSize: 15,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 142,
                  top: 304.09,
                  child: SizedBox(
                    width: 72,
                    height: 22.12,
                    child: Text(
                      'About',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1D33DD),
                        fontSize: 12,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),



                Positioned(
                  left: 62,
                  top: 266,
                  child: Container(
                    width: 27,
                    height: 16,
                    child: Icon(
                      Icons.person,
                      size: 16, // Adjust size as needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                ),

                Positioned(
                  left: 37,
                  top: 270,
                  child: SizedBox(
                    width: 151,
                    height: 9,
                    child: Text(
                      '200+ Students',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 146,
                  top: 266,
                  child: Container(
                    width: 27,
                    height: 16,
                    child: Icon(
                      Icons.video_call,
                      size: 16, // Adjust size as needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                ),
                Positioned(
                  left: 167,
                  top: 270,
                  child: SizedBox(
                    width: 51,
                    height: 9,
                    child: Text(
                      '32 Lessons',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 235,
                  top: 266,
                  child: Container(
                    width: 27,
                    height: 16,
                    child: Icon(
                      Icons.emoji_events,
                      size: 16, // Adjust size as needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                ),
                Positioned(
                  left: 255,
                  top: 270,
                  child: SizedBox(
                    width: 51,
                    height: 9,
                    child: Text(
                      '32 Medals',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 318,
                  child: Container(
                    width: 563,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 150,
                  top: 318,
                  child: Container(
                    width: 64,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 4,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF0066FF),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -6,
                  top: 331,
                  child: SizedBox(
                    width: 152,
                    height: 24,
                    child: Text(
                      'About Course',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 415,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 15,
                  top: 362,
                  child: SizedBox(
                    width: 353,
                    height: 66,
                    child: Text(
                      'The course covers the entire process of preparing financial statements, from scratch entry to the final financial statements. Participants will learn how to prepare the financial statements in compliance with IFRS, IAS, and Companies Act 2017',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 23,
                  top: 440,
                  child: SizedBox(
                    width: 286,
                    height: 418,
                    child: Text(
                      '• Overview of financial statements\n'
                          '• Purpose of financial statements\n'
                          '• Basic accounting concepts\n'
                      ,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 485,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 2',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 510,
                  child: SizedBox(
                    width: 286,
                    height: 218,
                    child: Text(
                      '• Creating a Chart of Accounts\n'
                          '• Entering transactions into Excel\n'
                          '• Trial Balance\n'
                          '• Final Adjustments and Closing Entries etc'
                      ,

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 555,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 3',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 580,
                  child: SizedBox(
                    width: 286,
                    height: 218,
                    child: Text(

                      '• Overview of disclosure requirements\n'
                          '• Understanding IFRS, IAS, and Companies Act 2017\n'
                          '• Disclosure checklist for financial statements\n'
                          '• Ensuring compliance with disclosure requirements',

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 625,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 4',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 650,
                  child: SizedBox(
                    width: 316,
                    height: 218,
                    child: Text(

                      '• Understanding Financial Projections\n'
                          '• Forecasting Sales and Expenses\n'
                          '• Projecting Assets and Liabilities\n'
                          '•Creating a Projected Income Statement, Balance Sheet, and Cash Flow Statement',

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 70,
                  top: 700,
                  child: SizedBox(
                    width: 202,
                    height: 24,
                    child: Text(
                      'Registration Form',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 120,
                  top: 730,
                  child: SizedBox(
                    width: 106,
                    height: 20, // Adjust the height as needed
                    child: ElevatedButton(
                      onPressed: () async {
                        final Uri url = Uri.parse('https://forms.gle/e8CFWLrppCpNNrTQ6');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue, // Light blue color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32), // Border radius of 32
                        ),
                      ),
                      child: Text(
                        'ENROLL Now',
                        style: TextStyle(
                          color: Colors.white, // White color text
                          fontSize: 6, // Adjust font size as needed
                          fontFamily: 'Work Sans', // Change font family if needed
                          fontWeight: FontWeight.w600, // Adjust font weight as needed
                        ),
                      ),
                    ),
                  ),
                ),



              ],
            ),
          )
      ),
    );
  }
  void _playVideo(BuildContext context) {
    final VideoPlayerController videoPlayerController =
    VideoPlayerController.asset('assets/financial_statement.mp4');
    final ChewieController chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );

    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color:Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                  videoPlayerController.dispose();
                  chewieController.dispose();
                },
              ),
            ),
            backgroundColor: Colors.black,
            body: Center(
              child: Chewie(
                controller: chewieController,
              ),
            ),
          ),
        );
      },
    ).then((_) {
      videoPlayerController.dispose();
      chewieController.dispose();
    });
  }

}


class Course4 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Wrap the Container in SingleChildScrollView
          child: Container(
            width: MediaQuery.of(context).size.width * 1.0, // 80% of the screen width
            height: MediaQuery.of(context).size.height * 1.0,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19),
              ),
            ),
            child: Stack(
              children: [

                Positioned(
                  left: 0,
                  top: -5,
                  child: Container(
                    width: 360,
                    height: 209,
                    decoration: ShapeDecoration(
                      color: Color(0xFF0516A2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -15,
                  top: -18.49,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.1,
                    height: 230,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/course4pic.png"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 75,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Navigate back to the previous page (main page)
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  left: 160,
                  top: 52,
                  child: GestureDetector(
                    onTap: () => _playVideo(context),
                    child: Container(
                      width: 75,
                      height: 68,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Video (2).png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 160,
                  top: 52,
                  child: GestureDetector(
                    onTap: () => _playVideo(context),
                    child: Container(
                      width: 75,
                      height: 68,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Audit org.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),


                Positioned(
                  left: -7,
                  top: 310,
                  child: Container(
                    width: 367,
                    height: 344,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 8,
                  top: 210.60,
                  child: Container(
                    width: 82,
                    height: 22.12,
                    decoration: ShapeDecoration(
                      color: Color(0x56FFD600),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 7,
                  top: 215.74,
                  child: SizedBox(
                    width: 82,
                    height: 12.38,
                    child: Text(
                      'Best Seller',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFFC600),
                        fontSize: 11,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 42,
                  top: 233,
                  child: SizedBox(
                    width: 289,
                    height: 52.39,
                    child: Text(
                      'Audit of Financial Statements ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF000636),
                        fontSize: 17,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 142,
                  top: 304.09,
                  child: SizedBox(
                    width: 72,
                    height: 22.12,
                    child: Text(
                      'About',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1D33DD),
                        fontSize: 12,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),



                Positioned(
                  left: 62,
                  top: 266,
                  child: Container(
                    width: 27,
                    height: 16,
                    child: Icon(
                      Icons.person,
                      size: 16, // Adjust size as needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                ),

                Positioned(
                  left: 37,
                  top: 270,
                  child: SizedBox(
                    width: 151,
                    height: 9,
                    child: Text(
                      '200+ Students',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 146,
                  top: 266,
                  child: Container(
                    width: 27,
                    height: 16,
                    child: Icon(
                      Icons.video_call,
                      size: 16, // Adjust size as needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                ),
                Positioned(
                  left: 167,
                  top: 270,
                  child: SizedBox(
                    width: 51,
                    height: 9,
                    child: Text(
                      '32 Lessons',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 235,
                  top: 266,
                  child: Container(
                    width: 27,
                    height: 16,
                    child: Icon(
                      Icons.emoji_events,
                      size: 16, // Adjust size as needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                ),
                Positioned(
                  left: 255,
                  top: 270,
                  child: SizedBox(
                    width: 51,
                    height: 9,
                    child: Text(
                      '32 Medals',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 318,
                  child: Container(
                    width: 563,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 150,
                  top: 318,
                  child: Container(
                    width: 64,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 4,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF0066FF),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -6,
                  top: 331,
                  child: SizedBox(
                    width: 152,
                    height: 24,
                    child: Text(
                      'About Course',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 470,
                  child: SizedBox(
                    width: 152,
                    height: 24,
                    child: Text(
                      'Course Contents :',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 15,
                  top: 362,
                  child: SizedBox(
                    width: 353,
                    height:166,
                    child: Text(
                      'Audit Process:\n 1- Understand the Business Activity – (Process Flow)\n 2- Understand the control environment & Identify ROMMs \n 3- Perform control testing to check design & Operating Effectiveness of Controls\n4- Decide NTE of substantive Testing based on results of Control Testing \n5- Perform Substantive Testing \n 6- Conclusion & Reporting',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 15,
                  top: 500,
                  child: SizedBox(
                    width: 346,
                    height: 418,
                    child: Text(
                      '• Course Introduction & Materiality Test\n'
                          '• Audit Tools\n'
                          '• Area: Cash & Bank and Financial Investments- Walkthrough, Testing,\n'
                          '• Operating Expenses and Creditors\n'
                          '• Revenue: Confirmations + Debtors\n'
                          '• Fixed Assets, closing stock - Floor to Sheet, Sheet to Floor, \n'
                          '• Payroll testing, Actuarial testing\n'
                          '• Borrowings, Prepaid Exp. impairment Testing\n'
                          '• Provisions, Cap Commitments, Stat dues, Off Balance Sheet items,\n'
                          '• Checking for Divergences, Variance & Ratio Analysis- Part I\n'
                          '• Checking for Divergences, Variance & Ratio Analysis- Part II\n'
                          '• Reporting, CARO, Internal Financial Controls\n'
                          '• Special Session- Bank Audit\n'
                          '• Special Session- Practical Workings Conclusion, Course Highlights \n'
                          '• Nested Functions and Formulas',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),






                Positioned(
                  left: 70,
                  top: 700,
                  child: SizedBox(
                    width: 202,
                    height: 24,
                    child: Text(
                      'Registration Form',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 120,
                  top: 730,
                  child: SizedBox(
                    width: 106,
                    height: 20, // Adjust the height as needed
                    child: ElevatedButton(
                      onPressed: () async {
                        final Uri url = Uri.parse('https://forms.gle/e8CFWLrppCpNNrTQ6');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue, // Light blue color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32), // Border radius of 32
                        ),
                      ),
                      child: Text(
                        'ENROLL Now',
                        style: TextStyle(
                          color: Colors.white, // White color text
                          fontSize: 6, // Adjust font size as needed
                          fontFamily: 'Work Sans', // Change font family if needed
                          fontWeight: FontWeight.w600, // Adjust font weight as needed
                        ),
                      ),
                    ),
                  ),
                ),



              ],
            ),
          )
      ),
    );
  }
  void _playVideo(BuildContext context) {
    final VideoPlayerController videoPlayerController =
    VideoPlayerController.asset('assets/Audit.mp4');
    final ChewieController chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );

    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color:Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                  videoPlayerController.dispose();
                  chewieController.dispose();
                },
              ),
            ),
            backgroundColor: Colors.black,
            body: Center(
              child: Chewie(
                controller: chewieController,
              ),
            ),
          ),
        );
      },
    ).then((_) {
      videoPlayerController.dispose();
      chewieController.dispose();
    });
  }

}
class Course5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Wrap the Container in SingleChildScrollView
          child: Container(
            width: MediaQuery.of(context).size.width * 1.0, // 80% of the screen width
            height: MediaQuery.of(context).size.height * 1.0,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19),
              ),
            ),
            child: Stack(
              children: [

                Positioned(
                  left: 0,
                  top: -5,
                  child: Container(
                    width: 360,
                    height: 209,
                    decoration: ShapeDecoration(
                      color: Color(0xFF0516A2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -15,
                  top: -18.49,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.1,
                    height: 230,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Course5pic.png"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Navigate back to the previous page (main page)
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  left: 160,
                  top: 52,
                  child: GestureDetector(
                    onTap: () => _playVideo(context),
                    child: Container(
                      width: 75,
                      height: 68,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Video (2).png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),


                Positioned(
                  left: -7,
                  top: 310,
                  child: Container(
                    width: 367,
                    height: 344,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 8,
                  top: 210.60,
                  child: Container(
                    width: 82,
                    height: 22.12,
                    decoration: ShapeDecoration(
                      color: Color(0x56FFD600),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 7,
                  top: 215.74,
                  child: SizedBox(
                    width: 82,
                    height: 12.38,
                    child: Text(
                      'Best Seller',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFFC600),
                        fontSize: 11,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 17,
                  top: 237,
                  child: SizedBox(
                    width: 380,
                    height: 52.39,
                    child: Text(
                      'BIG DATA WITH POWER BI ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF000636),
                        fontSize: 15,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 142,
                  top: 304.09,
                  child: SizedBox(
                    width: 72,
                    height: 22.12,
                    child: Text(
                      'About',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1D33DD),
                        fontSize: 12,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),



                Positioned(
                  left: 62,
                  top: 266,
                  child: Container(
                    width: 27,
                    height: 16,
                    child: Icon(
                      Icons.person,
                      size: 16, // Adjust size as needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                ),

                Positioned(
                  left: 37,
                  top: 270,
                  child: SizedBox(
                    width: 151,
                    height: 9,
                    child: Text(
                      '200+ Students',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 146,
                  top: 266,
                  child: Container(
                    width: 27,
                    height: 16,
                    child: Icon(
                      Icons.video_call,
                      size: 16, // Adjust size as needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                ),
                Positioned(
                  left: 167,
                  top: 270,
                  child: SizedBox(
                    width: 51,
                    height: 9,
                    child: Text(
                      '32 Lessons',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 235,
                  top: 266,
                  child: Container(
                    width: 27,
                    height: 16,
                    child: Icon(
                      Icons.emoji_events,
                      size: 16, // Adjust size as needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                ),
                Positioned(
                  left: 255,
                  top: 270,
                  child: SizedBox(
                    width: 51,
                    height: 9,
                    child: Text(
                      '32 Medals',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 318,
                  child: Container(
                    width: 563,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 150,
                  top: 318,
                  child: Container(
                    width: 64,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 4,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF0066FF),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -6,
                  top: 331,
                  child: SizedBox(
                    width: 152,
                    height: 24,
                    child: Text(
                      'About Course',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 415,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 15,
                  top: 362,
                  child: SizedBox(
                    width: 353,
                    height: 66,
                    child: Text(
                      'course outline focused exclusively on Power BI for finance, accounting,taxation, and auditing graduates, excluding financial statement terminology:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 23,
                  top: 440,
                  child: SizedBox(
                    width: 286,
                    height: 418,
                    child: Text(
                      '• Overview of Power BI and its significance in financial analysis \n'
                          '• Installing and configuring Power BI Desktop\n'
                          '• Navigating the Power BI interface \n'
                          '• Data import and transformation using Power Query \n'
                      ,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 485,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 2',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 510,
                  child: SizedBox(
                    width: 286,
                    height: 218,
                    child: Text(
                      '• Importing data from diverse sources\n'
                          '• Establishing data relationships \n'
                          '• Constructing a star schema for financial data\n'
                          '• Data modeling best practices'
                      ,

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 555,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 3',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 580,
                  child: SizedBox(
                    width: 286,
                    height: 218,
                    child: Text(

                      '• Principles of effective data visualization\n'
                          '• Creating fundamental charts (e.g., bar, line, pie) for financial data\n'
                          '• Tailoring visuals for financial reporting\n'
                          '• Leveraging color and formatting effectively',

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 625,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 4',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 650,
                  child: SizedBox(
                    width: 316,
                    height: 218,
                    child: Text(

                      '• Proficient data transformations with Power Query\n'
                          '• Combining and merging queries\n'
                          '• Crafting custom functions\n'
                          '•Utilizing date and time functions proficiently',

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 70,
                  top: 700,
                  child: SizedBox(
                    width: 202,
                    height: 24,
                    child: Text(
                      'Registration Form',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 120,
                  top: 730,
                  child: SizedBox(
                    width: 106,
                    height: 20, // Adjust the height as needed
                    child: ElevatedButton(
                      onPressed: () async {
                        final Uri url = Uri.parse('https://forms.gle/e8CFWLrppCpNNrTQ6');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue, // Light blue color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32), // Border radius of 32
                        ),
                      ),
                      child: Text(
                        'ENROLL Now',
                        style: TextStyle(
                          color: Colors.white, // White color text
                          fontSize: 6, // Adjust font size as needed
                          fontFamily: 'Work Sans', // Change font family if needed
                          fontWeight: FontWeight.w600, // Adjust font weight as needed
                        ),
                      ),
                    ),
                  ),
                ),



              ],
            ),
          )
      ),
    );
  }
  void _playVideo(BuildContext context) {
    final VideoPlayerController videoPlayerController =
    VideoPlayerController.asset('assets/financial_statement.mp4');
    final ChewieController chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );

    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color:Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                  videoPlayerController.dispose();
                  chewieController.dispose();
                },
              ),
            ),
            backgroundColor: Colors.black,
            body: Center(
              child: Chewie(
                controller: chewieController,
              ),
            ),
          ),
        );
      },
    ).then((_) {
      videoPlayerController.dispose();
      chewieController.dispose();
    });
  }

}
class Course6 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Wrap the Container in SingleChildScrollView
          child: Container(
            width: MediaQuery.of(context).size.width * 1.0, // 80% of the screen width
            height: MediaQuery.of(context).size.height * 1.0,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19),
              ),
            ),
            child: Stack(
              children: [

                Positioned(
                  left: 0,
                  top: -5,
                  child: Container(
                    width: 360,
                    height: 209,
                    decoration: ShapeDecoration(
                      color: Color(0xFF0516A2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -15,
                  top: -18.49,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.1,
                    height: 230,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Course6pic.png"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 75,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Navigate back to the previous page (main page)
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  left: 160,
                  top: 52,
                  child: GestureDetector(
                    onTap: () => _playVideo(context),
                    child: Container(
                      width: 75,
                      height: 68,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Video (2).png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 160,
                  top: 52,
                  child: GestureDetector(
                    onTap: () => _playVideo(context),
                    child: Container(
                      width: 75,
                      height: 68,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Course6pic.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),


                Positioned(
                  left: -7,
                  top: 310,
                  child: Container(
                    width: 367,
                    height: 344,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 8,
                  top: 210.60,
                  child: Container(
                    width: 82,
                    height: 22.12,
                    decoration: ShapeDecoration(
                      color: Color(0x56FFD600),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 7,
                  top: 215.74,
                  child: SizedBox(
                    width: 82,
                    height: 12.38,
                    child: Text(
                      'Best Seller',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFFC600),
                        fontSize: 11,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 42,
                  top: 233,
                  child: SizedBox(
                    width: 289,
                    height: 52.39,
                    child: Text(
                      'Freelancing (Fiverr + Upwork)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF000636),
                        fontSize: 17,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 142,
                  top: 304.09,
                  child: SizedBox(
                    width: 72,
                    height: 22.12,
                    child: Text(
                      'About',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1D33DD),
                        fontSize: 12,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),



                Positioned(
                  left: 62,
                  top: 266,
                  child: Container(
                    width: 27,
                    height: 16,
                    child: Icon(
                      Icons.person,
                      size: 16, // Adjust size as needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                ),

                Positioned(
                  left: 37,
                  top: 270,
                  child: SizedBox(
                    width: 151,
                    height: 9,
                    child: Text(
                      '200+ Students',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 146,
                  top: 266,
                  child: Container(
                    width: 27,
                    height: 16,
                    child: Icon(
                      Icons.video_call,
                      size: 16, // Adjust size as needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                ),
                Positioned(
                  left: 167,
                  top: 270,
                  child: SizedBox(
                    width: 51,
                    height: 9,
                    child: Text(
                      '32 Lessons',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 235,
                  top: 266,
                  child: Container(
                    width: 27,
                    height: 16,
                    child: Icon(
                      Icons.emoji_events,
                      size: 16, // Adjust size as needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                ),
                Positioned(
                  left: 255,
                  top: 270,
                  child: SizedBox(
                    width: 51,
                    height: 9,
                    child: Text(
                      '32 Medals',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 318,
                  child: Container(
                    width: 563,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 150,
                  top: 318,
                  child: Container(
                    width: 64,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 4,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF0066FF),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -6,
                  top: 331,
                  child: SizedBox(
                    width: 152,
                    height: 24,
                    child: Text(
                      'About Course',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 415,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 15,
                  top: 362,
                  child: SizedBox(
                    width: 353,
                    height: 66,
                    child: Text(
                      'course outline focused exclusively on Power BI for finance, accounting,taxation, and auditing graduates, excluding financial statement terminology:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 23,
                  top: 440,
                  child: SizedBox(
                    width: 286,
                    height: 418,
                    child: Text(
                      '• Overview of Power BI and its significance in financial analysis \n'
                          '• Installing and configuring Power BI Desktop\n'
                          '• Navigating the Power BI interface \n'
                          '• Data import and transformation using Power Query \n'
                      ,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 485,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 2',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 510,
                  child: SizedBox(
                    width: 286,
                    height: 218,
                    child: Text(
                      '• Importing data from diverse sources\n'
                          '• Establishing data relationships \n'
                          '• Constructing a star schema for financial data\n'
                          '• Data modeling best practices'
                      ,

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 555,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 3',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 580,
                  child: SizedBox(
                    width: 286,
                    height: 218,
                    child: Text(

                      '• Principles of effective data visualization\n'
                          '• Creating fundamental charts (e.g., bar, line, pie) for financial data\n'
                          '• Tailoring visuals for financial reporting\n'
                          '• Leveraging color and formatting effectively',

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 625,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 4',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 650,
                  child: SizedBox(
                    width: 316,
                    height: 218,
                    child: Text(

                      '• Proficient data transformations with Power Query\n'
                          '• Combining and merging queries\n'
                          '• Crafting custom functions\n'
                          '•Utilizing date and time functions proficiently',

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 70,
                  top: 700,
                  child: SizedBox(
                    width: 202,
                    height: 24,
                    child: Text(
                      'Registration Form',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 120,
                  top: 730,
                  child: SizedBox(
                    width: 106,
                    height: 20, // Adjust the height as needed
                    child: ElevatedButton(
                      onPressed: () async {
                        final Uri url = Uri.parse('https://forms.gle/e8CFWLrppCpNNrTQ6');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue, // Light blue color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32), // Border radius of 32
                        ),
                      ),
                      child: Text(
                        'ENROLL Now',
                        style: TextStyle(
                          color: Colors.white, // White color text
                          fontSize: 6, // Adjust font size as needed
                          fontFamily: 'Work Sans', // Change font family if needed
                          fontWeight: FontWeight.w600, // Adjust font weight as needed
                        ),
                      ),
                    ),
                  ),
                ),



              ],
            ),
          )
      ),
    );
  }
  void _playVideo(BuildContext context) {
    final VideoPlayerController videoPlayerController =
    VideoPlayerController.asset('assets/Audit.mp4');
    final ChewieController chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );

    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color:Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                  videoPlayerController.dispose();
                  chewieController.dispose();
                },
              ),
            ),
            backgroundColor: Colors.black,
            body: Center(
              child: Chewie(
                controller: chewieController,
              ),
            ),
          ),
        );
      },
    ).then((_) {
      videoPlayerController.dispose();
      chewieController.dispose();
    });
  }

}
class Course7 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Wrap the Container in SingleChildScrollView
          child: Container(
            width: MediaQuery.of(context).size.width * 1.0, // 80% of the screen width
            height: MediaQuery.of(context).size.height * 1.0,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19),
              ),
            ),
            child: Stack(
              children: [

                Positioned(
                  left: 0,
                  top: -5,
                  child: Container(
                    width: 360,
                    height: 209,
                    decoration: ShapeDecoration(
                      color: Color(0xFF0516A2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -15,
                  top: -18.49,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.1,
                    height: 230,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/Course7pic.png"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 75,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Navigate back to the previous page (main page)
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  left: 160,
                  top: 52,
                  child: GestureDetector(
                    onTap: () => _playVideo(context),
                    child: Container(
                      width: 75,
                      height: 68,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Video (2).png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 160,
                  top: 52,
                  child: GestureDetector(
                    onTap: () => _playVideo(context),
                    child: Container(
                      width: 75,
                      height: 68,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Audit org.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),


                Positioned(
                  left: -7,
                  top: 310,
                  child: Container(
                    width: 367,
                    height: 344,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 8,
                  top: 210.60,
                  child: Container(
                    width: 82,
                    height: 22.12,
                    decoration: ShapeDecoration(
                      color: Color(0x56FFD600),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 7,
                  top: 215.74,
                  child: SizedBox(
                    width: 82,
                    height: 12.38,
                    child: Text(
                      'Best Seller',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFFC600),
                        fontSize: 11,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 42,
                  top: 233,
                  child: SizedBox(
                    width: 289,
                    height: 52.39,
                    child: Text(
                      'Taxation (GULF States)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF000636),
                        fontSize: 17,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 142,
                  top: 304.09,
                  child: SizedBox(
                    width: 72,
                    height: 22.12,
                    child: Text(
                      'About',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1D33DD),
                        fontSize: 12,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),



                Positioned(
                  left: 62,
                  top: 266,
                  child: Container(
                    width: 27,
                    height: 16,
                    child: Icon(
                      Icons.person,
                      size: 16, // Adjust size as needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                ),

                Positioned(
                  left: 37,
                  top: 270,
                  child: SizedBox(
                    width: 151,
                    height: 9,
                    child: Text(
                      '200+ Students',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 146,
                  top: 266,
                  child: Container(
                    width: 27,
                    height: 16,
                    child: Icon(
                      Icons.video_call,
                      size: 16, // Adjust size as needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                ),
                Positioned(
                  left: 167,
                  top: 270,
                  child: SizedBox(
                    width: 51,
                    height: 9,
                    child: Text(
                      '32 Lessons',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 235,
                  top: 266,
                  child: Container(
                    width: 27,
                    height: 16,
                    child: Icon(
                      Icons.emoji_events,
                      size: 16, // Adjust size as needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                ),
                Positioned(
                  left: 255,
                  top: 270,
                  child: SizedBox(
                    width: 51,
                    height: 9,
                    child: Text(
                      '32 Medals',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 318,
                  child: Container(
                    width: 563,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 150,
                  top: 318,
                  child: Container(
                    width: 64,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 4,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF0066FF),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -6,
                  top: 331,
                  child: SizedBox(
                    width: 152,
                    height: 24,
                    child: Text(
                      'About Course',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 415,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 15,
                  top: 362,
                  child: SizedBox(
                    width: 353,
                    height: 66,
                    child: Text(
                      'course outline focused exclusively on Power BI for finance, accounting,taxation, and auditing graduates, excluding financial statement terminology:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 23,
                  top: 440,
                  child: SizedBox(
                    width: 286,
                    height: 418,
                    child: Text(
                      '• Overview of Power BI and its significance in financial analysis \n'
                          '• Installing and configuring Power BI Desktop\n'
                          '• Navigating the Power BI interface \n'
                          '• Data import and transformation using Power Query \n'
                      ,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 485,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 2',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 510,
                  child: SizedBox(
                    width: 286,
                    height: 218,
                    child: Text(
                      '• Importing data from diverse sources\n'
                          '• Establishing data relationships \n'
                          '• Constructing a star schema for financial data\n'
                          '• Data modeling best practices'
                      ,

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 555,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 3',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 580,
                  child: SizedBox(
                    width: 286,
                    height: 218,
                    child: Text(

                      '• Principles of effective data visualization\n'
                          '• Creating fundamental charts (e.g., bar, line, pie) for financial data\n'
                          '• Tailoring visuals for financial reporting\n'
                          '• Leveraging color and formatting effectively',

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 625,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 4',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 650,
                  child: SizedBox(
                    width: 316,
                    height: 218,
                    child: Text(

                      '• Proficient data transformations with Power Query\n'
                          '• Combining and merging queries\n'
                          '• Crafting custom functions\n'
                          '•Utilizing date and time functions proficiently',

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),






                Positioned(
                  left: 70,
                  top: 700,
                  child: SizedBox(
                    width: 202,
                    height: 24,
                    child: Text(
                      'Registration Form',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 120,
                  top: 730,
                  child: SizedBox(
                    width: 106,
                    height: 20, // Adjust the height as needed
                    child: ElevatedButton(
                      onPressed: () async {
                        final Uri url = Uri.parse('https://forms.gle/e8CFWLrppCpNNrTQ6');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue, // Light blue color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32), // Border radius of 32
                        ),
                      ),
                      child: Text(
                        'ENROLL Now',
                        style: TextStyle(
                          color: Colors.white, // White color text
                          fontSize: 6, // Adjust font size as needed
                          fontFamily: 'Work Sans', // Change font family if needed
                          fontWeight: FontWeight.w600, // Adjust font weight as needed
                        ),
                      ),
                    ),
                  ),
                ),



              ],
            ),
          )
      ),
    );
  }
  void _playVideo(BuildContext context) {
    final VideoPlayerController videoPlayerController =
    VideoPlayerController.asset('assets/Audit.mp4');
    final ChewieController chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );

    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color:Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                  videoPlayerController.dispose();
                  chewieController.dispose();
                },
              ),
            ),
            backgroundColor: Colors.black,
            body: Center(
              child: Chewie(
                controller: chewieController,
              ),
            ),
          ),
        );
      },
    ).then((_) {
      videoPlayerController.dispose();
      chewieController.dispose();
    });
  }

}
class Course8 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Wrap the Container in SingleChildScrollView
          child: Container(
            width: MediaQuery.of(context).size.width * 1.0, // 80% of the screen width
            height: MediaQuery.of(context).size.height * 1.0,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19),
              ),
            ),
            child: Stack(
              children: [

                Positioned(
                  left: 0,
                  top: -5,
                  child: Container(
                    width: 360,
                    height: 209,
                    decoration: ShapeDecoration(
                      color: Color(0xFF0516A2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -15,
                  top: -18.49,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.1,
                    height: 230,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/course4pic.png"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 75,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Navigate back to the previous page (main page)
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  left: 160,
                  top: 52,
                  child: GestureDetector(
                    onTap: () => _playVideo(context),
                    child: Container(
                      width: 75,
                      height: 68,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Video (2).png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 160,
                  top: 52,
                  child: GestureDetector(
                    onTap: () => _playVideo(context),
                    child: Container(
                      width: 75,
                      height: 68,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Audit org.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),


                Positioned(
                  left: -7,
                  top: 310,
                  child: Container(
                    width: 367,
                    height: 344,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 8,
                  top: 210.60,
                  child: Container(
                    width: 82,
                    height: 22.12,
                    decoration: ShapeDecoration(
                      color: Color(0x56FFD600),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 7,
                  top: 215.74,
                  child: SizedBox(
                    width: 82,
                    height: 12.38,
                    child: Text(
                      'Best Seller',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFFC600),
                        fontSize: 11,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 42,
                  top: 233,
                  child: SizedBox(
                    width: 289,
                    height: 52.39,
                    child: Text(
                      'Taxation (Pakistan)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF000636),
                        fontSize: 17,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 142,
                  top: 304.09,
                  child: SizedBox(
                    width: 72,
                    height: 22.12,
                    child: Text(
                      'About',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1D33DD),
                        fontSize: 12,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),



                Positioned(
                  left: 62,
                  top: 266,
                  child: Container(
                    width: 27,
                    height: 16,
                    child: Icon(
                      Icons.person,
                      size: 16, // Adjust size as needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                ),

                Positioned(
                  left: 37,
                  top: 270,
                  child: SizedBox(
                    width: 151,
                    height: 9,
                    child: Text(
                      '200+ Students',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 146,
                  top: 266,
                  child: Container(
                    width: 27,
                    height: 16,
                    child: Icon(
                      Icons.video_call,
                      size: 16, // Adjust size as needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                ),
                Positioned(
                  left: 167,
                  top: 270,
                  child: SizedBox(
                    width: 51,
                    height: 9,
                    child: Text(
                      '32 Lessons',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 235,
                  top: 266,
                  child: Container(
                    width: 27,
                    height: 16,
                    child: Icon(
                      Icons.emoji_events,
                      size: 16, // Adjust size as needed
                      color: Colors.black, // Adjust color as needed
                    ),
                  ),
                ),
                Positioned(
                  left: 255,
                  top: 270,
                  child: SizedBox(
                    width: 51,
                    height: 9,
                    child: Text(
                      '32 Medals',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 318,
                  child: Container(
                    width: 563,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 150,
                  top: 318,
                  child: Container(
                    width: 64,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 4,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF0066FF),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -6,
                  top: 331,
                  child: SizedBox(
                    width: 152,
                    height: 24,
                    child: Text(
                      'About Course',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 415,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 15,
                  top: 362,
                  child: SizedBox(
                    width: 353,
                    height: 66,
                    child: Text(
                      'course outline focused exclusively on Power BI for finance, accounting,taxation, and auditing graduates, excluding financial statement terminology:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 23,
                  top: 440,
                  child: SizedBox(
                    width: 286,
                    height: 418,
                    child: Text(
                      '• Overview of Power BI and its significance in financial analysis \n'
                          '• Installing and configuring Power BI Desktop\n'
                          '• Navigating the Power BI interface \n'
                          '• Data import and transformation using Power Query \n'
                      ,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 485,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 2',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 510,
                  child: SizedBox(
                    width: 286,
                    height: 218,
                    child: Text(
                      '• Importing data from diverse sources\n'
                          '• Establishing data relationships \n'
                          '• Constructing a star schema for financial data\n'
                          '• Data modeling best practices'
                      ,

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 555,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 3',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 580,
                  child: SizedBox(
                    width: 286,
                    height: 218,
                    child: Text(

                      '• Principles of effective data visualization\n'
                          '• Creating fundamental charts (e.g., bar, line, pie) for financial data\n'
                          '• Tailoring visuals for financial reporting\n'
                          '• Leveraging color and formatting effectively',

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 625,
                  child: SizedBox(
                    width: 102,
                    height: 24,
                    child: Text(
                      'Module : 4',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 23,
                  top: 650,
                  child: SizedBox(
                    width: 316,
                    height: 218,
                    child: Text(

                      '• Proficient data transformations with Power Query\n'
                          '• Combining and merging queries\n'
                          '• Crafting custom functions\n'
                          '•Utilizing date and time functions proficiently',

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),






                Positioned(
                  left: 70,
                  top: 700,
                  child: SizedBox(
                    width: 202,
                    height: 24,
                    child: Text(
                      'Registration Form',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 120,
                  top: 730,
                  child: SizedBox(
                    width: 106,
                    height: 20, // Adjust the height as needed
                    child: ElevatedButton(
                      onPressed: () async {
                        final Uri url = Uri.parse('https://forms.gle/e8CFWLrppCpNNrTQ6');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue, // Light blue color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32), // Border radius of 32
                        ),
                      ),
                      child: Text(
                        'ENROLL Now',
                        style: TextStyle(
                          color: Colors.white, // White color text
                          fontSize: 6, // Adjust font size as needed
                          fontFamily: 'Work Sans', // Change font family if needed
                          fontWeight: FontWeight.w600, // Adjust font weight as needed
                        ),
                      ),
                    ),
                  ),
                ),



              ],
            ),
          )
      ),
    );
  }
  void _playVideo(BuildContext context) {
    final VideoPlayerController videoPlayerController =
    VideoPlayerController.asset('assets/Audit.mp4');
    final ChewieController chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );

    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color:Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                  videoPlayerController.dispose();
                  chewieController.dispose();
                },
              ),
            ),
            backgroundColor: Colors.black,
            body: Center(
              child: Chewie(
                controller: chewieController,
              ),
            ),
          ),
        );
      },
    ).then((_) {
      videoPlayerController.dispose();
      chewieController.dispose();
    });
  }

}




class ExploreColleges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: 460,
        height: 612,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Navigate back to the previous page (main page)
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 539,
              child: Container(
                width: 364,
                height: 73,
                decoration: BoxDecoration(color: Colors.white),
              ),
            ),
            Positioned(
              left: 93,
              top: 31,
              child: SizedBox(
                width: 229,
                height: 57,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Explore Colleges\n',
                        style: TextStyle(
                          color: Color(0xFF000636),
                          fontSize: 27,
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: ' (Coming Soon )',
                        style: TextStyle(
                          color: Color(0xFF000636),
                          fontSize: 15,
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              left: 120,
              top: 109,
              child: Container(
                width: 170,
                height: 21,
                decoration: BoxDecoration(color: Color(0xFF1E2453)),
              ),
            ),
            Positioned(
              left: 123,
              top: 114,
              child: SizedBox(
                width: 167,
                height: 12,
                child: Text(
                  'Select your City for best Colleges ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 7,
              top: 174,
              child: Container(
                width: 120,
                height: 104,
                child: Positioned(

                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 120,
                          height: 104,
                          decoration: BoxDecoration(
                            color: Color(0xFF010636),
                            borderRadius: BorderRadius.circular(23),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 28.10,
                        top: 11.17,
                        child: SizedBox(
                          width: 68.51,
                          height: 25.05,
                          child: Text(
                            'Karachi',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'League Spartan',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 39.84,
                        top: 39.10,
                        child: Container(
                          width: 44.78,
                          height: 50.98,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/Karachi.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            ),
            Positioned(
              left: 144,
              top: 174,
              child: Container(
                width: 120,
                height: 104,
                child: Positioned(

                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 120,
                          height: 104,
                          decoration: BoxDecoration(
                            color: Color(0xFF010636),
                            borderRadius: BorderRadius.circular(23),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 28.10,
                        top: 11.17,
                        child: SizedBox(
                          width: 68.51,
                          height: 25.05,
                          child: Text(
                            'Lahore',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'League Spartan',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 33.84,
                        top: 32.10,
                        child: Container(
                          width: 54.78,
                          height: 66.98,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/Lahorepic.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            ),
            Positioned(
              left: 284,
              top: 174,
              child: Container(
                width: 120,
                height: 104,
                child: Positioned(

                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 120,
                          height: 104,
                          decoration: BoxDecoration(
                            color: Color(0xFF010636),
                            borderRadius: BorderRadius.circular(23),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 22.10,
                        top: 11.17,
                        child: SizedBox(
                          width: 85.51,
                          height: 25.05,
                          child: Text(
                            'Islamabad',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'League Spartan',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 32.84,
                        top: 32.10,
                        child: Container(
                          width: 64.78,
                          height: 60.98,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/Islamabadpic.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            ),
            Positioned(
              left: 7,
              top: 324,
              child: Container(
                width: 120,
                height: 104,
                child: Positioned(

                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 120,
                          height: 104,
                          decoration: BoxDecoration(
                            color: Color(0xFF010636),
                            borderRadius: BorderRadius.circular(23),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 22.10,
                        top: 11.17,
                        child: SizedBox(
                          width: 78.51,
                          height: 25.05,
                          child: Text(
                            'Faislabad',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'League Spartan',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 36.84,
                        top: 32.10,
                        child: Container(
                          width: 54.78,
                          height: 70.98,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/Faislabadpic.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            ),
            Positioned(
              left: 144,
              top: 324,
              child: Container(
                width: 120,
                height: 104,
                child: Positioned(

                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 120,
                          height: 104,
                          decoration: BoxDecoration(
                            color: Color(0xFF010636),
                            borderRadius: BorderRadius.circular(23),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 28.10,
                        top: 11.17,
                        child: SizedBox(
                          width: 68.51,
                          height: 25.05,
                          child: Text(
                            'Multan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'League Spartan',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 32.84,
                        top: 35.10,
                        child: Container(
                          width: 54.78,
                          height: 60.98,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/Multan.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            ),
            Positioned(
              left: 284,
              top: 324,
              child: Container(
                width: 120,
                height: 104,
                child: Positioned(

                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 120,
                          height: 104,
                          decoration: BoxDecoration(
                            color: Color(0xFF010636),
                            borderRadius: BorderRadius.circular(23),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 28.10,
                        top: 11.17,
                        child: SizedBox(
                          width: 68.51,
                          height: 25.05,
                          child: Text(
                            'Sialkot',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'League Spartan',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 39.84,
                        top: 39.10,
                        child: Container(
                          width: 44.78,
                          height: 50.98,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/Sialkot.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            ),
            Positioned(
              left: 67,
              top: 474,
              child: Container(
                width: 120,
                height: 104,
                child: Positioned(

                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 120,
                          height: 104,
                          decoration: BoxDecoration(
                            color: Color(0xFF010636),
                            borderRadius: BorderRadius.circular(23),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 18.10,
                        top: 11.17,
                        child: SizedBox(
                          width: 88.51,
                          height: 25.05,
                          child: Text(
                            'Peshawar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'League Spartan',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 39.84,
                        top: 39.10,
                        child: Container(
                          width: 44.78,
                          height: 50.98,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/Peshawar.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            ),

            Positioned(
              left: 227,
              top: 474,
              child: Container(
                width: 120,
                height: 104,
                child: Positioned(

                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 120,
                          height: 104,
                          decoration: BoxDecoration(
                            color: Color(0xFF010636),
                            borderRadius: BorderRadius.circular(23),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 18.10,
                        top: 11.17,
                        child: SizedBox(
                          width: 98.51,
                          height: 25.05,
                          child: Text(
                            'Rawalpindi',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'League Spartan',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 39.84,
                        top: 39.10,
                        child: Container(
                          width: 44.78,
                          height: 50.98,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/Pindi.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            ),


          ],
        ),
      ),
    );
  }
}
class Blogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: 400,
          height: 712,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(19),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 539,
                child: Container(
                  width: 364,
                  height: 73,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              Positioned(
                top: 20,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Navigate back to the previous page (main page)
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),
              Positioned(
                left: 137,
                top: 14,
                child: SizedBox(
                  width: 142,
                  height: 33,
                  child: Text(
                    'Blogs',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: 100,
                child: Container(
                  width: 410,
                  height: 240,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/blogs1stpic.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 14,
                top: 350,
                child: Container(
                  width: 390,
                  height: 144,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/blogs2ndpic.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 126,
                top: 511,
                child: Container(
                  width: 165,
                  height: 39,
                  decoration: ShapeDecoration(
                    color: Color(0xFF4200FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(31),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 126,
                top: 521,
                child: SizedBox(
                  width: 157,
                  height: 23,
                  child: Text(
                    'View More',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )

    );
  }
}
class WorkWithUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth * 1.0, // Adjusted width to 90% of the screen width
        height: screenHeight * 1.0,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 539,
              child: Container(
                width: 364,
                height: 73,
                decoration: BoxDecoration(color: Colors.white),
              ),
            ),
            Positioned(
              top: 12,
              left: 14,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Navigate back to the previous page (main page)
                },
                child: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 38,
              child: Container(
                width: 405,
                height: 256,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Workwithuspic (2).png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 83,
              top: 14,
              child: SizedBox(
                width: 201,
                height: 24,
                child: Text(
                  'WORK WITH US  ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: -32,
              top: 308,
              child: SizedBox(
                width: 271,
                height: 21,
                child: Text(
                  'Join Us as a Team Member',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF2300FF),
                    fontSize: 14,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 210,
              top: 308,
              child: SizedBox(
                width: 221,
                height: 22,
                child: Text(
                  'Join Us as an Instructor',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF2300FF),
                    fontSize: 14,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 7,
              top: 341,
              child: SizedBox(
                width: 203,
                height: 300,
                child: Text(
                  'At Professional’s Legacy, we are always looking for talented individuals who not only want to learn but also want to help us grow as a company. You will enjoy the perks of working in a growing start-up, solving the real life challenges, and impacting the lives of 100s of thousands students out there awaiting affordable quality education.             \nCome and join us.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 235,
              top: 341,
              child: SizedBox(
                width: 180,
                height: 300,
                child: Text(
                  'If you are a passionate instructor who wants to eliminate the physical barriers, and wants to reach to a global audience of millions of students through technology, we can help you in making it possible. Fill up the form and our team will get back to you.  \n\n\n\nLooking forward to take you aboard on this fantastic journey',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 23,
              top: 540,
              child: Container(
                width: 110,
                height: 27,
                decoration: ShapeDecoration(
                  color: Color(0xFF2300FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 45,
              top: 543,
              child: SizedBox(
                width: 72,
                height: 15,
                child: Text(
                  'JOIN US',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 271,
              top: 540,
              child: Container(
                width: 110,
                height: 27,
                decoration: ShapeDecoration(
                  color: Color(0xFF2300FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 295,
              top: 543,
              child: SizedBox(
                width: 72,
                height: 15,
                child: Text(
                  'JOIN US',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Logout extends StatelessWidget {
  Future<void> logout(BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('https://professionallegacy.org/logout_mobile.php'), // Replace with your logout script URL
        // No need to send any data in the body for logout
      );

      if (response.statusCode == 200) {
        // If logout is successful, navigate to the login page
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      } else {
        // Handle logout failure
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Failed to logout. Please try again later.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      // Handle logout failure
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('An error occurred. Please try again later.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Call the logout function when this widget is built
    logout(context);

    // Return a loading indicator or any other UI if needed
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Show a loading indicator while logging out
      ),
    );
  }
}



