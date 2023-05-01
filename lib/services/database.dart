import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/usermodel.dart';

class DataBase {
  final String? uid;
  DataBase({this.uid});

  final CollectionReference memberCollection =
      FirebaseFirestore.instance.collection("members");

  Future<void> updateUserData(String firstName, String lastName) {
    return memberCollection.doc(uid).set(
      {
        "firstName": firstName,
        "lastName": lastName,
      },
    );
  }

  List<MyUser> _memberListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return MyUser(
        firstName: doc.get("firstName"),
        lastName: doc.get("lastName"),
        uid: "", // Cast uid as String
      );
    }).toList();
  }

  Stream<List<MyUser>> get members {
    return memberCollection.snapshots().map(_memberListFromSnapshot);
  }
}
