//ignore_for_file: unused_import, prefer_const_constructors_in_immutables,use_key_in_widget_constructors, prefer_const_constructors,deprecated_member_use

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:userlist/models/user.dart';
import '../models/user.dart';
import './edit.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: Details()),
  );
}

class Details extends StatefulWidget {
  final User? user;
  Details({this.user});

  @override
  State<Details> createState() => DetailsState();
}

class DetailsState extends State<Details> {
  void deleteUser(context) async {
    await http.post(
      (Uri.parse("https://datafence.000webhostapp.com/delete.php")),
      body: {
        'id': widget.user!.id.toString(),
      },
    );
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  void confirmDelete(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Are you sure want to delete this ?'),
          actions: <Widget>[
            RaisedButton(
              child: Icon(Icons.check_circle),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () => deleteUser(context),
            ),
            RaisedButton(
              child: Icon(Icons.cancel),
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => confirmDelete(context),
          ),
        ],
      ),
      body: Container(
        height: 270.0,
        padding: EdgeInsets.all(35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Name : ${widget.user!.fullname}",
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Text(
              "Mobile No. : ${widget.user!.mobile}",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => Edit(user: widget.user),
          ),
        ),
      ),
    );
  }
}
