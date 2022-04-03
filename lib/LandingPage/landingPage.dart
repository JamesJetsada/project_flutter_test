import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final tab = TabBar(tabs: <Tab>[
    //   Tab(icon: Icon(Icons.arrow_forward)),
    //   Tab(icon: Icon(Icons.arrow_downward)),
    //   Tab(icon: Icon(Icons.arrow_back)),
    // ]);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'หน้าแรก',
            style: GoogleFonts.prompt(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ))
          ],
        ),
        body: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('จัดการลูกค้า',
                            style: GoogleFonts.prompt(fontSize: 15)),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 15,
                          color: Colors.white,
                        )
                      ],
                    ))),
          ],
        )));
  }
}
