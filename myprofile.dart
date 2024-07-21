import 'package:flutter/material.dart';
import 'package:prof_legacy_app/main.dart';
import 'package:share_plus/share_plus.dart';
import 'package:prof_legacy_app/MyCourses.dart';

class MyProfile extends StatefulWidget {
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

  MyProfile({
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
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  void _shareApp() {
    Share.share('Check out this awesome app!'); // Customize the share message
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
            left: 132,
            top: 26,
            child: SizedBox(
              width: 260,
              height: 222,
              child: Text(
                'My Profile',
                style: TextStyle(
                  color: Color(0xFF000636),
                  fontSize: 23,
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 75,
            child: Container(
              width: MediaQuery.of(context).size.width * 1.0,
              height: 135,
              decoration: ShapeDecoration(
                color: Color(0xFF0516A2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19),
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 1.0,
            top: 170,
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
            left: MediaQuery.of(context).size.width * 1.0,
            top: 178,
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
            left: MediaQuery.of(context).size.width * 1.0,
            top: 187,
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
            top: 170,
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
            top: 178,
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
            top: 187,
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
          Positioned(
              top: 170,
              left: 150,
              child:
              Container(
                width: 78,
                height: 78,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black, // Background color
                  border: Border.all(color: Colors.deepPurpleAccent, width: 2), // Black outline border
                ),
                child: Center(
                  child: Icon(
                    Icons.person, // User icon
                    size: 48, // Adjust size as needed
                    color: Colors.blueAccent,
                  ),
                ),
              )),
          Positioned(
            left: 132,
            top: 136,
            child: SizedBox(
              width: 260,
              height: 222,
              child: Text(
                '${widget.username}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Lekton',
                  fontWeight: FontWeight.w300,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 270,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Username',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 2.0),
                      child: Text(
                        widget.username,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      width: 350, // Set the width of the underline to 200
                      height: 2,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 2.0),
                      child: Text(
                        widget.password,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      width: 350, // Set the width of the underline to 200
                      height: 2,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            left: 60,
            top: 550, // Adjust the top position as needed
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.share, color: Colors.black),
                    onPressed: _shareApp,
                  ),
                  SizedBox(width: 50),
                  Text(
                    'Refer to a friend',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,

                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 570.0),
            child: Center(
              child: Container(
                width: 250,
                height: 39,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the login page when the button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Logout()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(Color(0xFF000636)),
                    // Set text color to white
                    foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                    // Adjust other button properties here if needed
                  ),
                  child: Text('Logout'),
                ),
              ),
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
                            color: Colors.black, // Set icon color to white
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
                          MaterialPageRoute(builder: (context) =>  MainPage(username:widget.username , password:widget.password,is_permitted: widget.is_permitted, is_permitted2: widget.is_permitted2,is_permitted3: widget.is_permitted3,is_permitted4: widget.is_permitted4,is_permitted5: widget.is_permitted5,is_permitted6: widget.is_permitted6,is_permitted7: widget.is_permitted7,is_permitted8: widget.is_permitted8)),          );
                      },
                      child: SizedBox(
                        width: 62,
                        height: 22,
                        child: Text(
                          'Home',
                          style: TextStyle(
                            color: Colors.black,
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
                          MaterialPageRoute(builder: (context) =>  MyCourses(username:widget.username ,password:widget.password, is_permitted: widget.is_permitted, is_permitted2: widget.is_permitted2,is_permitted3: widget.is_permitted3,is_permitted4: widget.is_permitted4,is_permitted5: widget.is_permitted5,is_permitted6: widget.is_permitted6,is_permitted7: widget.is_permitted7,is_permitted8: widget.is_permitted8)),        );
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
                          MaterialPageRoute(builder: (context) => MyCourses(username:widget.username ,password:widget.password, is_permitted: widget.is_permitted, is_permitted2: widget.is_permitted2,is_permitted3: widget.is_permitted3,is_permitted4: widget.is_permitted4,is_permitted5: widget.is_permitted5,is_permitted6: widget.is_permitted6,is_permitted7: widget.is_permitted7,is_permitted8: widget.is_permitted8)),         );
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
                          MaterialPageRoute(builder: (context) => MyProfile(username:widget.username ,password:widget.password, is_permitted: widget.is_permitted, is_permitted2: widget.is_permitted2,is_permitted3: widget.is_permitted3,is_permitted4: widget.is_permitted4,is_permitted5: widget.is_permitted5,is_permitted6: widget.is_permitted6,is_permitted7: widget.is_permitted7,is_permitted8: widget.is_permitted8)),     );
                      },
                      child: Container(
                        width: 58,
                        height: 47,
                        child: Center(
                          child: Icon(
                            Icons.person, // Use the person icon provided by Flutter
                            color: Colors.blueAccent, // Set icon color to black
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
                          MaterialPageRoute(builder: (context) =>  MyProfile(username:widget.username , password:widget.password,is_permitted: widget.is_permitted, is_permitted2: widget.is_permitted2,is_permitted3: widget.is_permitted3,is_permitted4: widget.is_permitted4,is_permitted5: widget.is_permitted5,is_permitted6: widget.is_permitted6,is_permitted7: widget.is_permitted7,is_permitted8: widget.is_permitted8)),      );
                      },
                      child: SizedBox(
                        width: 62,
                        height: 32,
                        child: Text(
                          'Profile',
                          style: TextStyle(
                            color: Colors.blueAccent,
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
                            color: Colors.black, // Specify border color
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
    );
  }
}