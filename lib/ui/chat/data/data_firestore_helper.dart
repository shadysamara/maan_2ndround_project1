import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maan1/ui/auth/models/user_models.dart';

class DataFirestoreHelper {
  DataFirestoreHelper._();
  static DataFirestoreHelper dataFirestoreHelper = DataFirestoreHelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<List<UserModel>> getAllUsers() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection('Users').get();
    List<UserModel> users =
        querySnapshot.docs.map((e) => UserModel.fromMap(e.data())).toList();
    print(users.length);
    return users;
  }
}
