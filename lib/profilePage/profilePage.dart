import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/LandingPage/landingPage.dart';
import 'package:project/LoginPage/loginPage.dart';
import 'package:project/dialog/dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profilePage extends StatefulWidget {
  String? name;
  String? phone;
  String? email;
  profilePage({Key? key, this.name, this.phone, this.email}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.email);
    print(widget.name);
    print(widget.phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ข้อมูลผู้ใช้',
          style: GoogleFonts.prompt(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LandingPage()), (route) => false);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Card(
                  elevation: 15,
                  shadowColor: Colors.black,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 50,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(widget.name!),
                                Text(widget.phone!),
                                Text(widget.email!),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  dialog_conf(context, 'คุณต้องการออกจากระบบใช่หรือไม่').then((value) async{
                    print(value);
                    if (value == true) {
                      SharedPreferences preferences = await SharedPreferences.getInstance();
                      preferences.clear();
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoginPage()), (route) => false);
                    }
                  });
                  // dialog(context, message);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Card(
                    elevation: 15,
                    shadowColor: Colors.black,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('ออกจากระบบ'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

    );
  }
}
