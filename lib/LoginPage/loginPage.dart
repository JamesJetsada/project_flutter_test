import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/LandingPage/landingPage.dart';
import 'package:project/dialog/dialog.dart';
import 'package:project/dio/dio.dart';
import 'package:project/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  String? username;
  String? password;
  bool loginpass = true;
  Loginmodel? loginmodel;

  checklogin() async {
    setState(() {
      loginpass = false;
    });
    var params = {
      'isAdd': 'true',
      'username': username,
      'password': password,
    };
    var data = await post(context, 'login.php', params).then((data) async {
      print(data);
      if (data == null) {
        dialog(context, 'ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง');
      } else {
        for (var item in data) {
          loginmodel = Loginmodel.fromJson(item);
        }
        print(loginmodel?.name);
        print(loginmodel?.phone);
        dialog(context, 'เข้าได้');
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('name', loginmodel!.name.toString());
        preferences.setString('phone', loginmodel!.phone.toString());
        preferences.setString('email', loginmodel!.email.toString());
        preferences.setString('id', loginmodel!.id.toString());
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LandingPage()),
            (route) => false);
      }
    });

    setState(() {
      loginpass = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(color: Color.fromARGB(255, 126, 122, 122)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.blue,
                              Colors.red,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(width: 2, color: Colors.white)),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 150,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'เข้าสู่ระบบ',
                    style: GoogleFonts.prompt(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      // height: 60,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(156, 109, 108, 108),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.visiblePassword,
                        autofocus: false,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Colors.white70,
                              width: 2,
                            ),
                          ),
                          labelText: 'ชื่อผู้ใช้',
                          labelStyle: GoogleFonts.prompt(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          // suffixIcon: Icon(Icons.people)
                        ),
                        onChanged: (value) => setState(() => username = value),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    // height: 60,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(156, 109, 108, 108),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      obscureText: _isObscure,
                      keyboardType: TextInputType.visiblePassword,
                      autofocus: false,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.white70,
                            width: 2,
                          ),
                        ),
                        labelText: 'รหัสผ่าน',
                        labelStyle: GoogleFonts.prompt(
                            color: Colors.white, fontSize: 15),
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white70,
                            ),
                            borderRadius: BorderRadius.circular(30.0)),
                        suffixIcon: IconButton(
                            icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }),
                      ),
                      onChanged: (value) => setState(() => password = value),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: loginpass == false
                            ? null
                            : () {
                                checklogin();
                              },
                        child: Container(
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 0, 0, 0)
                                        .withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                // boxShadow: BoxShadow(),
                                borderRadius: BorderRadius.circular(30),
                                color: Color.fromARGB(255, 255, 255, 255)),
                            child: Center(
                              child: loginpass == false
                                  ? CircularProgressIndicator()
                                  : Text('เข้าสู่ระบบ',
                                      style: GoogleFonts.prompt(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                            )),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text('ลืมรหัสผ่าน ?',
                              style: GoogleFonts.prompt(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 0, 0),
                                  fontSize: 15)))
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
