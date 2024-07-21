import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class Course5_Unlocked extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Wrap the Container in SingleChildScrollView
          child: Container(
            width: MediaQuery.of(context).size.width * 1.0, // 100% of the screen width
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
                    onTap: () => _playVideo(context , "assets/Video (2).png"),
                    child: Container(
                      width: 75,
                      height: 68,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/Course5pic.png"),
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
                      'BIG DATA WITH POWER BI ',
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
                  top: 450,  // Move the column down by 200 pixels
                  left: 16,   // Ensure it's aligned to the left edge
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,  // Align buttons to start of the column
                    children: List.generate(14, (index) {
                      // Calculate video path based on the course number
                      String videoPath = '';
                      switch (index + 1) {
                        case 1:
                          videoPath = 'assets/AUDIT CLASSES/AUDIT CLASSES 1.mp4';
                          break;
                        case 2:
                          videoPath = 'assets/AUDIT CLASSES/AUDIT CLASSES 2.mp4';
                          break;
                        case 3:
                          videoPath = 'assets/AUDIT CLASSES/AUDIT CLASSES 3.mp4';
                          break;
                        case 4:
                          videoPath = 'assets/AUDIT CLASSES/AUDIT CLASSES 4.mp4';
                          break;
                        case 5:
                          videoPath = 'assets/AUDIT CLASSES/AUDIT CLASSES 5.mp4';
                          break;
                        case 6:
                          videoPath = 'assets/AUDIT CLASSES/AUDIT CLASSES 6.mp4';
                          break;
                        case 7:
                          videoPath = 'assets/AUDIT CLASSES/AUDIT CLASSES 7.mp4';
                          break;
                        case 8:
                          videoPath = 'assets/AUDIT CLASSES/AUDIT CLASSES 8.mp4';
                          break;
                        case 9:
                          videoPath = 'assets/AUDIT CLASSES/AUDIT CLASSES 9.mp4';
                          break;
                        case 10:
                          videoPath = 'assets/AUDIT CLASSES/AUDIT CLASSES 10.mp4';
                          break;
                        case 11:
                          videoPath = 'assets/AUDIT CLASSES/AUDIT CLASSES 11.mp4';
                          break;
                        case 12:
                          videoPath = 'assets/AUDIT CLASSES/AUDIT CLASSES 12.mp4';
                          break;
                        case 13:
                          videoPath = 'assets/AUDIT CLASSES/AUDIT CLASSES 13.mp4';
                          break;

                        default:
                        // Default case
                          break;
                      }
                      return HoverButton(
                        courseNumber: index + 1,
                        videoPath: videoPath, // Pass videoPath here
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CoursePage(index + 1)),
                          );
                        },
                      );
                    }),
                  ),
                ),

              ],
            ),
          )
      ),
    );
  }


}
void _playVideo(BuildContext context, String videoPath) {
  final VideoPlayerController videoPlayerController =
  VideoPlayerController.asset(videoPath);
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
              color: Colors.white,
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

class HoverButton extends StatefulWidget {
  final int courseNumber;
  final String videoPath;
  final VoidCallback onTap;

  const HoverButton({
    Key? key,
    required this.courseNumber,
    required this.videoPath,
    required this.onTap,
  }) : super(key: key);

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          height: 25,
          width: 370,
          decoration: BoxDecoration(
            color: _isHovered ? Colors.blue.withOpacity(0.7) : Colors.blue,
            borderRadius: BorderRadius.circular(5),
          ),
          alignment: Alignment.center,
          child: Text(
            'Course ${widget.courseNumber}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}


class CoursePage extends StatefulWidget {
  final int courseNumber;

  const CoursePage(this.courseNumber, {Key? key}) : super(key: key);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  void _initializeVideoPlayer() {
    String videoPath = '';

    switch (widget.courseNumber) {
      case 1:
        videoPath = 'assets/Excel Class/Excel 1.mp4';
        break;
      case 2:
        videoPath = 'assets/Excel Class/Excel 2.mp4';
        break;
    // Add cases for courses 3 to 12 similarly
      case 3:
        videoPath = 'assets/Audit.mp4';
        break;
    // Add more cases as needed
      default:
      // Default case
        break;
    }

    _videoPlayerController = VideoPlayerController.asset(videoPath);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Course ${widget.courseNumber}'),
      ),
      body: Center(
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }
}
