import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/taste.dart';

import 'DatabaseManager.dart';

class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {

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
        title: Text('Tap filter for Spicy'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_list_alt),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ThirdRoute()),
              );


            },

          ),
        ],
      ),
      body: ListView.builder(
        itemCount: sellList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(sellList[index]["dish"]),

            ),
          );
        },
      ),
    );
  }
}
