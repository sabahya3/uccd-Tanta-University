import 'package:cloud_firestore/cloud_firestore.dart';

class Resume {
  String? uid;
  String? country;
  String? password;
  String? nationalId;
  String? uniLevel;
  String? faculity;
 String ?timeOfRegistiration;
  bool? isDisabled;
  String? userName;
  bool?isStudent;
  String?resumeLink;
  Resume(
      {required this.country,
      required this.faculity,
      required this.isDisabled,
      required this.nationalId,
      required this.password,
      required this.uid,
      required this.uniLevel,
      required this.resumeLink,
      required this.userName});



      Resume.fromDocument(QueryDocumentSnapshot<Object?>  doc){
uid=doc['uid'];
userName=doc['userName'];
uniLevel=doc['uniLevel'];
nationalId=doc['nationalId'];
isDisabled=doc['isDisabled'];
faculity=doc['faculity'];
password=doc['password'];
country=doc['country'];
timeOfRegistiration=doc['timeOfRegistiration'].toString();
resumeLink=doc['resumeLink'].toString();

      }

      toJson(){
        return{
'uid':uid,
'userName':userName,
'uniLevel':uniLevel,
'nationalId':nationalId,
'isDisabled':isDisabled,
'faculity':faculity,
'password':password,
'country':country,
'timeOfRegistiration':timeOfRegistiration,
'resumeLink':resumeLink,

        };
      }
}
