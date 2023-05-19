import 'package:flutter/material.dart';
import 'package:health_vault/Doctor/Pages/patient.dart';
import 'package:health_vault/Doctor/Pages/patient_login.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

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
                      'Welcome To Hepositary',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
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
                    //------ Create Patient Button ---------
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 68,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const RegistrationScreen()));
                      },
                      //Defining The Shape
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: const Text(
                        "Create new ID for Patient",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),

                    // Doctor Button---
                    const SizedBox(height: 20),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 68,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => const UpdateScreenPat()));
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
                        "Update Patient",
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
