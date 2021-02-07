import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:charitable_organizations/models/organizations.dart';

class OrganizationList extends StatefulWidget {
  @override
  _OrganizationListState createState() => _OrganizationListState();
}

class _OrganizationListState extends State<OrganizationList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: /**FirebaseAnimatedList(
        query: FirebaseDatabase.instance
            .reference()
            .child('organizations')
            .orderByChild('id'),
        itemBuilder: (_,DataSnapshot snapshot, Animation<double> animation, index){
         return snapshot.value==null? CircularProgressIndicator() :
         OrganizationCard(snapshot.value["name"], snapshot.value["id"].toString());
        }
      ),**/
      FirebaseAnimatedList(
          query: FirebaseDatabase.instance
              .reference()
              .child('organizations')
              .orderByChild('id'),
          itemBuilder: (_,DataSnapshot snapshot, Animation<double> animation, index){
            if (snapshot.value==null) {
              return Center(child: CircularProgressIndicator());
            }
            else if (snapshot.value!=null){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                    child: ListTile(
                      leading: Icon(Icons.apartment_rounded, size: 60,
                        color: Colors.blue,),
                      title: Text(snapshot.value["name"],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("ID: ${ snapshot.value["id"].toString()}"),
                    )
                ),
              );
            }
            else {
              return Text("ERROR!",
                style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold),
              );
            }
          }
      )
    );
  }
}
