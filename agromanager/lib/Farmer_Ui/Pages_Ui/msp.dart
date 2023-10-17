import 'package:flutter/material.dart';

class MSp extends StatelessWidget {
  const MSp({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.symmetric(
                    horizontal: 30, vertical: 50),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Column(
                        children: <Widget>[
                          Text(
                            'Welcome To MSP Section',
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
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/MSP_photo/MicrosoftTeams-image.png')
                              )
                          )
                      ),
                      Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 3,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/MSP_photo/MicrosoftTeams-image1.png')
                              )
                          )
                      )
                    ]
                )
            )
        )
    );
  }
}
