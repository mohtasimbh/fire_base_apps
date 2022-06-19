import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/login_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  GlobalKey<FormState> _formKey = GlobalKey();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _isObsecure = true;

  FirebaseAuth? firebaseAuth;

  Future SignUp() async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print("Your Password is Weak");
      } else if (e.code == 'email-already-in-use') {
        print("Your Email is already exist");
      }
    } catch (e) {
      print(e);
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.android,size: 100,color: Colors.black54,),
                SizedBox(
                  height: 20,
                ),
                Text("Sign Up Page",
                    style: TextStyle(
                        fontSize: 10, color: Colors.amber, letterSpacing: 5)),
                SizedBox(
                  height: 35,
                ),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required";
                    } else if (!value!.contains("@")) {
                      return "Invalid Email";
                    } else if (!value.contains("com")) {
                      return "Invalid Email";
                    }
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w600),
                    hintText: 'Email',
                    //icon: Icon(Icons.star),
                    prefixIcon: Icon(Icons.email),
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
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w600),
                    hintText: 'Password',
                    //icon: Icon(Icons.star),
                    prefixIcon: Icon(Icons.lock),
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
                  height: 20,
                ),
                TextFormField(
                  controller: _confirmPasswordController,
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
                    if (_passwordController.value ==
                        _confirmPasswordController.value) {
                      print("Password Match");
                      //return Text("Password Match");
                    } else {
                      print("Password not Match");
                      return "Password not Match";
                    }
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w600),
                    hintText: 'Confirm Password',
                    //icon: Icon(Icons.star),
                    prefixIcon: Icon(Icons.lock),
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
                    print('Sign Up Button Clicked.');
                    if (_formKey.currentState!.validate()) {
                      SignUp();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                      //print("Successful");
                    } else {
                      print("Something wrong");
                    }
                    //settingData();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  label: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 50, top: 10, bottom: 10),
                    child: Text(
                      'Sign Up',
                    ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have Account?",
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
                                  builder: (context) => LoginPage()));
                        },
                        child: Text("Login",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                letterSpacing: 2,fontWeight: FontWeight.w600))),
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
