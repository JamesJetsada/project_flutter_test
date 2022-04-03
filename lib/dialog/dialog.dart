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
