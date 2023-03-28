import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pendataan/controllers/superadmin/superadmin_cubit.dart';
import 'package:pendataan/models/user_model.dart';

// Future<List<UserModel>>
Future<List<UserModel>> getAllAdmin() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<UserModel> user = [];
  try {
    var dataAdmin = await firestore
        .collection("users")
        .where('role', isEqualTo: 'Admin')
        .get();

    user = dataAdmin.docs.map((e) => UserModel.fromJson(e.data())).toList();

    return user;
  } catch (erorr) {
    SuperadminFailure(erorr.toString());
  }
  return [];
}

Future<String> createAdmin({
  required String email,
  required String password,
}) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var databaseUser = firestore.collection('users').doc(email);
  try {
    await databaseUser.set({
      'email': email,
      'password': password,
      'role': 'Admin',
      'status': true,
    });

    return 'Succses';
  } catch (e) {
    return e.toString();
  }
}
