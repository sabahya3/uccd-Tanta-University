import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:secound_version/models/student_model.dart';
import 'package:secound_version/services/db_services.dart';

class SignInService{

 static SignInService instance=SignInService();
  

  Future<bool?>signUpWithEmailAndPassword(String _email,String _password)async{
try {
await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: _email.trim(),
    password: _password
  );
  return null;
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    return true;
  } else if (e.code == 'email-already-in-use') {
        return false;
  }
} catch (e) {
}


  }
   Future<bool?>signInWithEAndPass(String _email,String _password,bool _isStudent)async{
       Student ?student;
try {

 student= await DbServices.instance.getCurrentStudentByEmail(_email);
if(student!.isStudent==true&&_isStudent==true){
    UserCredential _userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _email.trim(),
    password: _password
    
  );
    return true;
    
}else if(student.isStudent==false&&_isStudent==false){
    UserCredential _userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: _email.trim(),
    password: _password
  );
    return true;
}
print('sorry error matching!');

} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
   return null;
  } else if (e.code == 'wrong-password') {
  return false;
  }
  
}

}
 bool loginOrnot() {
    var user = FirebaseAuth.instance.currentUser;
    if(user==null)
     { return false;}
    else {return true;}
  }


 Future<Status?> studentOrAdmin()async{
   bool? isStudend;
   String? uid=FirebaseAuth.instance.currentUser!.uid;
  List<QueryDocumentSnapshot<Map<String, dynamic>>> ?docs;
  docs=await FirebaseFirestore.instance.collection('Users').where('uid',isEqualTo: uid).get().then((value) => value.docs);
if(docs==null){

}else{
  for (var item in docs) {
    isStudend=Student.fromDocument(item).isStudent;
  }
}

if(isStudend==true) {return Status.student;}
else if(isStudend==false) {return Status.admin;}
else {return Status.none;}
 }


 Future <void>signOut()async{
  await FirebaseAuth.instance.signOut();
 }

}


enum Status{
student,
admin,
none
}