

 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:post_api_assignment/Screens/Home/Home_Screen.dart';
import 'package:post_api_assignment/utils/Auth_Storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/Auth/Login_Screen.dart';
import 'Screens/Auth/Register_screen.dart';
import 'Screens/Home/theme_notifier.dart';

 // void main() async {
 //   WidgetsFlutterBinding.ensureInitialized();
 //   final SharedPreferences prefs = await SharedPreferences.getInstance();
 //   final bool isLoggedIn = prefs.getBool('is_logged_in') ?? false;
 //   //runApp(MyApp());
 //
 //   await GetStorage.init();
 //
 //   runApp(MyApp(isLoggedIn: isLoggedIn));
 //
 // }
 //
 //
 //
 // class MyApp extends StatelessWidget {
 //   final bool isLoggedIn;
 //
 //  // const MyApp({super.key});
 //   const MyApp({super.key, required this.isLoggedIn});
 //
 //
 //   @override
 //   Widget build(BuildContext context) {
 //     return  ValueListenableBuilder<ThemeMode>(valueListenable: themeNotifier, builder: (context, mode, _){
 //       return MaterialApp(
 //         debugShowCheckedModeBanner: false,
 //         //theme: ThemeData.dark(),
 //         theme: ThemeData.light(),
 //         darkTheme: ThemeData.dark(),
 //         themeMode: mode,
 //         home: isLoggedIn ? const HomeScreen() : const LoginScreen(),
 //         // home: RegisterScreen(),
 //       );
 //      }
 //     ) ;
 //   }
 // }


 void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await GetStorage.init(); // ✅ Initialize GetStorage

   String? token = AuthStorage.getToken();
   bool isLoggedIn = token != null && token.isNotEmpty;

   runApp(MyApp(isLoggedIn: isLoggedIn));
 }


 // void main() async {
 //   WidgetsFlutterBinding.ensureInitialized();
 //   await GetStorage.init();
 //
 //   bool isLoggedIn = AuthStorage.isLoggedIn();
 //
 //   runApp(MyApp(isLoggedIn: isLoggedIn));
 // }

 class MyApp extends StatelessWidget {
   final bool isLoggedIn;

   const MyApp({super.key, required this.isLoggedIn});

   @override
   Widget build(BuildContext context) {
     return ValueListenableBuilder<ThemeMode>(
       valueListenable: themeNotifier,
       builder: (context, mode, _) {
         return MaterialApp(
           debugShowCheckedModeBanner: false,
           theme: ThemeData.light(),
           darkTheme: ThemeData.dark(),
           themeMode: mode,
           home: isLoggedIn ? const HomeScreen() : const LoginScreen(),
         );
       },
     );
   }
 }


