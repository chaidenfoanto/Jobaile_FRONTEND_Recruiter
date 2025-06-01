import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _zigzagController;
  late AnimationController _logoMoveLeftController;
  late AnimationController _textController;

  late Animation<Alignment> _logoAlignmentZigzag;
  late Animation<Alignment> _logoAlignmentToLeft;
  late Animation<Offset> _textSlide;
  late Animation<double> _textFade;

  final List<Alignment> _zigzagPath = [
    Alignment(-0.85, -0.6),
    Alignment(0.6, -0.4),
    Alignment(-0.5, 0.0),
    Alignment(0.5, 0.3),
    Alignment(0.0, 0.0), // akhir zigzag: tengah
  ];

  @override
  void initState() {
    super.initState();

    // Zigzag logo
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

    // Logo pindah ke kiri
    _logoMoveLeftController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _logoAlignmentToLeft = AlignmentTween(
      begin: const Alignment(0.0, 0.0),
      end: const Alignment(-0.3, 0.0),
    ).animate(CurvedAnimation(
      parent: _logoMoveLeftController,
      curve: Curves.easeOut,
    ));

    // Tulisan muncul dari belakang logo
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _textSlide = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.2, 0.0), // ke kanan
    ).animate(CurvedAnimation(
      parent: _textController,
      curve: Curves.easeOut,
    ));

    _textFade = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _textController,
      curve: Curves.easeOut,
    ));

    _startAnimations();
  }

  Future<void> _startAnimations() async {
    await _zigzagController.forward(); // zigzag ke tengah
    await Future.delayed(const Duration(milliseconds: 300));
    await Future.wait([
      _logoMoveLeftController.forward(), // logo ke kiri
      _textController.forward(), // text muncul
    ]);
  }

  @override
  void dispose() {
    _zigzagController.dispose();
    _logoMoveLeftController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C3C81),
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Logo animasi gabungan (zigzag → tengah → kiri)
          AnimatedBuilder(
            animation: Listenable.merge(
              [_zigzagController, _logoMoveLeftController],
            ),
            builder: (context, child) {
              Alignment alignment = _zigzagController.isCompleted
                  ? _logoAlignmentToLeft.value
                  : _logoAlignmentZigzag.value;

              return Align(
                alignment: alignment,
                child: Image.asset(
                  'assets/images/logo-app.png',
                  width: 80,
                ),
              );
            },
          ),

          // Tulisan "Jobaile" muncul setelah logo ke tengah
          AnimatedBuilder(
            animation: _textController,
            builder: (context, child) {
              return Align(
                alignment: const Alignment(0.0, 0.0), // posisi awal sejajar logo tengah
                child: SlideTransition(
                  position: _textSlide,
                  child: FadeTransition(
                    opacity: _textFade,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: Text(
                        'Jobaile',
                        style: const TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
