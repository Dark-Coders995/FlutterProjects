import 'package:agromanager/Trader%20UI/models/vehicle_main.dart';
import 'package:agromanager/Trader%20UI/screens/shop_screen.dart';
import 'package:flutter/material.dart';
class TraderHome extends StatelessWidget {
  const TraderHome({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TraderPage(),
    );
  }
}

class TraderPage extends StatelessWidget {
  const TraderPage({Key? key}) : super(key: key);

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
                  children: <Widget>[
                    const Text(
                      'Welcome To AgroManager',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'We Are providing to farmers',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[700], fontSize: 15),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 3,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/logo.png")
                      )
                  ),
                ),
                Column(
                  children: <Widget>[
                    //------Login Button ---------
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 68,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const ShopScreen()));
                      },
                      //Defining The Shape
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: const Text(
                        "Crop Prices Info",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),

                    // SignUp Button---
                    const SizedBox(height: 20),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 68,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const VehicleUI()));
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
                        "Rent a Vehicle",
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