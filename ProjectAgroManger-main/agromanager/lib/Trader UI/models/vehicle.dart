
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class VehicleRegistration extends StatefulWidget {
  const VehicleRegistration({Key? key}) : super(key: key);

  @override
  _VehicleRegistrationState createState() => _VehicleRegistrationState();
}

class _VehicleRegistrationState extends State<VehicleRegistration> {

  // string for displaying the error Message


  // our form key
  final _formKey = GlobalKey<FormState>();

  // editing Controller
  final nameEditingController = TextEditingController();
  final categoryEditingController = TextEditingController();
  final priceEditingController = TextEditingController();
  final sizeEditingController = TextEditingController();
  final descriptionEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //first name field
    final nameField = TextFormField(
        autofocus: false,
        controller: nameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return (" Vehicle Number cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Vehicle Number(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          nameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Vehicle Number ",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //second name field
    final categoryField = TextFormField(
        autofocus: false,
        controller: categoryEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Category Cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          categoryEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Category",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //email field
    final descriptionField = TextFormField(
        autofocus: false,
        controller: descriptionEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return (" Description of Vehicle Cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          descriptionEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Description Of Vehicle",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final pricefield = TextFormField(
        autofocus: false,
        keyboardType: TextInputType.number,
        controller: priceEditingController,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Price Of Vehicle cannot be Empty");
          }
        },
        onSaved: (value) {
          priceEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Price ",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //confirm password field
    final sizeField = TextFormField(
        autofocus: false,
        controller: sizeEditingController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Size of Vehicle Cannot be Empty";
          }
          return null;
        },
        onSaved: (value) {
          sizeEditingController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Size  of Vehicle",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //signup button
    final listButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: const Color(0xFF81C784),
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery
              .of(context)
              .size
              .width,
          onPressed: () {},
          child: const Text(
            "Create",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 45),
                    nameField,
                    const SizedBox(height: 20),
                    categoryField,
                    const SizedBox(height: 20),
                    pricefield,
                    const SizedBox(height: 20),
                    sizeField,
                    const SizedBox(height: 20),
                    descriptionField,
                    const SizedBox(height: 20),
                    listButton,
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
