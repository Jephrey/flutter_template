import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Template Second Page'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Text('This is page 2'),
        ),
      ),
    );
  }
}
