import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/services/authentication.dart';
import 'package:firebase_project/services/database.dart';
import 'package:firebase_project/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class Members extends StatelessWidget {
  const Members({super.key, });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Members"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {

              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: StreamProvider<List<MyUser>>.value(
        value: DataBase().members,
        initialData: [],
        child: MemberList(),
      ),
    );
  }
}

class MemberList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final members = Provider.of<List<MyUser>>(context); // parent widget must be a provider.value widget

    return ListView.builder(
      itemCount: members.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(members[index].firstName),
          subtitle: Text(members[index].lastName),
        );
      },
    );
  }
}