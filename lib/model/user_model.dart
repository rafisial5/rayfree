import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  late String userId;
  late String name;
  late String email;
  late String vehicleNumber;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.vehicleNumber,
  });

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserModel(
      userId: doc.id,
      name: data['name'],
      email: data['email'],
      vehicleNumber: data['vehicleNumber'],
    );
  }
}
