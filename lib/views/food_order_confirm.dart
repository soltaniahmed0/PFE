
import 'package:flutter/material.dart';
import 'package:frontend/views/main_page.dart';

class FoodOrder extends StatelessWidget {
  const FoodOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      title: Text("Confirm"),
      content: Text("Confirm order :"),
      actions: <Widget>[

        Container(
          width: 70,
          height: 70,
          child: RawMaterialButton(
            shape: CircleBorder(),
            fillColor: Colors.deepOrangeAccent,
            child: Text("Cancel",style: TextStyle(color: Colors.white),),
            onPressed: () => Navigator.of(context).pop(false),
          ) ,
        ),
        Container(
          width: 70,
          height: 70,
          child: RawMaterialButton(
            shape: CircleBorder(),
            fillColor: Colors.deepOrangeAccent,
            child: Text("Confirm",style: TextStyle(color: Colors.white),),
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => MainPage(),),);
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("we will notify you when your order is ready")));

            },
          ) ,
        ),

      ],

    );
  }
}
