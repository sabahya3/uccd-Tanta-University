import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:secound_version/services/db_services.dart';
import 'package:secound_version/services/dialog_service.dart';
import 'package:secound_version/services/fire_storage_service.dart';
import 'package:secound_version/utils/color_palete.dart';
import 'package:secound_version/views/mohakat_almokablah.dart';
import 'package:secound_version/widgets/build_upload_status.dart';
import 'package:secound_version/widgets/leading_icon.dart';
import 'package:secound_version/widgets/txt_button.dart';

class Data2 extends StatefulWidget {
  const Data2({Key? key}) : super(key: key);

  @override
  State<Data2> createState() => _Data2State();
}

class _Data2State extends State<Data2> {
  UploadTask? task;
  File? file;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    String fileName = file != null ? 'Ready to upload' : 'No File Selected';

    Future selectFile() async {
      final result = await FilePicker.platform.pickFiles(allowMultiple: false);

      if (result == null) return;
      final path = result.files.single.path!;

      setState(() => file = File(path));
    }

    Future <bool?>uploadFile() async {
      if (file == null) return null;

      final fileName = file!.path;
      final destination = 'files/$fileName';

      task = FirebaseApi.uploadFile(destination, file!);
      setState(() {});

      if (task == null) return null;

      final snapshot = await task!.whenComplete(() {});
      var urlDownload = await snapshot.ref.getDownloadURL();
      print('Download-Link: $urlDownload');
      if (urlDownload != null) {
        DbServices.instance.uploadResumeWithData(urlDownload);
        return true;
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: LeadingIcon(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            DefaultPhoto(image: 'assets/f8.png'),
            Padding(
              padding: const EdgeInsets.only(
                  top: defaultPading, bottom: defaultPading),
              child: Column(
                children: [
                  const Text('Upload your Resume',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: defaultPading / 2,
                  ),
                  Text(
                    'File should be word doc',
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: selectFile,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xffccfbff),
                          Color(0xffef96c5),
                        ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: SizedBox(
                            width: 80,
                            height: 80,
                            child: Image.asset(
                              'assets/f7.png',
                              fit: BoxFit.cover,
                            ))),
                    const SizedBox(
                      height: defaultPading,
                    ),
                    const Text(
                      'Select your file',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              fileName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            task != null ? BuildUploadStatus(task: task!) : Container(),
            SizedBox(height: height * 0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPading),
              child: DefaultButton(
                onPressed: () {
                  uploadFile().then((value){
                    if(value==null){
                       DialogService.instance
                      .niceSnackBar(
                          '', "من فضلك إختر ملف word", context);
                    }
                    else{
                       DialogService.instance
                      .niceSnackBar(
                          '', "تم رفع السيرة الذاتية بنجاح", context);
                    }
                  });
                  
                },
                text: 'Upload File',
                iconData: Icons.cloud_upload_outlined,
              ),
            ),
            //Icons.cloud_upload_outlined
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
