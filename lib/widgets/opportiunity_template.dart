import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:secound_version/models/workshops_model.dart';
import 'package:secound_version/services/navigation_services.dart';
import 'package:secound_version/views/admin_screens/update_training.dart';
import 'package:secound_version/views/admin_screens/update_work_shop.dart';
import 'package:secound_version/views/al_tawzif/update_opportiunity.dart';
import 'package:secound_version/widgets/txt_1.dart';

class OpportiunityTemplate extends StatelessWidget {
  OpportiunityTemplate(
      {Key? key,
      required this.go,
      required this.text,
      required this.icon,
      required this.remove,
      this.width,
      this.height,
      required this.model,
      this.date,
    
      })
      : super(key: key);
  String text;
  IconData icon;
  //Function onPressed;
  double? width;
  double? height;
  Function? remove;
  var model;

Function? go;
  String? date;


  @override
  Widget build(BuildContext context) {
 
    return GestureDetector(
      onTap: (){
        go!();
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: width! * 0.85,
        height: height! * 0.25,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.blue.shade100,
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 5)),
            ],
            color: Colors.grey.shade50,
            border: Border.all(color: Colors.blue.shade300),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            SizedBox(
              height: height! * 0.03,
            ),
            Row(
              children: [
                const Expanded(
                    child: Icon(
                  Icons.work,
                  color: Colors.red,
                  size: 30,
                )),
                SizedBox(
                  width: width! * 0.03,
                ),
                Expanded(
                  flex: 3,
                  child: Text1(
                    text: 'Title : ' + text,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
                const Spacer(),
              ],
            ),
            SizedBox(
              height: height! * 0.03,
            ),
            Row(
              children: [
                Expanded(
                    child: Icon(
                  icon,
                  color: Colors.red,
                  size: 30,
                )),
                SizedBox(
                  width: width! * 0.03,
                ),
                Expanded(
                    flex: 3,
                    child: FittedBox(
                      child: Text1(
                        text: 'Date : ' +
                            DateFormat('yyyy/MM/dd ')
                                .format(DateTime.parse(date!))
                                .toString() ,
                        color: Colors.black,
                        size: 18,
                      ),
                    )),
                const Spacer(),
              ],
            ),
            SizedBox(
              height: height! * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                      padding:const EdgeInsets.all(10),
                        backgroundColor: Colors.blue.withOpacity(0.5)),
                    onPressed: () {
                      NavigationService.instance
                          .goTO(context, UpdateOpportiunity(opportiunity: model!));
                    },
                    child: const Text(
                      'تعديل الوظيفة',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      padding:const EdgeInsets.all(10),
                        backgroundColor: Colors.red.withOpacity(0.5)),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctxt) => AlertDialog(
                                alignment: Alignment.center,
                                title: const Text('تحذير'),
                                titlePadding:
                                    EdgeInsets.only(left: width! * 0.30),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text1(
                                      text: 'هل تريد حذف الوظيفة',
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      height: height! * 0.02,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                            style: TextButton.styleFrom(
                                             
                                                backgroundColor:
                                                    Colors.blue.withOpacity(0.5)),
                                            onPressed: () {
                                              NavigationService.instance.goBack();
                                            },
                                            child: const Text('لا')),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        TextButton(
                                            style: TextButton.styleFrom(
                                                backgroundColor:
                                                    Colors.red.withOpacity(0.5)),
                                            onPressed: () => remove!(),
                                            child: const Text('نعم')),
                                      ],
                                    )
                                  ],
                                ),
                              ));
                    },
                    child: const Text(
                      'حذف الوظيفة',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )),
    
                // DefaultButton(
                //   height: height!*0.06,
                //   width: width!*0.45,
                //   text:'حذف ورشة العمل',
    
                // iconData: null,
    
                // ),
    
                // DefaultButton(width: width!*0.40,text: 'تعديل ', onPressed: (){
    
                // })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
