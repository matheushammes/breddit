import 'package:flutter/material.dart';
import "myWidgets/myWidgets.dart";

class postObject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Post Title',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text('Title'),
              leading: Icon(
                Icons.restaurant_menu,
                color: Colors.blue[500],
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Posting to { } subreddits',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              leading: Icon(
                Icons.contact_phone,
                color: Colors.blue[500],
              ),
            ),
            ListTile(
              title: Text('Repeat'),
              leading: Icon(
                Icons.contact_mail,
                color: Colors.blue[500],
              ),
            ),
          ],
        ),
      ),
    );

  }
}

class PostHub extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<PostHub> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      add:
        postObject()
    );
  }
}

