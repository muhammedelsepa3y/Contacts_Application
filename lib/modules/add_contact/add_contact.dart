import 'package:contacts/models/user_model/model.dart';
import 'package:flutter/material.dart';

import '../../shared/components/constants.dart';
import '../contact_view/contacts.dart';

class AddContact extends StatefulWidget {

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  var NameController=TextEditingController();

  var PhoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
          Navigator.pop(context);
        },),
        centerTitle: true,
        title: Text(
          'Add Contact',
            style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30
        ),
        ),
        actions: [
          TextButton(onPressed: (){
            setState(() {
              users.add(UserModel(users.length+1,NameController.text,PhoneController.text));
              Navigator.push(context,MaterialPageRoute(builder: (context)=>UserScreen()));
            });
          }, child: Text("Save",style:
            TextStyle(
              color: Colors.white,
              fontSize: 15
            ),))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            CircleAvatar(
            radius: 40,
            child: Text(
              "${users.length+1}",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35
            ),
            ),


          ),
              SizedBox(height: 50,),
              TextFormField(
                controller: NameController,
                obscureText: false,

                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.contact_page_rounded),


                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: PhoneController,
                obscureText: false,

                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Phone",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),


                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
