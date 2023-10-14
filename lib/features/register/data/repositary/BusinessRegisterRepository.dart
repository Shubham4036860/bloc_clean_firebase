import 'package:bloc_with_clean/features/register/data/entity/business_userregister_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

class BusinessRegisterRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref().child('businessUsers');

  Future<BusinessRegister?> registerUser({
    required String name,
    required String email,
    required String contact,
    required String bType,
    required String bGst,
    required String bPassword,
    required String confirmBPass,
  }) async {
    try {
      // Create a user using Firebase Authentication.
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: confirmBPass,
      );

      final uid = userCredential.user!.uid;

      // Create a user data entry in the Realtime Database.
      await _databaseReference.child(uid).set({
        'email': email,
        'name': name,
        'phone': contact,
        'businessName': bType,
        'bGst': bGst,
        'bPassword': bPassword,
        'confirmBPass': confirmBPass,
      });

      return BusinessRegister(name, email, contact, bType, bGst, bPassword, confirmBPass);
    } catch (e) {
      // Handle registration errors.
      if (kDebugMode) {
        print("object=========>$e");
      }
      return null;
    }
  }
}
