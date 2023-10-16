
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:agromanager/StartUpscreenTrader/login.dart';
import 'package:agromanager/StartUpscreenFarmer/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            // I am giving media query height
            // double.infinity make it big as my parent allow
            // while media query make it big as per the screen
            width: double.infinity,
            height: MediaQuery
                .of(context)
                .size
                .height,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: const <Widget>[
                    Text(
                      'Welcome To AgroManager',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 3,
                  decoration:  const BoxDecoration(
                    shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/logo.png")
                      )
                  ),
                ),
                Column(
                  children: <Widget>[
                    //------Trader Button ---------
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 68,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                      },
                      //Defining The Shape
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: const Text(
                        "Login as Trader",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),

                    // Farmer Button---
                    const SizedBox(height: 20),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 68,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const LoginScreenFarm()));
                      },
                      //Defining The Shape
                      color: const Color(0xFF81C784),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: const Text(
                        "Login as Farmer",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),


                  ],
                ),
              ],
            ),
          )),
    );
  }
}