import 'package:flutter/material.dart';
import 'package:charitable_organizations/models/organizations.dart';
import 'package:firebase_database/firebase_database.dart';


class SubmitData extends StatefulWidget {
  @override
  _SubmitDataState createState() => _SubmitDataState();
}

class _SubmitDataState extends State<SubmitData> {
  static TextEditingController  organizationName, organizationID;

  Organizations organizations = new Organizations();

  addOrganization() async{
    FirebaseDatabase _database = new FirebaseDatabase();
    await _database.reference().child('organizations/${organizations.id}').set(organizations.toJson());
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Add a new Organization"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: organizationName,
                  decoration: InputDecoration(
                      hintText: "Organization Name..."
                  ),
                  onSaved: (value)=>organizations.name = value,
                ),

                TextFormField(
                  controller: organizationID,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Organization ID..."
                  ),
                  onSaved: (value)=>organizations.id=int.parse(value),
                ),

                Container(height: 18,),
                RaisedButton(
                  onPressed: () async{
                    _formKey.currentState.save();
                    await addOrganization();
                    _formKey.currentState.reset();
                  },
                  child: Text("Add Organization"),
                )
              ],

            ),
          ),
        ),
      ),
    );
  }
}
