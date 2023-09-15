import 'dart:async';
import 'package:barber/Provider/map_data_provider.dart';
import 'package:barber/screens/AppointmentScreen.dart';
import 'package:barber/screens/bookingScreen.dart';
import 'package:barber/screens/mapsScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MapDataProvider>(
            create: (_) => MapDataProvider()),
      ],
      child: MaterialApp(
        title: "Barber App",

        // --------------------- Add Theme Data ---------------------- //
        // Add theme data here
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.dark,
          primaryColor: Colors.blueGrey[900],

          // Define the default font family.

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: const TextTheme(
            displayLarge: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            displayMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
            titleLarge: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal),
            bodyMedium: TextStyle(
              fontSize: 14.0,
            ),
          ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan[600]),
        ),

        // ------------------- Manage Routes ------------------- //
        //Add new routes here
        routes: {
          '/bookingScreen': (context) => const BookingScreen(),
          '/mappage': (context) => const Mappage(),
          '/appointmentScreen': (context) => const AppointmentScreen(),
        },

        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  // -------------- for start page
  Widget defaultPage = Container();

//------------ check if the user is using app for first time or not
  void checkSharedPrefs() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    if (sharedPrefs.containsKey("firstTime")) {
      defaultPage = Container();
    }
  }

//-------- initialize with a Timer that will push to new screen after few seconds
  @override
  void initState() {
    super.initState();
    checkSharedPrefs();
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const AppointmentScreen(),
        ),
      );
    });
  }

// ---------------- Splash Screen Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // -------------------- temp background color can be changed.... in THEME DATA
      backgroundColor: Colors.blueGrey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/splash_screen.gif",
            height: (60 / 100) * MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          CircularProgressIndicator(
            strokeWidth: 4,
            backgroundColor: Colors.amberAccent[400],
          )
        ],
      ),
    );
  }
}
