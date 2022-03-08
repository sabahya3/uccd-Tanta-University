
import 'package:flutter/material.dart';
import 'package:secound_version/services/navigation_services.dart';
import 'package:secound_version/views/admin_screens/get_all_workshops.dart';
import 'package:secound_version/views/admin_screens/work_shop_screen.dart';
import 'package:secound_version/views/al_tawzif/add_new_opportunity.dart';
import 'package:secound_version/views/al_tawzif/available_opporiunities.dart';
import 'package:secound_version/widgets/custom_view.dart';

class CreateOrGetAllOpportiunities extends StatelessWidget {
  const CreateOrGetAllOpportiunities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
     double w =MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox.expand(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/a1.png',width: w*0.75,height: height*0.30,),
            CustomView(
                onTap: () { NavigationService.instance.goTO(context, CreateOpportunity());},
                
                txt: 'إضافة فرصة جديدة '),
                SizedBox(height:height*0.03 ,),
                CustomView(
                onTap: () {
                  NavigationService.instance.goTO(context,const AvailableOpportiunity());
                },
               
                txt: 'فرص العمل المتاحة'),
      
          ],
        ),
      ),
    );
  }
}
