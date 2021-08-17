import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maan1/ui/auth/models/register_request.dart';
import 'package:maan1/ui/auth/models/user_models.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  saveUserInFirestore(RegisterRequest registerRequest) async {
    firestore
        .collection('Users')
        .doc(registerRequest.id)
        .set(registerRequest.toMap());
  }

  Future<UserModel> getUserFromFirestore(String userId) async {
    DocumentSnapshot<Map<String, dynamic>> document =
        await firestore.collection('Users').doc(userId).get();
    Map<String, dynamic> map = document.data();
    print(map);
    UserModel userModel = UserModel.fromMap(map);
    print(userModel.toMap());
    return userModel;
  }

  updateUserFromFirestore(UserModel userModel) async {
    firestore.collection('Users').doc(userModel.id).update(userModel.toMap());
  }

  Future<List<UserModel>> getAllUsers() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection('Users').get();
    List<UserModel> usersList =
        querySnapshot.docs.map((e) => UserModel.fromMap(e.data())).toList();
    return usersList;
  }
}
// A failure occurred while executing com.android.build.gradle.internal.tasks.Workers$ActionFacade
//    > com.android.builder.dexing.DexArchiveMergerException: Error while merging dex archives: 
//      The number of method references in a .dex file cannot exceed 64K.
//      Learn how to resolve this issue at https://developer.android.com/tools/building/multidex.html
