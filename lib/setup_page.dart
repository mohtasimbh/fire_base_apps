import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _dateOfBirthController = TextEditingController();
  TextEditingController _relationshipController = TextEditingController();
  //bool _isObsecure = true;


  Register(){
    FirebaseFirestore.instance.collection('Users').add({
      'first_name' : _firstNameController.text,
      'last_name' : _lastNameController.text,
      'dob' : _dateOfBirthController.text,
      'relation' : _relationshipController.text,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up Page"),
      ),

      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 30,),



                TextFormField(
                  controller: _firstNameController,

                  validator: (value){
                    if (value!.isEmpty) {
                      return "Required";
                    }
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'First name',
                    labelStyle: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),
                    hintText: 'First name',
                    //icon: Icon(Icons.star),
                    prefixIcon: Icon(Icons.abc),
                  ),
                ),


                SizedBox(height : 20,),
                TextFormField(
                  controller: _lastNameController,

                  validator: (value){
                    if (value!.isEmpty) {
                      return "Required";
                    }
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Second name',
                    labelStyle: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),
                    hintText: 'Second name',
                    //icon: Icon(Icons.star),
                    prefixIcon: Icon(Icons.abc),
                  ),
                ),


                SizedBox(height : 20,),
                TextFormField(
                  controller: _dateOfBirthController,

                  validator: (value){
                    if (value!.isEmpty) {
                      return "Required";
                    }
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Date of birth',
                    labelStyle: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),
                    hintText: 'Date of birth',
                    //icon: Icon(Icons.star),
                    prefixIcon: Icon(Icons.abc),
                  ),
                ),


                SizedBox(height : 20,),
                TextFormField(
                  controller: _relationshipController,

                  validator: (value){
                    if (value!.isEmpty) {
                      return "Required";
                    }
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Relationship Status',
                    labelStyle: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),
                    hintText: 'Relationship Status',
                    prefixIcon: Icon(Icons.abc),
                  ),
                ),






                SizedBox(
                  height: 16,
                ),

                RaisedButton(
                    child: Text("Save"),
                    onPressed: (){
                      if (_formKey.currentState!.validate()) {
                        //SignUp();
                        Register();
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>HomePage()));
                        //print("Successful");
                      } else {
                        print("Something wrong");
                      }

                    }

                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
