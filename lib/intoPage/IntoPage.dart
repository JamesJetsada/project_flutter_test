import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/LoginPage/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntoPage extends StatefulWidget {
  IntoPage({Key? key}) : super(key: key);

  @override
  State<IntoPage> createState() => _IntoPageState();
}

class _IntoPageState extends State<IntoPage> {
  final controller = PageController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: Container(
          child: PageView(
            controller: controller,
            children: [
              Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'สวัสดีครับผมชื่อเจมส์นะครับ',
                        style: GoogleFonts.prompt(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'เป็นน้องที่มาทดสอบเพื่อเข้าทำงานกับพวกพี่ๆ',
                        style: GoogleFonts.prompt(
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'อาจจะออกแบบไม่สวย',
                        style: GoogleFonts.prompt(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ขออภัยมา ณ ที่นี้ด้วยนะครับ',
                        style: GoogleFonts.prompt(
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'หากโปรเจคนี้ผิดพลาดประการใด',
                        style: GoogleFonts.prompt(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ขออภัยมา ณ ที่นี้ด้วยนะครับขอบคุณครับ',
                        style: GoogleFonts.prompt(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            SharedPreferences preferences = await SharedPreferences.getInstance();
                            // preferences.setString('intostatus', 'pass');
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                                (route) => false);
                          },
                          child: Text("เริ่มต้นใช้งาน",
                              style: GoogleFonts.prompt(
                                  fontSize: 15, fontWeight: FontWeight.bold)))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
          padding: EdgeInsets.symmetric(horizontal: 0),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: WormEffect(
                    dotHeight: 16,
                    dotWidth: 16,
                    type: WormType.thin,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
