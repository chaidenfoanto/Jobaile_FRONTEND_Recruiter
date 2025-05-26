import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final List<Alignment> _positions = [
    Alignment(-2.0, -0.8),
    Alignment(1.0, -0.6),
    Alignment(-0.8, 0.6),
    Alignment(0.8, 0.6),
    Alignment.center,
  ];

  int _currentPosition = 0;
  bool _showText = false;
  bool _finalPositionReached = false;

  @override
  void initState() {
    super.initState();
    _startMoving();
  }

  void _startMoving() {
    Timer.periodic(const Duration(milliseconds: 700), (timer) {
      if (_currentPosition < _positions.length - 1) {
        setState(() {
          _currentPosition++;
        });
      } else {
        timer.cancel();
        Future.delayed(const Duration(milliseconds: 600), () {
          setState(() {
            _finalPositionReached = true;
          });

          Future.delayed(const Duration(milliseconds: 400), () {
            setState(() {
              _showText = true;
            });
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C3C81),
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Tulisan "Jobaile"
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOut,
            bottom: MediaQuery.of(context).size.height / 2 - 50,
            left: _showText ? MediaQuery.of(context).size.width / 2 - 20 : MediaQuery.of(context).size.width / 2 - 80,
            child: AnimatedOpacity(
              opacity: _showText ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Text(
                'Jobaile',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),

          // Gambar tangan
          AnimatedAlign(
            alignment: _finalPositionReached ? const Alignment(-0.3, 0.0) : _positions[_currentPosition],
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOut,
            child: Image.asset(
              'assets/images/logo-app.png',
              width: 70,
            ),
          ),
        ],
      ),
    );
  }
}
