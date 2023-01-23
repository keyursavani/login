import 'package:flutter/material.dart';
import 'package:login/login_new.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginInfo extends StatefulWidget {
  const LoginInfo({super.key});

  @override
  _LoginInfoState createState() => _LoginInfoState();
}
class _LoginInfoState extends State<LoginInfo> {
   SharedPreferences? logindata;
      String? username = "";
  @override
  void initState() {
    super.initState();
    initial();
  }
  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata?.getString('username');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preference "),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Welcome To flutter  $username',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),

            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: Colors.blue,
              onPressed: () {
                logindata?.setBool('login', true);
                Navigator.pushReplacement(context,
                     MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}