
import 'package:agromanager/Trader%20UI/models/crop_registeration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Listed Crops/list_screen.dart';


class LISTCROPUI extends StatelessWidget {
  const LISTCROPUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back,
              size: 20,
              color: Colors.black),

        ),
      ),
      body: SafeArea(
          child: Container(
            // I am giving media query height
            // double.infinity make it big as my parent allow
            // while media query make it big as per the screen
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Text(
                      'Welcome To List Crop Section',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Farmers',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[700], fontSize: 15),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
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
                      height:  68,
                      onPressed:()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ListScreen()));
                      },
                      //Defining The Shape
                      color: const Color(0xFF81C784),
                      shape : RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: const Text(
                        "Listed Crop",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),

                    // SignUp Button---
                    const SizedBox(height: 20),
                    MaterialButton(
                      minWidth: double.infinity,
                      height:  68,
                      onPressed:()
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const CropRegister()));
                      },
                      //Defining The Shape
                      color: const Color(0xFF81C784),
                      shape : RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: const Text(
                        "List New Crop",
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
