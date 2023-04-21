import 'package:chat_c5/helper/provider/user_provider.dart';
import 'package:chat_c5/ui/layout/log_in/log_in_screen.dart';
import 'package:chat_c5/ui/screens/add_room/add_room_screen.dart';
import 'package:chat_c5/ui/screens/chat/chat_screen.dart';
import 'package:chat_c5/ui/screens/home/home_screen.dart';
import 'package:chat_c5/ui/screens/register/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'helper/provider/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    return MaterialApp(
      routes: {
        RegisterScreen.routeName: (_) => const RegisterScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        AddRoomScreen.routeName: (_) => const AddRoomScreen(),
        ChatScreen.routeName: (_) => const ChatScreen(),
      },
      initialRoute: provider.firebaseUser == null
          ? LoginScreen.routeName
          : HomeScreen.routeName,
      title: 'chat app',
    );
  }
}
