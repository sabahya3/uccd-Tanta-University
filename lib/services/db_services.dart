import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:secound_version/models/student_model.dart';
import 'package:secound_version/models/workshops_model.dart';
import 'package:secound_version/services/navigation_services.dart';

class DbServices {
  static DbServices instance = DbServices();
  late FirebaseFirestore _db;

  final String _usersCollection = "Users";
  final String _resumeCollection = 'resume';

  DbServices() {
    _db = FirebaseFirestore.instance;
  }

  Future<void> createUserInDb(
      String _faculity,
      String _country,
      String fName,
      String _userName,
      String _nationalId,
      bool _isDisabled,
      String _password,
      String _uid,
      String _uniLevel) async {
    try {
      _uid = FirebaseAuth.instance.currentUser!.uid;
      return await _db.collection(_usersCollection).doc(_uid).set({
        "userName": _userName,
        "password": _password,
        "nationalId": _nationalId,
        "isDisabled": _isDisabled,
        "timeOfRegistiration": DateTime.now().toUtc(),
        "country": _country,
        "faculity": _faculity,
        "uid": _uid,
        "uniLevel": _uniLevel,
        "isStudent": true
      });
    } catch (e) {
      print(e);
    }
  }



  
  Future<Student?> getCurrentStudent(String uid) async {
    Student? student;
    try {
      await _db
          .collection(_usersCollection)
          .where('uid', isEqualTo: uid)
          .get()
          // ignore: avoid_function_literals_in_foreach_calls
          .then((value) => value.docs.forEach((element) {
                student = Student.fromDocument(element);
               
              }));
      return student;
    } catch (e) {
      if(kDebugMode){
        print(e);
      }
    }
  }

  //
  Future<Student?> getCurrentStudentByEmail(String email) async {
    Student? student;
    try {
      await _db
          .collection(_usersCollection)
          .where('userName', isEqualTo: email)
          .get()
          // ignore: avoid_function_literals_in_foreach_calls
          .then((value) => value.docs.forEach((element) {
                student = Student.fromDocument(element);
                if (kDebugMode) {
                  print(student!.userName);
                }
              }));
      return student;
    } catch (e) {
      if (kDebugMode) {
        print('not found');
      }
    }
  }

 


  // Future<void> uploadFileLink(String _fileLink) async {
  //   try {
  //     String? _email = FirebaseAuth.instance.currentUser!.email;
  //     return await _db
  //         .collection('resume')
  //         .doc()
  //         .set({"fileLink": _fileLink, "email": _email});
  //   } catch (e) {
  //     print(e);
  //   }
  // }

//===================================

  Future<void> uploadResumeWithData(String resumeLink) async {
    try {
      Student? student;
      String _uid = FirebaseAuth.instance.currentUser!.uid;
      CollectionReference users =
          FirebaseFirestore.instance.collection(_usersCollection);

      await users
          .where('uid', isEqualTo: _uid)
          .get()
          // ignore: avoid_function_literals_in_foreach_calls
          .then((value) => value.docs.forEach((element) {
                student = Student.fromDocument(element);
              }));
      if (student != null) {
        await _db.collection(_resumeCollection).doc(_uid).set({
          "resumeLink": resumeLink,
          "userName": student!.userName,
          "password": student!.password,
          "nationalId": student!.nationalId,
          "isDisabled": student!.isDisabled,
          "timeOfRegistiration": student!.timeOfRegistiration,
          "country": student!.country,
          "faculity": student!.faculity,
          "uid": student!.uid,
          "uniLevel": student!.uniLevel,
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }




  //==============================
  //create model in db
  Future<void> createModelInDb(String random, var model,String table) async {
    try {
      return await _db
          .collection(table)
          .doc(random)
          .set(model.toJson());
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

//==================join opportiunity

  Future<void> joinOpporiunity(
      String random, var model, String uid, String table) async {
      
try {
      Student? stu;
      stu = await getCurrentStudent(uid);
     return  await _db
          .collection(table)
          .doc(random)
          .collection('students')
          .doc(uid)
          .set(stu!.toJson());
    } catch (e) {
   if(kDebugMode){
     print(e);
   }
    }
   
  }

//=======================join model
// we need to edit here
  Future<bool?> joinModel(
      String random, var model, String uid, String table) async {
//         var val;
// await _db.collection(table).doc(random).collection('students').where('uid',isEqualTo: uid).get().then((value) =>val=value );

// if(val==null){

//     return true;
// }else {
//   print('sorry u joined beforre ');
//   return false;
// }
 try {
      Student? stu;
      stu = await getCurrentStudent(uid);
       await _db
          .collection(table)
          .doc(random)
          .collection('students')
          .doc(uid)
          .set(stu!.toJson());
    } catch (e) {
   if(kDebugMode){
     print(e);
   }
    }

   
  }

 // get all Students in current model
  Stream<QuerySnapshot>? getAllStudentsInCurrentModel(var model, String table) {
    try {
      return _db
          .collection(table)
          .doc(model.doc)
          .collection('students')
          .snapshots();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

//===============================
// stream of cards
  Stream<QuerySnapshot>? getAllCardsInDb(String table) {
    try {
      return _db.collection(table).snapshots();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }


//===========================
  //update model
  Future<void> updateModel(var model, String table) async {
    CollectionReference modelRef = FirebaseFirestore.instance.collection(table);

    await modelRef.doc(model.doc).set(model.toJson());
  }
// ============= 
// remove model 
 Future<void> removeModel( {required String table , required String document})async{
        await FirebaseFirestore.instance
                                    .collection(table)
                                    .doc(
                                        document)
                                    .delete();
                                NavigationService.instance.goBack();
 }


    //=====================================
  Future<List<WorkShops>> getAllWorkShops() async {
    List<WorkShops> wrkShops = [];
    CollectionReference workShops =
        FirebaseFirestore.instance.collection('workShops');

    // ignore: avoid_function_literals_in_foreach_calls
    await workShops.get().then((value) => value.docs.forEach((element) {
          wrkShops.add(WorkShops.fromJson(element));
        }));

    for (var element in wrkShops) {
      if (kDebugMode) {
        print(element.title);
      }
    }
    return wrkShops;
  }
}

/*
   return await _db.collection(_usersCollection).doc(_uid).set({
        "userName": _userName,
        "password": _password,
        "nationalId": _nationalId,
        "isDisabled": _isDisabled,
        "timeOfRegistiration": DateTime.now().toUtc(),
        "country":_country,
        "faculity":_faculity,
        "uid":_uid,
        "uniLevel":_uniLevel
      });
   */
