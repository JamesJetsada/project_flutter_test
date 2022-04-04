import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/LandingPage/landingPage.dart';
import 'package:project/LoginPage/loginPage.dart';
import 'package:project/intoPage/IntoPage.dart';
import 'package:project/provider/userProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loadingpage extends StatefulWidget {
  const loadingpage({Key? key}) : super(key: key);

  @override
  State<loadingpage> createState() => _loadingpageState();
}

class _loadingpageState extends State<loadingpage>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  String? username;
  String? intostatus;
  String? email;
  String? phone;
  String? id;
  String? name;
  // Consumer<UsersProvider>? userprovider;
  UsersProvider usersProvider = UsersProvider();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkCredential();
  }

  dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<Null> _checkCredential() async {
    await Future.delayed(Duration(milliseconds: 5000), () async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      username = preferences.getString('username');
      intostatus = preferences.getString('intostatus');
      email = preferences.getString('email');
      phone = preferences.getString('phone');
      name = preferences.getString('name');
      id = preferences.getString('id');


      print(username);
      print(intostatus);
      print(email);
      print(phone);
      print(name);
      print(id);
      if (intostatus == null) {
        Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 900),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secanimation,
                  Widget child) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                  alignment: Alignment.center,
                );
              },
              pageBuilder: (
                BuildContext context,
                Animation<double> animation,
                Animation<double> secanimation,
              ) {
                return IntoPage();
              }),
          (route) => false,
        );
      } else {
        print('check username');
        print(email);
        if (email == null) {
          Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 900),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secanimation,
                    Widget child) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                    alignment: Alignment.center,
                  );
                },
                pageBuilder: (
                  BuildContext context,
                  Animation<double> animation,
                  Animation<double> secanimation,
                ) {
                  return LoginPage();
                }),
            (route) => false,
          );
        } else {
          Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 900),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secanimation,
                    Widget child) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                    alignment: Alignment.center,
                  );
                },
                pageBuilder: (
                  BuildContext context,
                  Animation<double> animation,
                  Animation<double> secanimation,
                ) {
                  return LandingPage();
                }),
            (route) => false,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromRGBO(41, 41, 41, 1),
      body: Container(
        color: Color.fromRGBO(41, 41, 41, 1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.25),
              FadeTransition(
                  opacity: _animation,
                  child: Container(
                      height: 250,
                      child: Text(
                        'Loading . . .',
                        style: GoogleFonts.oswald(
                            fontSize: 20, color: Colors.white),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
