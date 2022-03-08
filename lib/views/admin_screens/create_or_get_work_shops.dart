
import 'package:flutter/material.dart';
import 'package:secound_version/services/navigation_services.dart';
import 'package:secound_version/views/admin_screens/get_all_workshops.dart';
import 'package:secound_version/views/admin_screens/work_shop_screen.dart';
import 'package:secound_version/widgets/custom_view.dart';

class CreateOrGetAllWorkShops extends StatelessWidget {
  const CreateOrGetAllWorkShops({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
     double w =MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox.expand(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/f4.png',width: w*0.75,height: height*0.30,),
            CustomView(
                onTap: () { NavigationService.instance.goTO(context,const CreateWorkShops());},
                
                txt: 'انشاء ورشة عمل'),
                SizedBox(height:height*0.03 ,),
                CustomView(
                onTap: () {
                  NavigationService.instance.goTO(context,const GetAllWorkShops());
                },
               
                txt: 'ورش العمل المتاحة'),
      
          ],
        ),
      ),
    );
  }
}
