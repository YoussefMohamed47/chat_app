import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:image/comps/animated-dialog.dart';
import 'package:image/comps/styles.dart';

class ChatWidgets {
  static Widget card({title, time, subtitle, onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Card(
        elevation: 0,
        child: ListTile(
          onTap: onTap,
          contentPadding: const EdgeInsets.all(5),
          leading: const Padding(
            padding: EdgeInsets.all(0.0),
            child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.white,
                )),
          ),
          title: Text(title),
          subtitle: subtitle != null ? Text(subtitle) : null,
          // trailing: Padding(
          //   padding: const EdgeInsets.only(right: 8.0),
          //   child: Text(time),
          // ),
        ),
      ),
    );
  }

  static Widget circleProfile({onTap, name}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                size: 40,
                color: Colors.white,
              ),
            ),
            SizedBox(
                width: 50,
                child: Center(
                    child: Text(
                  name,
                  style:
                      TextStyle(height: 1.5, fontSize: 12, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                )))
          ],
        ),
      ),
    );
  }

  static Widget messagesCard(
      {required bool check, message, time, required String messageType}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (check) const Spacer(),
          if (!check)
            const CircleAvatar(
              child: Icon(
                Icons.person,
                size: 13,
                color: Colors.white,
              ),
              backgroundColor: Colors.grey,
              radius: 10,
            ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 250),
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(10),
              child: messageType == "message"
                  ? Text(
                      '$message\n\n$time',
                      style:
                          TextStyle(color: check ? Colors.white : Colors.black),
                    )
                  : Image.network(message),
              decoration: Styles.messagesCardStyle(check),
            ),
          ),
          if (check)
            const CircleAvatar(
              child: Icon(
                Icons.person,
                size: 13,
                color: Colors.white,
              ),
              backgroundColor: Colors.grey,
              radius: 10,
            ),
          if (!check) const Spacer(),
        ],
      ),
    );
  }

  static messageField({required onSubmit, imageUpload}) {
    final con = TextEditingController();

    return Container(
      margin: const EdgeInsets.all(5),
      child: TextField(
        controller: con,
        decoration: Styles.messageTextFieldStyle(
          onSubmit: () {
            onSubmit(con);
          },
          imageUpload: () {
            imageUpload();
          },
        ),
      ),
      decoration: Styles.messageFieldCardStyle(),
    );
  }
}
