//ignore_for_file: unused_import, prefer_const_constructors_in_immutables,use_key_in_widget_constructors, prefer_const_constructors,deprecated_member_use
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppForm extends StatefulWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController fullnameController;
  TextEditingController mobileController;
  AppForm(
      {required this.formKey,
      required this.fullnameController,
      required this.mobileController});

  @override
  State<AppForm> createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: widget.fullnameController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(labelText: 'Full Name'),
          ),
          TextFormField(
            controller: widget.mobileController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(labelText: 'Mobiile No.'),
          ),
        ],
      ),
    );
  }
}
