import 'dart:math';
import 'package:flutter/material.dart';
// import 'package:login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _zigzagController;
  late AnimationController _splitController;

  late Animation<Alignment> _logoAlignmentZigzag;
  late Animation<double> _logoSlideLeft;
  late Animation<double> _textSlideRight;
  late Animation<double> _textFade;

  final List<Alignment> _zigzagPath = [
    Alignment(-0.85, -0.6),
    Alignment(0.6, -0.4),
    Alignment(-0.5, 0.0),
    Alignment(0.5, 0.3),
    Alignment.center, // akhir zigzag di tengah
  ];

  late double screenWidth;
  late double logoWidth;
  late double fontSize;
  late double slideOffset;

  @override
  void initState() {
    super.initState();

    _zigzagController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _logoAlignmentZigzag = TweenSequence<Alignment>(
      List.generate(_zigzagPath.length - 1, (i) {
        return TweenSequenceItem(
          tween: AlignmentTween(
            begin: _zigzagPath[i],
            end: _zigzagPath[i + 1],
          ).chain(CurveTween(curve: Curves.easeInOut)),
          weight: 1,
        );
      }),
    ).animate(_zigzagController);

    _splitController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _textFade = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _splitController,
      curve: Curves.easeIn,
    ));

    _startAnimation();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    screenWidth = MediaQuery.of(context).size.width;

    // Batasi ukuran agar tidak terlalu besar di tablet
    logoWidth = min(screenWidth * 0.13, 80.0);
    fontSize = min(screenWidth * 0.08, 40.0);
    slideOffset = min(screenWidth * 0.2, 50.0);

    _logoSlideLeft = Tween<double>(
      begin: 0.0,
      end: -slideOffset,
    ).animate(CurvedAnimation(
      parent: _splitController,
      curve: Curves.easeOutCubic,
    ));

    _textSlideRight = Tween<double>(
      begin: 0.0,
      end: slideOffset,
    ).animate(CurvedAnimation(
      parent: _splitController,
      curve: Curves.easeOutCubic,
    ));
  }

  Future<void> _startAnimation() async {
    await _zigzagController.forward(); // zigzag ke tengah
    await Future.delayed(const Duration(milliseconds: 300));
    await _splitController.forward(); // logo kiri, teks kanan

    // await Future.delayed(const Duration(seconds: 1));

    // if (mounted) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (_) => const LoginScreen()), // Ganti sesuai halaman tujuan kamu
    //   );
    // }
  }

  @override
  void dispose() {
    _zigzagController.dispose();
    _splitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C3C81),
      body: AnimatedBuilder(
        animation: Listenable.merge([_zigzagController, _splitController]),
        builder: (context, child) {
          final alignment = _zigzagController.isCompleted
              ? Alignment.center
              : _logoAlignmentZigzag.value;

          return Align(
            alignment: alignment,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Teks muncul dari belakang logo
                Opacity(
                  opacity: _textFade.value,
                  child: Transform.translate(
                    offset: Offset(_textSlideRight.value, 0),
                    child: Text(
                      'Jobaile',
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
                // Logo geser ke kiri
                Transform.translate(
                  offset: Offset(_logoSlideLeft.value, 0),
                  child: Image.asset(
                    'assets/images/logo-app.png',
                    width: logoWidth,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
