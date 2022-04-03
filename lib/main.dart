import 'package:flutter/material.dart';
import 'package:project/loadingPage.dart';
import 'package:project/provider/userProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UsersProvider>(create: (_)=> UsersProvider()),
      ],
      // create: (_) => UsersProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App For Test Job',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return loadingpage();
  }
}
