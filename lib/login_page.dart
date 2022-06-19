import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/registration_page.dart';
import 'package:flutter_firebase/setup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _isObsecure = true;

  FirebaseAuth? firebaseAuth;

  SignIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 50, left: 8, right: 8, bottom: 8),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.android,size: 100,color: Colors.black54,),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "CISCO",
                  style: TextStyle(
                      fontSize: 20, color: Colors.amber, letterSpacing: 5),
                ),
                SizedBox(
                  height: 35,
                ),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (!value!.contains("@")) {
                      return "Invalid Email";
                    } else if (!value.contains("com")) {
                      return "Invalid Email";
                    }
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white60,
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w600),
                    hintText: 'Email',
                    //icon: Icon(Icons.star),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.blue,
                    ),
                    suffixIcon: Icon(
                      Icons.alternate_email,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _isObsecure,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password Required";
                    }

                    if (value.length > 15) {
                      return "Password is too long";
                    }

                    if (value.length < 3) {
                      return "Password is too short";
                    }
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white60,
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w600),
                    hintText: 'Password',
                    //icon: Icon(Icons.star),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.blue,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObsecure = !_isObsecure;
                        });
                      },
                      icon: Icon(_isObsecure == true
                          ? Icons.visibility_off
                          : Icons.visibility),
                      color: Colors.blue,
                    ),
                    //prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton.icon(
                  onPressed: () {
                    print('Login Button Clicked.');
                    if (_formKey.currentState!.validate()) {
                      //print("Successful");
                      SignIn();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    } else {
                      print("Something wrong");
                    }

                    //Navigator.push(context, MaterialPageRoute(builder: (context) =>NavigationDrawer()));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  label: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 50, top: 10, bottom: 10),
                    child: Text('Login',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            letterSpacing: 5)),
                  ),
                  icon: Padding(
                    padding: const EdgeInsets.only(
                        left: 50, right: 10, top: 10, bottom: 10),
                    child: Icon(
                      Icons.login_rounded,
                      color: Colors.white,
                    ),
                  ),
                  textColor: Colors.white,
                  splashColor: Colors.red,
                  color: Colors.lightBlue,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                      fontSize: 10, color: Colors.blue, letterSpacing: 5),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have Account?",
                      style: TextStyle(color: Colors.blue),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationPage()));
                      },
                      child: Text("Sign Up",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,fontWeight: FontWeight.w500,
                              letterSpacing: 2)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
