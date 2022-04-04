import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/customer/customerPage.dart';
import 'package:project/dialog/dialog.dart';
import 'package:project/dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class addCustomerPage extends StatefulWidget {
  addCustomerPage({Key? key}) : super(key: key);

  @override
  State<addCustomerPage> createState() => _addCustomerPageState();
}

class _addCustomerPageState extends State<addCustomerPage> {
  String? name = '';
  String? phone = '';
  String? email = '';
  String? id = '';
  bool? emailvalidate;
   bool? loadingbtn = true;
  @override
  void initState() {
    super.initState();
    getId();
  }

  getId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    id = preferences.getString('id');
  }

  insertData() async {
    setState(() {
      loadingbtn = false;
    });
    if (name != '' && phone != '' && email != '' && id != '') {
      if (phone?.length != 10) {
        dialog(context, 'กรุณากรอกเบอร์โทรให้ถูกต้อง');
      } else {
        emailvalidate = EmailValidator.validate(email!);
        if (emailvalidate == false) {
          dialog(context, 'กรุณากรอกอีเมล์ให้ถูกต้อง');
        } else {
          var params = {
            "isAdd": "true",
            "name": name,
            "email": email,
            "phone": phone,
            "user_id": id,
          };
          await post(context, "insertcustomer.php", params).then((value) {
            MaterialPageRoute route =
                MaterialPageRoute(builder: (context) => customerPage());
            dialog_route(context, "เพิ่มข้อมูลเรียบร้อย", route);
          });
        }
      }
    } else {
      dialog(context, 'กรุณากรอกข้อมูลให้ครบถ้วน');
    }
     setState(() {
      loadingbtn = true;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'เพิ่มลูกค้า',
          style: GoogleFonts.prompt(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => customerPage()),
                  (route) => false);
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
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                child: TextFormField(
                  maxLength: 100,
                  style: GoogleFonts.prompt(),
                  decoration: InputDecoration(
                    suffixStyle:
                        GoogleFonts.prompt(fontSize: 15, color: Colors.grey),
                    counterText: "",
                    labelText: "ชื่อ",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelStyle: GoogleFonts.prompt(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                child: TextFormField(
                  maxLength: 10,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: GoogleFonts.prompt(),
                  decoration: InputDecoration(
                    suffixText: '${phone.toString().length}/10',
                    suffixStyle:
                        GoogleFonts.prompt(fontSize: 15, color: Colors.grey),
                    counterText: "",
                    labelText: "เบอร์โทรศัพท์",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelStyle: GoogleFonts.prompt(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) {
                    phone = value;
                    setState(() {});
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                child: TextFormField(
                  maxLength: 100,
                  style: GoogleFonts.prompt(),
                  decoration: InputDecoration(
                    suffixStyle:
                        GoogleFonts.prompt(fontSize: 15, color: Colors.grey),
                    counterText: "",
                    labelText: "อีเมล์",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    labelStyle: GoogleFonts.prompt(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.grey,
                    ),
                  ),
                  onChanged: (value) {
                    email = value;
                    setState(() {});
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                      onPressed: loadingbtn == false ? null : () {
                        insertData();
                      },
                      child: Text(
                        'เพิ่มข้อมูล',
                        style: GoogleFonts.prompt(),
                      ))),

              // SizedBox(
              //   width: 10,
              // ),
              // Container(
              //     width: MediaQuery.of(context).size.width * 0.3,
              //     child: ElevatedButton(
              //         onPressed: () {}, child: Text('กลับ'))),
            ],
          ),
        ],
      ),
    );
  }
}
