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


            Container(
              width: double.infinity,
              color: Colors.blue,
              child: MaterialButton(
                height: 70,
                onPressed: () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UserScreen()));
                  });
                },
                child: Text(
                  "Start App",
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
