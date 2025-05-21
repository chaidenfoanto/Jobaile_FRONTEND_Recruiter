import 'package:flutter/material.dart';
import 'package:login/color/color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleLogin() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'E-mail dan password harus diisi.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontFamily: 'Poppins',
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 30, 30, 30),
          duration: const Duration(seconds: 2),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Berhasil menekan login (belum terhubung ke API).'),
      ),
    );
  }

  Widget _buildForm() {
    final ukuranlayar = MediaQuery.of(context).size;
    final panjanglayar = ukuranlayar.width;
    final lebarlayar = ukuranlayar.height;
    final bool isLandscape = lebarlayar > panjanglayar;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text(
          'Please sign in to continue',
          style: TextStyle(
            fontSize: panjanglayar > lebarlayar ? 14 : 16,
            fontFamily: 'Poppins',
          ),
        ),
        SizedBox(height: 10),
        Text('E-mail',
            style: TextStyle(fontSize: panjanglayar > lebarlayar ? 11 : 13, fontFamily: 'Poppins')),
        SizedBox(height: 5),
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 220, 220, 220),
            prefixIcon: Icon(Icons.mail, color: Colors.black),
            hintText: 'E-mail',
            hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.black.withAlpha(128),
              fontFamily: 'Poppins',
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text('Password',
            style: TextStyle(fontSize: panjanglayar > lebarlayar ? 11 : 13, fontFamily: 'Poppins')),
        SizedBox(height: 5),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromARGB(255, 220, 220, 220),
            prefixIcon: Icon(Icons.lock, color: Colors.black),
            hintText: 'Password',
            hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.black.withAlpha(128),
              fontFamily: 'Poppins',
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: 5),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Lupa kata sandi?',
              style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
            ),
          ),
        ),
        SizedBox(height: 5),
        ElevatedButton(
          onPressed: handleLogin,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            minimumSize: Size(double.infinity, 47),
          ),
          child: Text(
            'Sign In',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Belum memiliki akun?',
              style: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Daftar',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final ukuranlayar = MediaQuery.of(context).size;
    final pjgfoto = ukuranlayar.width;
    final lbrfoto = ukuranlayar.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isLandscape = constraints.maxWidth > constraints.maxHeight;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(30),
            child: isLandscape
                ? Row(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: pjgfoto*0.35,
                          maxHeight: lbrfoto*0.85,
                        ),
                        child: Image.asset(
                          'assets/foto/AssetImage.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(width: 40),
                      Expanded(child: _buildForm()),
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: lbrfoto > 840 ? 12 : 5, // 740 hp kecil 914 hp besar
                      ),
                      Text(
                        'Jobaile',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Image.asset(
                        'assets/foto/AssetImage.png',
                        height: lbrfoto > 840 ? lbrfoto * 0.40 : lbrfoto * 0.36, // 740 hp kecil 914 hp besar
                        width: pjgfoto*0.65,
                      ),
                      _buildForm(),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
