import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseManager {
  final CollectionReference list = FirebaseFirestore.instance.collection('Foods');



  Future getUsersList() async{

    List foodList = [];

    try{
      await list.get().then((querySnapshot){
        querySnapshot.docs.forEach((element){
          foodList.add(element.data());
        });
      });
       return foodList;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future getSeller() async{
    List sellList =[];

    try {
      await list.where('sell', isEqualTo: 'bestseller').get().then((
          querySnapshot) {
        querySnapshot.docs.forEach((element) {
          sellList.add(element.data());
        });
      });
      return sellList;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future getTaste() async{
    List tasteList =[];

    try {
      await list.where('Taste', isEqualTo: 'spicy').get().then((
          querySnapshot) {
        querySnapshot.docs.forEach((element) {
          tasteList.add(element.data());
        });
      });
      return tasteList;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future getCost() async{
    List costList =[];

    try {
      await list.where('Cost', isEqualTo: 100).get().then((
          querySnapshot) {
        querySnapshot.docs.forEach((element) {
          costList.add(element.data());
        });
      });
      return costList;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }


}





