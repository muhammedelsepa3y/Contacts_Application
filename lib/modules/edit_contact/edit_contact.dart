import 'package:contacts/models/user_model/model.dart';
import 'package:flutter/material.dart';

import '../../shared/components/constants.dart';
import '../contact_view/contacts.dart';

class EditContact extends StatefulWidget {

  int idd;
  EditContact(this.idd, {Key? key}) : super(key: key) ;

  @override
  // ignore: no_logic_in_create_state
  State<EditContact> createState() => _EditContactState(idd);
}

class _EditContactState extends State<EditContact> {
  int idd;
  String? c;
  String? c2;
  _EditContactState(this.idd){
    c=users[idd-1].name;
    c2=users[idd-1].Phone;


  }
  void initState() {
    // TODO: implement initState
    super.initState();
    // Step 2 <- SEE HERE
    NameController.text = '${users[idd-1].name}';
    PhoneController.text = '${users[idd-1].Phone}';
  }
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
          'Edit Contact',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30
          ),
        ),
        actions: [
          TextButton(onPressed: (){
            setState(() {
              int i=0;
              while(users[i].id!=idd){
                i++;
              }
              users[i].Phone=PhoneController.text;
              users[i].name=NameController.text;

              Navigator.push(context,MaterialPageRoute(builder: (context)=>UserScreen()));
            });
            }
          , child: Text("Save",style:
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
                  "${idd}",style: TextStyle(
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
