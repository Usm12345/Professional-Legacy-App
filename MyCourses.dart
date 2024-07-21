import 'package:flutter/material.dart';
import 'package:prof_legacy_app/main.dart';
import 'package:prof_legacy_app/myprofile.dart';


class MyCourses extends StatefulWidget {
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

  MyCourses({
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
  _MyCoursesState createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  @override
  Widget build(BuildContext context) {
    bool allPermissionsFalse =
        !widget.is_permitted &&
            !widget.is_permitted2 &&
            !widget.is_permitted3 &&
            !widget.is_permitted4 &&
            !widget.is_permitted5 &&
            !widget.is_permitted6 &&
            !widget.is_permitted7 &&
            !widget.is_permitted8;
    return Scaffold(
      body: Stack(
        children: [


          Positioned(
            left: 132,
            top: 26,
            child: SizedBox(
              width: 260,
              height: 222,
              child: Text(
                'My Courses',
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
            top: 20,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(
                    context); // Navigate back to the previous page (main page)
              },
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            left: 150,
            top: 84,
            child: SizedBox(
              width: 102,
              height: 22.12,
              child: Text(
                'Purchased',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF1D33DD),
                  fontSize: 19,
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 108,
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
          left: 144,
          top: 108,
          child: Container(
            width: 114,
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
      widget.is_permitted ? Positioned(
            left: 28,
            top: 170,
            child: buildPermittedContent(),
          ) : Positioned(
            top: 170,
            left: 20,
            child: buildNonPermittedContent(),
          ),
      widget.is_permitted2 ?    Positioned(
        top:290,
        left: 20,
        child: buildPermittedContent2(),
      ) :    Positioned(
        top:290,
        left: 20,
        child: buildNonPermittedContent2(),
      ),

          widget.is_permitted3 ?    Positioned(
            top:410,
            left: 20,
            child: buildPermittedContent3(),
          ) :    Positioned(
            top:410,
            left: 20,
            child: buildNonPermittedContent3(),
          ),

          widget.is_permitted4 ?    Positioned(
            top:530,
            left: 20,
            child: buildPermittedContent4(),
          ) :    Positioned(
            top:290,
            left: 20,
            child: buildNonPermittedContent4(),
          ),

          widget.is_permitted5 ?    Positioned(
            top:650,
            left: 20,
            child: buildPermittedContent5(),
          ) :    Positioned(
            top:650,
            left: 20,
            child: buildNonPermittedContent5(),
          ),

          widget.is_permitted6 ?    Positioned(
            top:770,
            left: 20,
            child: buildPermittedContent6(),
          ) :    Positioned(
            top:770,
            left: 20,
            child: buildNonPermittedContent6(),
          ),

          widget.is_permitted7 ?    Positioned(
            top:890,
            left: 20,
            child: buildPermittedContent7(),
          ) :    Positioned(
            top:890,
            left: 20,
            child: buildNonPermittedContent7(),
          ),

          widget.is_permitted8 ?    Positioned(
            top:1010,
            left: 20,
            child: buildPermittedContent8(),
          ) :    Positioned(
            top:1010,
            left: 20,
            child: buildNonPermittedContent8(),
          ),

          if (allPermissionsFalse)
            Positioned(
              top: 370, // Adjust the position as needed
              left: 50, // Adjust the position as needed
              child: Center(
                child: Text(
                  "You haven't purchased any courses yet 😔",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          Positioned(
            left: 0,
            bottom: 0, // Place the footer at the bottom of the screen
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width, // Full width of the screen
              height: 73,
              child: Stack(
                children: [

                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
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
                          MaterialPageRoute(builder: (context) =>
                              MainPage(username:widget.username , password:widget.password, is_permitted: widget.is_permitted, is_permitted2: widget.is_permitted2,is_permitted3: widget.is_permitted3,is_permitted4: widget.is_permitted4,is_permitted5: widget.is_permitted5,is_permitted6: widget.is_permitted6,is_permitted7: widget.is_permitted7,is_permitted8: widget.is_permitted8)),
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
                          MaterialPageRoute(builder: (context) =>
                              MainPage(username:widget.username , password:widget.password,is_permitted: widget.is_permitted, is_permitted2: widget.is_permitted2,is_permitted3: widget.is_permitted3,is_permitted4: widget.is_permitted4,is_permitted5: widget.is_permitted5,is_permitted6: widget.is_permitted6,is_permitted7: widget.is_permitted7,is_permitted8: widget.is_permitted8)),
                        );
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
                          MaterialPageRoute(builder: (context) =>
                              MyCourses(username:widget.username , password:widget.password,is_permitted: widget.is_permitted, is_permitted2: widget.is_permitted2,is_permitted3: widget.is_permitted3,is_permitted4: widget.is_permitted4,is_permitted5: widget.is_permitted5,is_permitted6: widget.is_permitted6,is_permitted7: widget.is_permitted7,is_permitted8: widget.is_permitted8)),
                        );
                      },
                      child: Container(
                        width: 58,
                        height: 47,
                        child: Center(
                          child: Icon(
                            Icons.book, // Use the home icon provided by Flutter
                            color: Colors.blueAccent, // Set icon color to white
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
                          MaterialPageRoute(builder: (context) =>
                              MyCourses(username:widget.username , password:widget.password,is_permitted: widget.is_permitted, is_permitted2: widget.is_permitted2,is_permitted3: widget.is_permitted3,is_permitted4: widget.is_permitted4,is_permitted5: widget.is_permitted5,is_permitted6: widget.is_permitted6,is_permitted7: widget.is_permitted7,is_permitted8: widget.is_permitted8)),
                        );
                      },
                      child: SizedBox(
                        width: 162,
                        height: 22,
                        child: Text(
                          'My Course',
                          style: TextStyle(
                            color: Colors.blueAccent,
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
                          MaterialPageRoute(builder: (context) =>
                              MyProfile(username:widget.username , password:widget.password, is_permitted: widget.is_permitted, is_permitted2: widget.is_permitted2,is_permitted3: widget.is_permitted3,is_permitted4: widget.is_permitted4,is_permitted5: widget.is_permitted5,is_permitted6: widget.is_permitted6,is_permitted7: widget.is_permitted7,is_permitted8: widget.is_permitted8)),
                        );
                      },
                      child: Container(
                        width: 58,
                        height: 47,
                        child: Center(
                          child: Icon(
                            Icons.person,
                            // Use the person icon provided by Flutter
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
                          MaterialPageRoute(builder: (context) =>
                              MainPage(username:widget.username ,password:widget.password, is_permitted: widget.is_permitted, is_permitted2: widget.is_permitted2,is_permitted3: widget.is_permitted3,is_permitted4: widget.is_permitted4,is_permitted5: widget.is_permitted5,is_permitted6: widget.is_permitted6,is_permitted7: widget.is_permitted7,is_permitted8: widget.is_permitted8)),
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




  Widget buildPermittedContent() {
    return Container(
      width: 355,
      height: 95,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 355,
              height: 95,
              decoration: ShapeDecoration(
                color: Color(0x0AD9D9D9),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 141,
              height: 95,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Course1pic.png"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          Positioned(
            left: 145,
            top: 4,
            child: Container(
              width: 89,
              height: 14,
              decoration: ShapeDecoration(
                color: Color(0x7FFFD600),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Positioned(
            left: 145,
            top: 5,
            child: SizedBox(
              width: 88,
              height: 10,
              child: Text(
                'Accounting',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFFF9900),
                  fontSize: 11,
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 137,
            top: 25,
            child: SizedBox(
              width: 203,
              height: 22,
              child: Text(
                'Data Analysis with Excel ',
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
            left: 134,
            top: 50,
            child: SizedBox(
              width: 201,
              height: 36,
              child: Text(
                'Purchased Successfully',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 10,
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 155,
            top: 48,
            child: Icon(
              Icons.shopping_cart,
              size: 17,
              color: Colors.black,
            ),
          ),
          Positioned(
            left: 145,
            top: 77,
            child: Container(
              width: 183,
              height: 9,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(1.00, 0.00),
                  end: Alignment(-1, 0),
                  colors: [Color(0xFF0028FF), Color(0xFF9CF6EB)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),
          Positioned(
            left: 332,
            top: 77,
            child: SizedBox(
              width: 23,
              height: 9,
              child: Text(
                '15/20',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 7,
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
  Widget buildNonPermittedContent() {
    return Center(
      child: Text(
        '',
        style: TextStyle(
          color: Colors.red,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildPermittedContent2() {
    return
      Container(
        width: 355,
        height: 95,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 355,
                height: 95,
                decoration: ShapeDecoration(
                  color: Color(0x0AD9D9D9),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 141,
                height: 95,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Course2pic.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Positioned(
              left: 145,
              top: 4,
              child: Container(
                width: 89,
                height: 14,
                decoration: ShapeDecoration(
                  color: Color(0x7FFFD600),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 145,
              top: 5,
              child: SizedBox(
                width: 88,
                height: 10,
                child: Text(
                  'Accounting',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFF9900),
                    fontSize: 11,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 137,
              top: 25,
              child: SizedBox(
                width: 203,
                height: 22,
                child: Text(
                  'Financial Modeling (FMVA) ',
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
              left: 134,
              top: 50,
              child: SizedBox(
                width: 201,
                height: 36,
                child: Text(
                  'Purchased Successfully',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 10,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 155,
              top: 48,
              child: Icon(
                Icons.shopping_cart,
                size: 17,
                color: Colors.black,
              ),
            ),
            Positioned(
              left: 145,
              top: 77,
              child: Container(
                width: 183,
                height: 9,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(1.00, 0.00),
                    end: Alignment(-1, 0),
                    colors: [Color(0xFF0028FF), Color(0xFF9CF6EB)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 332,
              top: 77,
              child: SizedBox(
                width: 23,
                height: 9,
                child: Text(
                  '15/20',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 7,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
  Widget buildNonPermittedContent2() {
    return Center(
      child: Text(
        '',
        style: TextStyle(
          color: Colors.red,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildPermittedContent3() {
    return  Container(
      width: 355,
      height: 95,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 355,
              height: 95,
              decoration: ShapeDecoration(
                color: Color(0x0AD9D9D9),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 141,
              height: 95,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Course3pic.png"),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          Positioned(
            left: 145,
            top: 4,
            child: Container(
              width: 89,
              height: 14,
              decoration: ShapeDecoration(
                color: Color(0x7FFFD600),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Positioned(
            left: 145,
            top: 5,
            child: SizedBox(
              width: 88,
              height: 10,
              child: Text(
                'Accounting',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFFF9900),
                  fontSize: 11,
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 137,
            top: 25,
            child: SizedBox(
              width: 203,
              height: 22,
              child: Text(
                'Prep. of Financial Statements',
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
            left: 134,
            top: 50,
            child: SizedBox(
              width: 201,
              height: 36,
              child: Text(
                'Purchased Successfully',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 10,
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 155,
            top: 48,
            child: Icon(
              Icons.shopping_cart,
              size: 17,
              color: Colors.black,
            ),
          ),
          Positioned(
            left: 145,
            top: 77,
            child: Container(
              width: 183,
              height: 9,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(1.00, 0.00),
                  end: Alignment(-1, 0),
                  colors: [Color(0xFF0028FF), Color(0xFF9CF6EB)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),
          Positioned(
            left: 332,
            top: 77,
            child: SizedBox(
              width: 23,
              height: 9,
              child: Text(
                '15/20',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 7,
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildNonPermittedContent3() {
    return Center(
      child: Text(
        '',
        style: TextStyle(
          color: Colors.red,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildPermittedContent4() {
    return Container(
        width: 355,
        height: 95,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 355,
                height: 95,
                decoration: ShapeDecoration(
                  color: Color(0x0AD9D9D9),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 141,
                height: 95,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/course4pic.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Positioned(
              left: 145,
              top: 4,
              child: Container(
                width: 89,
                height: 14,
                decoration: ShapeDecoration(
                  color: Color(0x7FFFD600),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 145,
              top: 5,
              child: SizedBox(
                width: 88,
                height: 10,
                child: Text(
                  'Accounting',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFF9900),
                    fontSize: 11,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 137,
              top: 25,
              child: SizedBox(
                width: 203,
                height: 22,
                child: Text(
                  'Audit of Financial Statements',
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
              left: 134,
              top: 50,
              child: SizedBox(
                width: 201,
                height: 36,
                child: Text(
                  'Purchased Successfully',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 10,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 155,
              top: 48,
              child: Icon(
                Icons.shopping_cart,
                size: 17,
                color: Colors.black,
              ),
            ),
            Positioned(
              left: 145,
              top: 77,
              child: Container(
                width: 183,
                height: 9,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(1.00, 0.00),
                    end: Alignment(-1, 0),
                    colors: [Color(0xFF0028FF), Color(0xFF9CF6EB)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 332,
              top: 77,
              child: SizedBox(
                width: 23,
                height: 9,
                child: Text(
                  '15/20',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 7,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
  Widget buildNonPermittedContent4() {
    return Center(
      child: Text(
        '',
        style: TextStyle(
          color: Colors.red,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildPermittedContent5() {
    return Container(
        width: 355,
        height: 95,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 355,
                height: 95,
                decoration: ShapeDecoration(
                  color: Color(0x0AD9D9D9),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 141,
                height: 95,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Course5pic.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Positioned(
              left: 145,
              top: 4,
              child: Container(
                width: 89,
                height: 14,
                decoration: ShapeDecoration(
                  color: Color(0x7FFFD600),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 145,
              top: 5,
              child: SizedBox(
                width: 88,
                height: 10,
                child: Text(
                  'Accounting',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFF9900),
                    fontSize: 11,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 137,
              top: 25,
              child: SizedBox(
                width: 203,
                height: 22,
                child: Text(
                  'Big Data with Power BI',
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
              left: 134,
              top: 50,
              child: SizedBox(
                width: 201,
                height: 36,
                child: Text(
                  'Purchased Successfully',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 10,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 155,
              top: 48,
              child: Icon(
                Icons.shopping_cart,
                size: 17,
                color: Colors.black,
              ),
            ),
            Positioned(
              left: 145,
              top: 77,
              child: Container(
                width: 183,
                height: 9,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(1.00, 0.00),
                    end: Alignment(-1, 0),
                    colors: [Color(0xFF0028FF), Color(0xFF9CF6EB)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 332,
              top: 77,
              child: SizedBox(
                width: 23,
                height: 9,
                child: Text(
                  '15/20',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 7,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
  Widget buildNonPermittedContent5() {
    return Center(
      child: Text(
        '',
        style: TextStyle(
          color: Colors.red,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildPermittedContent6() {
    return Container(
        width: 355,
        height: 95,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 355,
                height: 95,
                decoration: ShapeDecoration(
                  color: Color(0x0AD9D9D9),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 141,
                height: 95,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Course6pic.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Positioned(
              left: 145,
              top: 4,
              child: Container(
                width: 89,
                height: 14,
                decoration: ShapeDecoration(
                  color: Color(0x7FFFD600),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 145,
              top: 5,
              child: SizedBox(
                width: 88,
                height: 10,
                child: Text(
                  'Accounting',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFF9900),
                    fontSize: 11,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 137,
              top: 25,
              child: SizedBox(
                width: 203,
                height: 22,
                child: Text(
                  'Freelancing Course',
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
              left: 134,
              top: 50,
              child: SizedBox(
                width: 201,
                height: 36,
                child: Text(
                  'Purchased Successfully',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 10,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 155,
              top: 48,
              child: Icon(
                Icons.shopping_cart,
                size: 17,
                color: Colors.black,
              ),
            ),
            Positioned(
              left: 145,
              top: 77,
              child: Container(
                width: 183,
                height: 9,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(1.00, 0.00),
                    end: Alignment(-1, 0),
                    colors: [Color(0xFF0028FF), Color(0xFF9CF6EB)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 332,
              top: 77,
              child: SizedBox(
                width: 23,
                height: 9,
                child: Text(
                  '15/20',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 7,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
  Widget buildNonPermittedContent6() {
    return Center(
      child: Text(
        '',
        style: TextStyle(
          color: Colors.red,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildPermittedContent7() {
    return Container(
        width: 355,
        height: 95,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 355,
                height: 95,
                decoration: ShapeDecoration(
                  color: Color(0x0AD9D9D9),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 141,
                height: 95,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Course7pic.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Positioned(
              left: 145,
              top: 4,
              child: Container(
                width: 89,
                height: 14,
                decoration: ShapeDecoration(
                  color: Color(0x7FFFD600),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 145,
              top: 5,
              child: SizedBox(
                width: 88,
                height: 10,
                child: Text(
                  'Accounting',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFF9900),
                    fontSize: 11,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 137,
              top: 25,
              child: SizedBox(
                width: 203,
                height: 22,
                child: Text(
                  'Taxation (Gulf)',
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
              left: 134,
              top: 50,
              child: SizedBox(
                width: 201,
                height: 36,
                child: Text(
                  'Purchased Successfully',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 10,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 155,
              top: 48,
              child: Icon(
                Icons.shopping_cart,
                size: 17,
                color: Colors.black,
              ),
            ),
            Positioned(
              left: 145,
              top: 77,
              child: Container(
                width: 183,
                height: 9,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(1.00, 0.00),
                    end: Alignment(-1, 0),
                    colors: [Color(0xFF0028FF), Color(0xFF9CF6EB)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 332,
              top: 77,
              child: SizedBox(
                width: 23,
                height: 9,
                child: Text(
                  '15/20',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 7,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
  Widget buildNonPermittedContent7() {
    return Center(
      child: Text(
        '',
        style: TextStyle(
          color: Colors.red,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildPermittedContent8() {
    return Container(
        width: 355,
        height: 95,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 355,
                height: 95,
                decoration: ShapeDecoration(
                  color: Color(0x0AD9D9D9),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 141,
                height: 95,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Course8pic.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
            Positioned(
              left: 145,
              top: 4,
              child: Container(
                width: 89,
                height: 14,
                decoration: ShapeDecoration(
                  color: Color(0x7FFFD600),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 145,
              top: 5,
              child: SizedBox(
                width: 88,
                height: 10,
                child: Text(
                  'Accounting',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFF9900),
                    fontSize: 11,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 137,
              top: 25,
              child: SizedBox(
                width: 203,
                height: 22,
                child: Text(
                  'Taxation (Pakistan)',
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
              left: 134,
              top: 50,
              child: SizedBox(
                width: 201,
                height: 36,
                child: Text(
                  'Purchased Successfully',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 10,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 155,
              top: 48,
              child: Icon(
                Icons.shopping_cart,
                size: 17,
                color: Colors.black,
              ),
            ),
            Positioned(
              left: 145,
              top: 77,
              child: Container(
                width: 183,
                height: 9,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(1.00, 0.00),
                    end: Alignment(-1, 0),
                    colors: [Color(0xFF0028FF), Color(0xFF9CF6EB)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 332,
              top: 77,
              child: SizedBox(
                width: 23,
                height: 9,
                child: Text(
                  '15/20',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 7,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
  Widget buildNonPermittedContent8() {
    return Center(
      child: Text(
        '',
        style: TextStyle(
          color: Colors.red,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

