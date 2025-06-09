import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/BLoC/splash/splash_bloc.dart';
import 'package:login/BLoC/splash/splash_event.dart';
import 'package:login/BLoC/splash/splash_state.dart';
import 'package:login/views/onboarding/onboarding_screen.dart';
// import 'onboarding_screen.dart';
import '/login.dart';

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
    Alignment.center,
  ];

  late double screenWidth;
  late double logoWidth;
  late double fontSize;
  late double slideOffset;

  @override
  void initState() {
    super.initState();
    _initAnimations();

    Future.delayed(const Duration(milliseconds: 4000), () {
      context.read<SplashBloc>().add(StartSplashEvent());
    });
  }

  void _initAnimations() {
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

    _textFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _splitController, curve: Curves.easeIn),
    );

    _zigzagController.forward().whenComplete(() {
      Future.delayed(const Duration(milliseconds: 300), () {
        _splitController.forward();
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth = MediaQuery.of(context).size.width;
    logoWidth = min(screenWidth * 0.13, 80.0);
    fontSize = min(screenWidth * 0.08, 40.0);
    slideOffset = min(screenWidth * 0.2, 50.0);

    _logoSlideLeft = Tween<double>(
      begin: 0.0,
      end: -slideOffset,
    ).animate(CurvedAnimation(parent: _splitController, curve: Curves.easeOutCubic));

    _textSlideRight = Tween<double>(
      begin: 0.0,
      end: slideOffset,
    ).animate(CurvedAnimation(parent: _splitController, curve: Curves.easeOutCubic));
  }

  @override
  void dispose() {
    _zigzagController.dispose();
    _splitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashToOnboarding) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const OnboardingScreen(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.easeOut;
                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                return SlideTransition(position: animation.drive(tween), child: child);
              },
              transitionDuration: const Duration(seconds: 1),
            ),
          );
        } else if (state is SplashToLogin) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        }
      },
      child: Scaffold(
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
      ),
    );
  }
}
