import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/DatabaseManager.dart';
import 'package:food_app/sell.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List userProfileList = [], sellList = [],tasteList= [], costList = [];
@override
  void initState() {
    super.initState();
    fetchDatabaseList();
    fetchSellList();
    fetchTasteList();
    fetchCostList();

  }


  fetchDatabaseList() async
  {
    dynamic resultant = await DatabaseManager().getUsersList();
    if(resultant == null){
      print('unable');
    }
    else{
      setState(() {
        userProfileList = resultant;

      });

    }
  }

  fetchSellList() async
  {
    dynamic resultant = await DatabaseManager().getSeller();
    if(resultant == null){
      print('unable');
    }
    else{
      setState(() {
        sellList = resultant;

      });

    }
  }

  fetchTasteList() async
  {
    dynamic resultant = await DatabaseManager().getTaste();
    if(resultant == null){
      print('unable');
    }
    else{
      setState(() {
        tasteList = resultant;

      });

    }
  }

  fetchCostList() async
  {
    dynamic resultant = await DatabaseManager().getCost();
    if(resultant == null){
      print('unable');
    }
    else{
      setState(() {
        costList = resultant;

      });

    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Recommendations'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_list_alt),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondRoute()),
              );


            },

          ),
        ],
      ),
      body: ListView.builder(
        itemCount: userProfileList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(userProfileList[index]["dish"]),

            ),
          );
        },
      ),
    );


  }
}





