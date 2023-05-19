import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? firstName;
  String? secondName;
  String? email;
  String? sugar;
  String? bloodg;
  String? bloodp;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: null,
      body: Center(
        child: FutureBuilder(
          future: _fetch(),
          builder: (context , snapshot){
            if(snapshot.connectionState!=ConnectionState.done)
              {
                return const Text("Loading");
              }
            return Text(
                "First Name: $firstName \n"
                "Last Name : $secondName\n"
                "Email : $email \n"
                "Blood Group : $bloodg \n"
                "Blood Pressure : $bloodp \n"
                "Sugar Level : $sugar",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            );
          },
        ),
      ),
    );
  }
  _fetch() async
  {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var firebaseUser = FirebaseAuth.instance.currentUser;
    if(firebaseUser!=null)
      {
        firebaseFirestore
        .collection("Patient")
            .doc(firebaseUser.uid)
            .get().then((value){
              firstName = value.data()!['firstName'].toString();
              secondName = value.data()!['secondName'].toString();
              email = value.data()!['email'].toString();
              bloodg = value.data()!['BloodGroup'].toString();
              bloodp = value.data()!['BloodPressure'].toString();
              sugar = value.data()!['SugarLevel'].toString();
              Text(
                  "First Name: $firstName \n"
                      "Last Name : $secondName\n"
                      "Email : $email \n"
                      "Blood Group : $bloodg \n"
                      "Blood Pressure : $bloodp \n"
                      "Sugar Level : $sugar",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              );
        }).catchError((e)
        {
          print(e);
        });

      }
  }

  /*
  Center(child:building(context),);
  late FirebaseFirestore firebaseFirestore;
  var firebaseUser = FirebaseAuth.instance.currentUser;
  Widget building(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Patient')
            .doc(firebaseUser?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text("Loading");
          } else {
            Map<String, dynamic> documentFields = snapshot.data?.data as Map<String, dynamic>;
            return Text(documentFields["firstName"] +
                " " +
                documentFields["secondName"]);
          }
        });
  }*/
}
