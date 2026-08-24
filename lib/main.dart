import 'package:evently/app_theme.dart';
import 'package:evently/home_screen.dart';
import 'package:evently/providers/events_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/screens/create_event_screen.dart';
import 'package:evently/screens/login_screen.dart';
import 'package:evently/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => EventsProvider()..getAllEvents()),
      ],
      child: EventlyApp(),
    ),
  );
}

class EventlyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        RegisterScreen.routeName: (_) => RegisterScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        CreateEventScreen.routeName: (_) => CreateEventScreen(),
      },
      initialRoute: LoginScreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: .light,
    );
  }
}
