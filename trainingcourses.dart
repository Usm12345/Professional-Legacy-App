import 'package:flutter/material.dart';
import 'package:prof_legacy_app/Course1_Unlocked.dart';
import 'package:prof_legacy_app/Course2_Unlocked.dart';
import 'package:prof_legacy_app/Course3_Unlocked.dart';
import 'package:prof_legacy_app/Course4_Unlocked.dart';
import 'package:prof_legacy_app/Course5_Unlocked.dart';
import 'package:prof_legacy_app/Course6_Unlocked.dart';
import 'package:prof_legacy_app/Course7_Unlocked.dart';
import 'package:prof_legacy_app/Course8_Unlocked.dart';
import 'package:prof_legacy_app/main.dart';

class TrainingCourses extends StatefulWidget {
  final String username;
  final bool is_permitted;
  final bool is_permitted2;
  final bool is_permitted3;
  final bool is_permitted4;
  final bool is_permitted5;
  final bool is_permitted6;
  final bool is_permitted7;
  final bool is_permitted8;

  TrainingCourses({
    required this.username,
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
  _TrainingCoursesState createState() => _TrainingCoursesState();
}

class _TrainingCoursesState extends State<TrainingCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SingleChildScrollView(
        child:Container(
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
                  width: MediaQuery.of(context).size.width * 1.0, // 80% of the screen width
                  height: MediaQuery.of(context).size.height * 1.0,
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ),
              Positioned(
                left: 92,
                top: 21,
                child: SizedBox(
                  width: 260,
                  height: 222,
                  child: Text(
                    'Training Courses',
                    style: TextStyle(
                      color: Color(0xFF000636),
                      fontSize: 27,
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 102,
                top: 68,
                child: SizedBox(
                  width: 260,
                  height: 222,
                  child: Text(
                    'Explore our Popular courses !!!',
                    style: TextStyle(
                      color: Color(0xFF000636),
                      fontSize: 14,
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 5,
                top: 155,
                child: GestureDetector(
                  onTap: () {
                    if (widget.is_permitted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Course1_Unlocked()),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Course1()),
                      );
                    }
                  },

                  child: Container(
                    width: 190,
                    height: 223,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 190,
                            height: 223,
                            decoration: ShapeDecoration(
                              color: Color(0xFFF5F5F5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 1.11,
                          top: 1.17,
                          child: Container(
                            width: 188,
                            height: 112,
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
                          left: 10.09,
                          top: 116.45,
                          child: SizedBox(
                            width: 171.38,
                            height: 48.77,
                            child: Text(
                              'Data Analysis \nWith Advanced Excel',
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
                          left: 75.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 90.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 105.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 120.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 135.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(1.00, 0.00),
                                end: Alignment(-1, 0),
                                colors: [Color(0x70FFC600), Color(0xFFFFC600), Color(0x00FFC600)],
                              ),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 154.99,
                          top: 161.93,
                          child: SizedBox(
                            width: 25.10,
                            height: 20.25,
                            child: Text(
                              '4.5',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left:50.55,
                          top: 190.23,
                          child: Container(
                            width: 90.74,
                            height: 26.22,
                            decoration: ShapeDecoration(
                              color: Color(0xFF000636),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left:60.55,
                          top: 194.23,
                          child: SizedBox(
                            width: 72.59,
                            height: 13.66,
                            child: Text(
                              'Click Here',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          left: 7.17,
                          top: 163.93,
                          child: SizedBox(
                            width: 62.16,
                            height: 11.47,
                            child: Text(
                              'Best Seller',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w800,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 2.17,
                          top: 160.93,
                          child: Container(
                            width: 71.42,
                            height: 21.47,
                            decoration: ShapeDecoration(
                              color: Color(0x56FFD600),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),),
              Positioned(
                left: 5,
                top:425,
                child: GestureDetector(
                  onTap: () {
                    if (widget.is_permitted2) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Course2_Unlocked()),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Course2()),
                      );
                    }
                  },
                  child: Container(
                    width: 190,
                    height: 223,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 190,
                            height: 223,
                            decoration: ShapeDecoration(
                              color: Color(0xFFF5F5F5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 1.11,
                          top: 1.17,
                          child: Container(
                            width: 188,
                            height: 112,
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
                          left: 6.09,
                          top: 116.45,
                          child: SizedBox(
                            width: 191.38,
                            height: 48.77,
                            child: Text(
                              'Financial Modeling & \nValuation Analysis',
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
                          left: 75.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 90.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 105.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 120.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 135.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(1.00, 0.00),
                                end: Alignment(-1, 0),
                                colors: [Color(0x70FFC600), Color(0xFFFFC600), Color(0x00FFC600)],
                              ),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 154.99,
                          top: 161.93,
                          child: SizedBox(
                            width: 25.10,
                            height: 20.25,
                            child: Text(
                              '4.5',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left:50.55,
                          top: 190.23,
                          child: Container(
                            width: 90.74,
                            height: 26.22,
                            decoration: ShapeDecoration(
                              color: Color(0xFF000636),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left:60.55,
                          top: 194.23,
                          child: SizedBox(
                            width: 72.59,
                            height: 13.66,
                            child: Text(
                              'Click Here',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          left: 7.17,
                          top: 163.93,
                          child: SizedBox(
                            width: 62.16,
                            height: 11.47,
                            child: Text(
                              'Best Seller',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w800,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 2.17,
                          top: 160.93,
                          child: Container(
                            width: 71.42,
                            height: 21.47,
                            decoration: ShapeDecoration(
                              color: Color(0x56FFD600),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),),
              Positioned(
                left: 213,
                top: 155,
                child: GestureDetector(
                  onTap: () {
                    if (widget.is_permitted3) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Course3_Unlocked()),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Course3()),
                      );
                    }
                  },
                  child: Container(
                    width: 190,
                    height: 223,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 190,
                            height: 223,
                            decoration: ShapeDecoration(
                              color: Color(0xFFF5F5F5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 1.11,
                          top: 1.17,
                          child: Container(
                            width: 188,
                            height: 112,
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
                          left: 10.09,
                          top: 116.45,
                          child: SizedBox(
                            width: 171.38,
                            height: 48.77,
                            child: Text(
                              'Preparation of \nFinancial Statements',
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
                          left: 75.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 90.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 105.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 120.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 135.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(1.00, 0.00),
                                end: Alignment(-1, 0),
                                colors: [Color(0x70FFC600), Color(0xFFFFC600), Color(0x00FFC600)],
                              ),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 154.99,
                          top: 161.93,
                          child: SizedBox(
                            width: 25.10,
                            height: 20.25,
                            child: Text(
                              '4.5',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left:50.55,
                          top: 190.23,
                          child: Container(
                            width: 90.74,
                            height: 26.22,
                            decoration: ShapeDecoration(
                              color: Color(0xFF000636),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left:60.55,
                          top: 194.23,
                          child: SizedBox(
                            width: 72.59,
                            height: 13.66,
                            child: Text(
                              'Click Here',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          left: 7.17,
                          top: 163.93,
                          child: SizedBox(
                            width: 62.16,
                            height: 11.47,
                            child: Text(
                              'Best Seller',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w800,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 2.17,
                          top: 160.93,
                          child: Container(
                            width: 71.42,
                            height: 21.47,
                            decoration: ShapeDecoration(
                              color: Color(0x56FFD600),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),),
              Positioned(
                left: 213,
                top:425,
                child: GestureDetector(
                  onTap: () {
                    if (widget.is_permitted4) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Course4_Unlocked()),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Course4()),
                      );
                    }
                  },
                  child: Container(
                    width: 190,
                    height: 223,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 190,
                            height: 223,
                            decoration: ShapeDecoration(
                              color: Color(0xFFF5F5F5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 1.11,
                          top: 1.17,
                          child: Container(
                            width: 188,
                            height: 112,
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
                          left: 6.09,
                          top: 116.45,
                          child: SizedBox(
                            width: 191.38,
                            height: 48.77,
                            child: Text(
                              'Audit of Financial \n Statements',
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
                          left: 75.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 90.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 105.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 120.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 135.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(1.00, 0.00),
                                end: Alignment(-1, 0),
                                colors: [Color(0x70FFC600), Color(0xFFFFC600), Color(0x00FFC600)],
                              ),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 154.99,
                          top: 161.93,
                          child: SizedBox(
                            width: 25.10,
                            height: 20.25,
                            child: Text(
                              '4.5',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left:50.55,
                          top: 190.23,
                          child: Container(
                            width: 90.74,
                            height: 26.22,
                            decoration: ShapeDecoration(
                              color: Color(0xFF000636),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left:60.55,
                          top: 194.23,
                          child: SizedBox(
                            width: 72.59,
                            height: 13.66,
                            child: Text(
                              'Click Here',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          left: 7.17,
                          top: 163.93,
                          child: SizedBox(
                            width: 62.16,
                            height: 11.47,
                            child: Text(
                              'Best Seller',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w800,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 2.17,
                          top: 160.93,
                          child: Container(
                            width: 71.42,
                            height: 21.47,
                            decoration: ShapeDecoration(
                              color: Color(0x56FFD600),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),),
              Positioned(
                left: 5,
                top:695,
                child: GestureDetector(
                  onTap: () {
                    if (widget.is_permitted5) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Course5_Unlocked()),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Course5()),
                      );
                    }
                  },
                  child: Container(
                    width: 190,
                    height: 223,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 190,
                            height: 223,
                            decoration: ShapeDecoration(
                              color: Color(0xFFF5F5F5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 1.11,
                          top: 1.17,
                          child: Container(
                            width: 188,
                            height: 112,
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
                          left: 6.09,
                          top: 116.45,
                          child: SizedBox(
                            width: 191.38,
                            height: 48.77,
                            child: Text(
                              'Big Data with  \n Power BI',
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
                          left: 75.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 90.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 105.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 120.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 135.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(1.00, 0.00),
                                end: Alignment(-1, 0),
                                colors: [Color(0x70FFC600), Color(0xFFFFC600), Color(0x00FFC600)],
                              ),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 154.99,
                          top: 161.93,
                          child: SizedBox(
                            width: 25.10,
                            height: 20.25,
                            child: Text(
                              '4.5',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left:50.55,
                          top: 190.23,
                          child: Container(
                            width: 90.74,
                            height: 26.22,
                            decoration: ShapeDecoration(
                              color: Color(0xFF000636),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left:60.55,
                          top: 194.23,
                          child: SizedBox(
                            width: 72.59,
                            height: 13.66,
                            child: Text(
                              'Click Here',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          left: 7.17,
                          top: 163.93,
                          child: SizedBox(
                            width: 62.16,
                            height: 11.47,
                            child: Text(
                              'Best Seller',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w800,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 2.17,
                          top: 160.93,
                          child: Container(
                            width: 71.42,
                            height: 21.47,
                            decoration: ShapeDecoration(
                              color: Color(0x56FFD600),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),),
              Positioned(
                left: 213,
                top:695,
                child: GestureDetector(
                  onTap: () {
                    if (widget.is_permitted6) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Course6_Unlocked()),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Course6()),
                      );
                    }
                  },
                  child: Container(
                    width: 190,
                    height: 223,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 190,
                            height: 223,
                            decoration: ShapeDecoration(
                              color: Color(0xFFF5F5F5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 1.11,
                          top: 1.17,
                          child: Container(
                            width: 188,
                            height: 112,
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
                          left: 6.09,
                          top: 116.45,
                          child: SizedBox(
                            width: 191.38,
                            height: 48.77,
                            child: Text(
                              'Freelancing \n (Fiverr + Upwork)',
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
                          left: 75.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 90.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 105.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 120.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 135.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(1.00, 0.00),
                                end: Alignment(-1, 0),
                                colors: [Color(0x70FFC600), Color(0xFFFFC600), Color(0x00FFC600)],
                              ),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 154.99,
                          top: 161.93,
                          child: SizedBox(
                            width: 25.10,
                            height: 20.25,
                            child: Text(
                              '4.5',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left:50.55,
                          top: 190.23,
                          child: Container(
                            width: 90.74,
                            height: 26.22,
                            decoration: ShapeDecoration(
                              color: Color(0xFF000636),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left:60.55,
                          top: 194.23,
                          child: SizedBox(
                            width: 72.59,
                            height: 13.66,
                            child: Text(
                              'Click Here',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          left: 7.17,
                          top: 163.93,
                          child: SizedBox(
                            width: 62.16,
                            height: 11.47,
                            child: Text(
                              'Best Seller',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w800,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 2.17,
                          top: 160.93,
                          child: Container(
                            width: 71.42,
                            height: 21.47,
                            decoration: ShapeDecoration(
                              color: Color(0x56FFD600),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),),
              Positioned(
                left: 5,
                top:965,
                child: GestureDetector(
                  onTap: () {
                    if (widget.is_permitted7) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Course7_Unlocked()),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Course7()),
                      );
                    }
                  },
                  child: Container(
                    width: 190,
                    height: 223,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 190,
                            height: 223,
                            decoration: ShapeDecoration(
                              color: Color(0xFFF5F5F5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 1.11,
                          top: 1.17,
                          child: Container(
                            width: 188,
                            height: 112,
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
                          left: 6.09,
                          top: 116.45,
                          child: SizedBox(
                            width: 191.38,
                            height: 48.77,
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
                          left: 75.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 90.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 105.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 120.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 135.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(1.00, 0.00),
                                end: Alignment(-1, 0),
                                colors: [Color(0x70FFC600), Color(0xFFFFC600), Color(0x00FFC600)],
                              ),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 154.99,
                          top: 161.93,
                          child: SizedBox(
                            width: 25.10,
                            height: 20.25,
                            child: Text(
                              '4.5',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left:50.55,
                          top: 190.23,
                          child: Container(
                            width: 90.74,
                            height: 26.22,
                            decoration: ShapeDecoration(
                              color: Color(0xFF000636),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left:60.55,
                          top: 194.23,
                          child: SizedBox(
                            width: 72.59,
                            height: 13.66,
                            child: Text(
                              'Click Here',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          left: 7.17,
                          top: 163.93,
                          child: SizedBox(
                            width: 62.16,
                            height: 11.47,
                            child: Text(
                              'Best Seller',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w800,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 2.17,
                          top: 160.93,
                          child: Container(
                            width: 71.42,
                            height: 21.47,
                            decoration: ShapeDecoration(
                              color: Color(0x56FFD600),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),),
              Positioned(
                left: 213,
                top:965,
                child: GestureDetector(
                  onTap: () {
                    if (widget.is_permitted8) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Course8_Unlocked()),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Course8()),
                      );
                    }
                  },
                  child: Container(
                    width: 190,
                    height: 223,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 190,
                            height: 223,
                            decoration: ShapeDecoration(
                              color: Color(0xFFF5F5F5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 1.11,
                          top: 1.17,
                          child: Container(
                            width: 188,
                            height: 112,
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
                          left: 6.09,
                          top: 116.45,
                          child: SizedBox(
                            width: 191.38,
                            height: 48.77,
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
                          left: 75.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 90.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 105.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 120.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFFC600),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 135.01,
                          top: 160.93,
                          child: Container(
                            width: 17.20,
                            height: 16.73,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(1.00, 0.00),
                                end: Alignment(-1, 0),
                                colors: [Color(0x70FFC600), Color(0xFFFFC600), Color(0x00FFC600)],
                              ),
                              shape: StarBorder(
                                points: 5,
                                innerRadiusRatio: 0.38,
                                pointRounding: 0,
                                valleyRounding: 0,
                                rotation: 0,
                                squash: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 154.99,
                          top: 161.93,
                          child: SizedBox(
                            width: 25.10,
                            height: 20.25,
                            child: Text(
                              '4.5',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left:50.55,
                          top: 190.23,
                          child: Container(
                            width: 90.74,
                            height: 26.22,
                            decoration: ShapeDecoration(
                              color: Color(0xFF000636),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left:60.55,
                          top: 194.23,
                          child: SizedBox(
                            width: 72.59,
                            height: 13.66,
                            child: Text(
                              'Click Here',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          left: 7.17,
                          top: 163.93,
                          child: SizedBox(
                            width: 62.16,
                            height: 11.47,
                            child: Text(
                              'Best Seller',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontFamily: 'League Spartan',
                                fontWeight: FontWeight.w800,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 2.17,
                          top: 160.93,
                          child: Container(
                            width: 71.42,
                            height: 21.47,
                            decoration: ShapeDecoration(
                              color: Color(0x56FFD600),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),),

            ],
          ),
        )
        ),
    );
  }
}