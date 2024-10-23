// ignore_for_file: unused_local_variable

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  RxBool isloading = false.obs;
  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  var showsignuppassword = false.obs;
  TextEditingController loginemail = TextEditingController();
  TextEditingController loginpassword = TextEditingController();
  var showloginpassword = false.obs;
  setloading(val) {
    isloading.value = val;
  }

  setdata(data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('login', true);
    prefs.setString('name', data['name']);
    prefs.setString('email', data['email']);
    prefs.setString('userID', data['userID']);
    prefs.setString('usertype', data['usertype']);
  }

  Future<void> userRegister(String name, String email, String password) async {
    try {
      setloading(true);
      final UserCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      var uid = UserCredential.user!.uid;
      var obj = {
        "name": name,
        "email": email,
        "password": password,
        "usertype": "user",
        "userID": uid,
      };
      CollectionReference users =
          await FirebaseFirestore.instance.collection("users");
      users.doc(uid).set(obj);
      signUpName.clear();
      signUpEmail.clear();
      signUpPassword.clear();
      setloading(false);
      Get.snackbar(
        "Success",
        "User Register Successfully",
      );
    } on FirebaseAuthException catch (e) {
      setloading(false);
      if (e.code == 'email-already-in-use') {
        Get.snackbar(
          "Error",
          "This email is already in use. Please try another email.",
        );
      } else if (e.code == 'invalid-email') {
        Get.snackbar(
          "Error",
          "The email address is not valid.",
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "Error",
          "The password is wrong. Please check your password",
        );
      } else {
        Get.snackbar(
          "Error",
          "Something went wrong: ${e.message}",
        );
      }
    } on SocketException {
      setloading(false);
      Get.snackbar("Error",
          "No internet connection. Please check your network and try again.");
    } catch (e) {
      setloading(false);
      log(e.toString());
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> userLogin(String email, String password) async {
    try {
      setloading(true);
      final UserCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      var uid = UserCredential.user!.uid;
      loginemail.clear();
      loginpassword.clear();
       Get.snackbar(
        "Success",
        "User Login Successfully",
      );
      setloading(false);
    } on FirebaseAuthException catch (e) {
      setloading(false);
    if (e.code == 'user-not-found') {
      Get.snackbar("Error", "No user found with this email");
    } else if (e.code == 'wrong-password') {
      Get.snackbar("Error", "Wrong password, please try again");
    } else if (e.code == 'invalid-email') {
      Get.snackbar("Error", "Invalid email format");
    } else if (e.code == 'user-disabled') {
      Get.snackbar("Error", "This user account has been disabled");
    }else if (e.code == 'too-many-requests') {
      Get.snackbar("Error", "Too many login attempts. Try again later.");
    } 
    else {
      Get.snackbar("Error", "Authentication failed: ${e.message}");
    }
  } catch (e) {
    setloading(false);
    Get.snackbar("Error", "Something went wrong: ${e.toString()}");
  }
  }
}
