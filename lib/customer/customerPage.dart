import 'package:flutter/material.dart';

class customerPage extends StatefulWidget {
  customerPage({Key? key}) : super(key: key);

  @override
  State<customerPage> createState() => _customerPageState();
}

class _customerPageState extends State<customerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Container(child: Text('customer page'))),
    );
  }
}
