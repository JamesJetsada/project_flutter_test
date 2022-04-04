import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<Null> dialog(BuildContext context, String message) async {
  await showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.30),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: CupertinoAlertDialog(
              // shape:OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      message,
                      style: GoogleFonts.prompt(fontSize: 16),
                    ),
                  ]),
              content: Container(
                // width: 300,
                // height: 50,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            return null;
                          },
                          child: Text(
                            "ตกลง",
                            style: GoogleFonts.prompt(
                                color: Colors.blue, fontSize: 15),
                          )),
                    ]),
              ),
            ),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return AlertDialog();
      });
}
bool? conf;
Future<bool> dialog_conf(BuildContext context, String message) async {
  await showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.30),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: CupertinoAlertDialog(
              // shape:OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      message,
                      style: GoogleFonts.prompt(fontSize: 16),
                    ),
                  ]),
              content: Container(
                // width: 300,
                // height: 50,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            conf = true;
                          },
                          child: Text(
                            "ตกลง",
                            style: GoogleFonts.prompt(
                                color: Colors.blue, fontSize: 15),
                          )),
                       TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            conf= false;
                          },
                          child: Text(
                            "ยกเลิก",
                            style: GoogleFonts.prompt(
                                color: Colors.blue, fontSize: 15),
                          )),
                    ]),
              ),
            ),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return AlertDialog();
      });
      return conf!;
}

String? select='ยกเลิก';
Future<String> dialog_select(BuildContext context, String message) async {
  await showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.30),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: CupertinoAlertDialog(
              // shape:OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      message,
                      style: GoogleFonts.prompt(fontSize: 20),
                    ),
                  ]),
              content: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            select = "แก้ไข";
                          },
                          child: Text(
                            "แก้ไข",
                            style: GoogleFonts.prompt(
                                color: Colors.amber, fontSize: 15),
                          )),
                          TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            select = "ลบ";
                          },
                          child: Text(
                            "ลบ",
                            style: GoogleFonts.prompt(
                                color: Colors.red, fontSize: 15),
                          )),
                          Container(width: MediaQuery.of(context).size.width*0.5,height: 2,color: Colors.black,),
                       TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            select = "ยกเลิก";
                          },
                          child: Text(
                            "ยกเลิก",
                            style: GoogleFonts.prompt(
                                color: Colors.black, fontSize: 15),
                          )),
                    ]),
              ),
            ),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: false,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return AlertDialog();
      });
      return select!;
}
Future<Null> dialog_route(BuildContext context, String message,MaterialPageRoute route) async {
  await showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.30),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: CupertinoAlertDialog(
              // shape:OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      message,
                      style: GoogleFonts.prompt(fontSize: 16),
                    ),
                  ]),
              content: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(context, route, (route) => false);
                          },
                          child: Text(
                            "ตกลง",
                            style: GoogleFonts.prompt(
                                color: Colors.blue, fontSize: 15),
                          )),
                    ]),
              ),
            ),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: false,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return AlertDialog();
      });
}