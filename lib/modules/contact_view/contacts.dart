import 'package:flutter/material.dart';

import '../../models/user_model/model.dart';
import '../../shared/components/constants.dart';
import '../add_contact/add_contact.dart';
import '../edit_contact/edit_contact.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

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
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddContact()));
                });
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildUserItem(users[index]),
          separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsetsDirectional.only(start: 20.0, end: 20),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
          itemCount: users.length),
    );
  }

  Widget buildUserItem(UserModel user) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  child: Text(
                    "${user.id}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${user.name}",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "${user.Phone}",
                        style: TextStyle(color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),


              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              height: 1,
              color: Colors.grey[300],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(child: SizedBox()),
                IconButton(
                    onPressed: () {
                      UrlLauncher.launch("tel:${user.Phone}");
                    },
                    icon: Icon(Icons.call)),
                Expanded(child: SizedBox()),

                IconButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditContact(user.id)));
                      });
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.green,
                    )),
                Expanded(child: SizedBox()),
                IconButton(
                    onPressed: () {
                      setState(() {
                        int i = 0;
                        while (users[i].id != user.id) {
                          i++;
                        }
                        users.removeAt(i);
                        while (i < users.length) {
                          users[i].id--;
                          i++;
                        }

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => UserScreen()));
                      });
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
                Expanded(child: SizedBox()),
              ],
            )
          ],
        ),
      );
}
