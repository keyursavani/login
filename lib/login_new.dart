import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'details_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {

  final username_controller = TextEditingController();
  final password_controller = TextEditingController();

   SharedPreferences? logindata;
  late bool newuser;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }
  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata?.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context,  MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }
  @override
  void dispose() {
    username_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              "Login Form",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: username_controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: password_controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),

            MaterialButton(
              color: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),


              onPressed: () {
                String username = username_controller.text;
                String password = password_controller.text;
               if (username != '' && password != '') {
                 print('Successfull');
                 logindata?.setBool('login', false);
                 logindata?.setString('username', username);
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginInfo()));
               }
               },
              child: Text("LOGIN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
            )

          ],
        ),
      ),
    );
  }
}