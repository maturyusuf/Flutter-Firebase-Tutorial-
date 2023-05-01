

class MyUser {

  final String firstName;
  final String lastName;
  final String uid;
  


  MyUser({

    required this.firstName,
    required this.lastName,
    required this.uid,

  });
}
class UserCredentials{
  final String uid;

  UserCredentials({
    required this.uid,
  });
}