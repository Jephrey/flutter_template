import 'package:flutter/material.dart';
import 'package:flutter_template/pages/pages.dart';
import 'package:get/get.dart';

// An example homepage with an AppBar with 2 icons and a button to go to another page.
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Template'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          child: TextButton(
            child: Text("Go to Second Page"),
            onPressed: () {
              Get.toNamed(Pages.secondPage);
            },
          ),
        ),
      ),
    );
  }
}
