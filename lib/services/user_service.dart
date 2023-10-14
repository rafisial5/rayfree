import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rayfree_toll/model/user_model.dart';

class UserService {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;
  static signupUser(String name, String emailAddress, String password,
      String vehicleNumber) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      UserModel user0 = UserModel(
        userId: credential.user!.uid,
        name: name,
        email: emailAddress,
        vehicleNumber: vehicleNumber,
      );
      if (await createNewUser(user0)) {
        final doc = await _firebaseFirestore
            .collection("users")
            .doc(user0.userId)
            .get();
        UserModel user = UserModel.fromDocumentSnapshot(doc);
        print("User:$user");
      }
    } on FirebaseAuthException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> createNewUser(UserModel user) async {
    try {
      await _firebaseFirestore.collection("users").doc(user.userId).set({
        "userId": user.userId,
        "name": user.name,
        "email": user.email,
        "vehicleNumber": user.vehicleNumber,
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
