//ignore_for_file: unused_import, prefer_const_constructors_in_immutables,use_key_in_widget_constructors, prefer_const_constructors,deprecated_member_use
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:userlist/models/user.dart';
import 'package:userlist/widget/forms.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: Create()),
  );
}

class Create extends StatefulWidget {
  final User? user;
  Create({this.user});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final formKey = GlobalKey<FormState>();

  TextEditingController fullnameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  Future createUser() async {
    return await http.post(
      Uri.parse("https://datafence.000webhostapp.com/create.php"),
      body: {
        'fullname': fullnameController.text,
        'mobile': mobileController.text,
      },
    );
  }

  void onConfirm(context) async {
    await createUser();
    Navigator.of(context)
        .pushNamedAndRemoveUntil("/", (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    RefreshIndicator(onRefresh: () async {}, child: Container());

    return Scaffold(
      appBar: AppBar(
        title: Text('Create'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: RaisedButton(
          child: Text("Confirm"),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              onConfirm(context);
            }
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: AppForm(
              formKey: formKey,
              fullnameController: fullnameController,
              mobileController: mobileController,
            ),
          ),
        ),
      ),
    );
  }
}
