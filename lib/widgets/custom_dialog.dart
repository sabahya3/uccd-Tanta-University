import 'package:flutter/material.dart' show AlertDialog, BuildContext, Key, Navigator, StatelessWidget, Text, TextButton, Widget;

// ignore: must_be_immutable
class CustomDialog extends StatelessWidget {
   CustomDialog({ Key? key, this.title='',this.content='' }) : super(key: key);
String? title;
String? content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
          title:  Text(title!),
          content:  Text(content!),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        );
  }
}