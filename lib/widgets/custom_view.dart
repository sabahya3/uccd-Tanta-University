import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomView extends StatelessWidget {
   CustomView({ Key? key ,required this.onTap,required this.txt}) : super(key: key);

Function onTap;

String txt;
  @override
  Widget build(BuildContext context) {
    return  
            GestureDetector(
              onTap: (){
                onTap();
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient:  LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: [
                        const  Color(0xffccfbff),
                        
                         Colors.blue.withOpacity(0.5)
                        ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  
                
                     Align(
                       alignment: Alignment.center,
                       child: Text(
                        txt,
                        style:const TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.bold),
                                         ),
                     ),
                  ],
                ),
              ),
            );
  }
}