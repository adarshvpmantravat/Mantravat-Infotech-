import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  //user Collection References
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('User');

  Future updateUserData(String email, String password) async {
    return await userCollection
        .doc(uid)
        .set({'Email': email, 'Password': password});
  }
}
