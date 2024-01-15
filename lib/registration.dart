import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class myregistration extends StatefulWidget {
  const myregistration({super.key});

  @override
  State<myregistration> createState() => _myregistrationState();
}

class _myregistrationState extends State<myregistration> {
  bool passChk = true;
  bool mailChk = true;
  final mailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/register.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 100),
              child: Text(
                'New here? Sign up!',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.35,
                  right: 35,
                  left: 35),
              child: Column(children: [
                TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: 'Name',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: mailController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: 'Email',
                      errorText: mailChk ? null : 'Invalid email!',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: 'Password',
                      errorText: passChk
                          ? null
                          : 'Password must be of atleast 8 characters!',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sign in',
                        style: TextStyle(fontSize: 27, color: Colors.white)),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                      child: IconButton(
                        color: Colors.white,
                        onPressed: () {
                          if (_validate()) {
                            print('Success');
                          } else {
                            print('Invalid entry');
                          }
                        },
                        icon: Icon(Icons.arrow_forward),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'have an Account? Log in',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Color.fromARGB(255, 243, 243, 243)),
                        )),
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    );
  }

  _validate() {
    setState(() {
      passChk = passwordController.text.length >= 8 ? true : false;
      mailChk = EmailValidator.validate(mailController.text);
    });
    return (passChk && mailChk);
  }
}
