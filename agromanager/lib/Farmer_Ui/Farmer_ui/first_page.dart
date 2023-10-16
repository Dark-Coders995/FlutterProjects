
import 'package:agromanager/Farmer_Ui/Pages_Ui/Crops/crops.dart';
import 'package:agromanager/Farmer_Ui/Pages_Ui/List%20Crop/Listed%20Vehicle/list_screen.dart';
import 'package:agromanager/Farmer_Ui/Pages_Ui/List%20Crop/list.dart';
import 'package:agromanager/Farmer_Ui/Pages_Ui/msp.dart';
import 'package:agromanager/Farmer_Ui/Pages_Ui/weather.dart';
import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

import '../../main.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key, required this.title}) : super(key: key);
final String title ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),
      backgroundColor: const Color(0xFF81C784),),
      body: ListView(
        children: [
          SizedBox(
              height: 800.0,
              width: double.infinity,
              child:Carousel(
                dotSize: 2.0,
                dotSpacing: 15.0,
                dotColor: Colors.lightGreenAccent,
                indicatorBgPadding: 5.0,
                dotBgColor: Colors.transparent,

                images: [
                  Image.asset(
                    'assets/Slideshow_Farmer/2950951.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/Slideshow_Farmer/4293142.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/Slideshow_Farmer/6078257.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/Slideshow_Farmer/6443448.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/Slideshow_Farmer/6487280.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              )
          )
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF81C784),
              ),
              child: Text('Welcome to AgroManger Farmer Section'),
            ),
            ListTile(
              title: const Text('Home'),
              leading: const Icon(Icons.home),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Weather'),
              leading: const Icon(Icons.menu),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  const Weather()));
              },
            ),
            ListTile(
              title: const Text('General Crops Info'),
              leading: const Icon(Icons.message),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  const CropsUI()));
              },
            ),
            ListTile(
              title: const Text('MSP Info'),
              leading: const Icon(Icons.message),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  const MSp()));
              },
            ),
            ListTile(
              title: const Text('List Crop'),
              leading: const Icon(Icons.feedback),
              onTap: () {
                // Update the state of the app
               Navigator.push(context, MaterialPageRoute(builder: (context) =>  const LISTCROPUI()));
                // Then close the drawer
               // Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Vehicle Rent Info'),
              leading: const Icon(Icons.message),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  const ListVehScreen()));
              },
            ),
            ListTile(
              title: const Text('Log Out'),
              leading: const Icon(Icons.logout),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context, MaterialPageRoute(builder: (context) =>   const HomePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
