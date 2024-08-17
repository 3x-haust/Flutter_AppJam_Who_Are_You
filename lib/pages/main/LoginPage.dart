import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Future<void> _handleGoogleSignIn() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     if (googleUser != null) {
  //       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  //       final OAuthCredential credential = GoogleAuthProvider.credential(
  //         accessToken: googleAuth.accessToken,
  //         idToken: googleAuth.idToken,
  //       );
  //       await _auth.signInWithCredential(credential);
  //     }
  //   } catch (e) {
  //     print('Google 로그인 실패: $e');
  //   }
  // }

  // Future<void> _handleAppleSignIn() async {
  //   try {
  //     final AuthorizationCredentialAppleID appleCredential = await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //     );
  //     final OAuthCredential credential = OAuthProvider('apple.com').credential(
  //       idToken: appleCredential.identityToken,
  //       accessToken: appleCredential.authorizationCode,
  //     );
  //     await _auth.signInWithCredential(credential);
  //   } catch (e) {
  //     print('Apple 로그인 실패: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          LoginCard(
            // onGoogleSignIn: _handleGoogleSignIn,
            // onAppleSignIn: _handleAppleSignIn,
          ),
        ],
      ),
    );
  }
}

class LoginCard extends StatelessWidget {
  // final Function() onGoogleSignIn;
  // final Function() onAppleSignIn;

  const LoginCard({
    Key? key,
    // required this.onGoogleSignIn,
    // required this.onAppleSignIn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 84),
        SvgPicture.asset(
          'assets/icons/logo.svg',
          width: 144,
          height: 127,
        ),
        const SizedBox(
          width: 300,
          height: 75,
          child: Text(
            'WAY',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF0061FF),
              fontSize: 70,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w800,
              height: 0,
              shadows: [
                Shadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 199,
          height: 23,
          child: Text(
            'Who Are You?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF4A4949),
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
              shadows: [
                Shadow(
                  offset: Offset(0, 3),
                  blurRadius: 3,
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 170),
        _buildLoginButton(
          'assets/icons/apple.svg',
          'Apple로 계속하기'
          //onAppleSignIn,
        ),
        const SizedBox(height: 16),
        _buildLoginButton(
          'assets/icons/google.svg',
          'Google로 계속하기'
          //onGoogleSignIn,
        ),
        const SizedBox(height: 16),
        _buildLoginButton(
          'assets/icons/email.svg',
          '이메일로 계속하기'
          //onGoogleSignIn,
        ),
      ],
    );
  }

  Widget _buildLoginButton(String iconPath, String label) {//, Function() onTap) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/signuppage');
      },
      child: Container(
        width: 321,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xFFD6D6D6)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                iconPath,
                width: 24,
                height: 24,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF787777),
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}