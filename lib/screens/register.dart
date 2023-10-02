import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:csi_library/components/My_Textfield.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  @override
  final emailController = TextEditingController();
  final passController = TextEditingController();
  Widget build(BuildContext context) {
    bool isObscured = true;
    bool isVis = true;
    String email = '';
    String pass = '';
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade800,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontFamily: 'Dmserif',
                      ),
                    ),
                    Text(
                      'Register Here',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Dmserif',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: MyTextField(
              controller: emailController,
              obscureText: false,
              textHint: 'Email',
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.11),
                  blurRadius: 40,
                  spreadRadius: 0,
                ),
              ]),
              child: TextField(
                onChanged: (value) {
                  pass = value;
                },
                obscureText: isObscured,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: EdgeInsets.all(20),
                  prefixIconConstraints: BoxConstraints(minWidth: 50),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blue.shade800),
                ),
                onPressed: () async {
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: email,
                      password: pass,
                    );
                    Navigator.pushNamed(context, 'home');
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Center(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Dmserif',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey.shade400,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text('Or continue with'),
                ),
                Expanded(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 130, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade500),
            ),
            child: TextButton(
              onPressed: () {},
              child: Image.asset(
                'images/googleimage.png',
                height: 50,
                width: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
