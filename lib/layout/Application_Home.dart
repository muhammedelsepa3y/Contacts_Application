import 'dart:async';

import 'package:flutter/material.dart';

import '../modules/contact_view/contacts.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 5),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => UserScreen())));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("ii.png",height: 150,width: 150,),
                  SizedBox(height: 45,),
                  Text("Contacts",style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900
                  ),),

                ],),
            ),





          ],
        ),
      ),
    );
  }
}
