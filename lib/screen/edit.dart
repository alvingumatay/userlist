//ignore_for_file: unused_import, prefer_const_constructors_in_immutables,use_key_in_widget_constructors, prefer_const_constructors,deprecated_member_use
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:userlist/models/user.dart';
import 'package:userlist/widget/forms.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: Edit()),
  );
}

class Edit extends StatefulWidget {
  final User? user;
  Edit({this.user});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController fullnameController;
  late TextEditingController mobileController;

  Future editUser() async {
    return await http.post(
      Uri.parse("https://datafence.000webhostapp.com/update.php"),
      body: {
        "id": widget.user!.id.toString(),
        "fullname": fullnameController.text,
        "mobile": mobileController.text,
      },
    );
  }

  void _onConfirm(context) async {
    await editUser();
  }

  @override
  void initState() {
    fullnameController = TextEditingController(text: widget.user!.fullname);
    mobileController = TextEditingController(text: widget.user!.mobile);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: RaisedButton(
          child: Text("Confirm"),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            _onConfirm(context);
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
