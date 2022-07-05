import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class KurdishNamesList extends StatelessWidget {
  const KurdishNamesList({Key? key}) : super(key: key);

//TODO: create the datamodel

//TODO: create  a class for the kurdish names service

//TODO: create a method to get the list of kurdish names

//TODO: render the list of users to the screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('title '),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              // child: ,
            ),
          )
        ],
      ),
    );
  }
}
