import 'package:appjam_who_are_you/pages/chat/ChatPage.dart';
import 'package:appjam_who_are_you/pages/main/CardPage.dart';
import 'package:appjam_who_are_you/pages/main/LoginPage.dart';
import 'package:appjam_who_are_you/pages/main/MainPage.dart';
import 'package:appjam_who_are_you/pages/main/SignupPage.dart';
import 'package:appjam_who_are_you/pages/my/AddFriends.dart';
import 'package:appjam_who_are_you/pages/my/FriendPage.dart';
import 'package:appjam_who_are_you/pages/my/MyPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

Future<void> main() async {
  //await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/', page: () => const MainPage()),
        GetPage(name: '/chat', page: () => const ChatPage()),
        GetPage(name: '/my', page: () => const MyPage()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/addfriends', page: () => const AddFriends()),
        GetPage(name: '/profilecard', page: () => const CardPage()),
        GetPage(name: '/friendpage', page: () => const FriendPage()),
        GetPage(name: '/signuppage', page: () => const SignupPage()),
      ],
      initialRoute: '/login', 
      debugShowCheckedModeBanner: false,
    );
  }
}
