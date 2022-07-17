import 'package:flutter/material.dart';

import '../../models/user_model/model.dart';
import '../../shared/components/constants.dart';
import '../add_contact/add_contact.dart';
import '../edit_contact/edit_contact.dart';

class UserScreen extends StatefulWidget {


  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            'Contacts',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),
        ),
        actions: [
          IconButton(onPressed: (){
setState(() {
  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddContact()));
});
          }, icon: Icon(Icons.add))
        ],
      ),
      body: ListView.separated(itemBuilder: (context,index)=>buildUserItem(users[index]), separatorBuilder: (context,index)=>
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 20.0,end:20),
            child: Container(width: double.infinity,height: 1,color: Colors.grey[300],),
          )
          , itemCount: users.length),
    );
  }

  Widget buildUserItem(UserModel user)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25,
          child: Text(
            "${user.id}",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25
          ),
          ),


        ),
        SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${user.name}",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25
            ),
            ),
            Text(
              "${user.Phone}",style: TextStyle(
                color: Colors.grey
            ),
            ),
          ],
        ),
        Expanded(child: SizedBox()),
        IconButton(onPressed: (){
          setState(() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>EditContact(user.id)));
          });
        }, icon: Icon(Icons.edit,color: Colors.green,)),
        SizedBox(width: 20,),
        IconButton(onPressed: (){
          setState(() {
            int i=0;
            while(users[i].id!=user.id){
              i++;
            }
            users.removeAt(i);
            while(i<users.length){
              users[i].id--;
              i++;
            }

            Navigator.push(context,MaterialPageRoute(builder: (context)=>UserScreen()));
          });
        }, icon: Icon(Icons.delete,color: Colors.red,))
      ],
    ),
  );
}
