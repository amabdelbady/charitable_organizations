import 'package:charitable_organizations/ui/OrganizationList.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:charitable_organizations/models/organizations.dart';

class RetrieveData extends StatefulWidget {
  @override
  _RetrieveDataState createState() => _RetrieveDataState();
}

class _RetrieveDataState extends State<RetrieveData> {

  Future<List<Organizations>> fetchOneEmployee() async {
    FirebaseDatabase database = new FirebaseDatabase();
    DatabaseReference _organizations= database.reference().child("organizations");
    DataSnapshot organizationsSnap = await _organizations.once();
    Map<dynamic, dynamic> organizationsMap = organizationsSnap.value["id"];
    return(organizationsMap ["id"]);
  }

  Organizations organizations = new Organizations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Organizations"),
      ),
      body: Container(
        padding: const EdgeInsets.all(1.0),
        child: Center(
          child: OrganizationList(),
        ),
      ),
    );
  }
}
