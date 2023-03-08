
import 'package:flutter/material.dart';
import 'package:frontend/views/food_order_confirm.dart';
import 'package:transparent_image/transparent_image.dart';

class recette extends StatefulWidget {
  const recette({Key? key}):super(key:key);

  @override
  State<recette> createState() => _recetteState();
}

class _recetteState extends State<recette> {
  List qtt=List.filled(10, 0);
  _add(int i){
    if(qtt[i]<10){
      setState(() {
        qtt[i]+=1;
      });
    }
  }
  _min(int i){
    if(qtt[i]>0){
      setState(() {
        qtt[i]-=1;
      });
    }
  }
  titleSection(int i) {

    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(children: [
            Container(
              width: 100,
              height: 100,
              child: Center(child: CircularProgressIndicator(),),
            ),
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: 'https://thumbs.dreamstime.com/b/pizza-rustic-italian-mozzarella-cheese-basil-leaves-35669930.jpg',
              width: 100,
              height: 100,
              fit: BoxFit.cover,),
          ],),
          Container(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 8),
                child: Text("Pizza neptun", style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20),),

              ),
              Text("8 DT", style: TextStyle(color: Colors.grey[500]),),
            ],),
          Container(width: 20,),
          Column(
            children: [
              //Container(height: 15,),

              IconButton(
                onPressed: () {
                  _add(i);
                },
                icon: Icon(Icons.add, color: Colors.cyan,),


              ),
              Text(qtt[i].toString()),
              IconButton(
                onPressed: () {
                  _min(i);
                },
                icon: Icon(Icons.minimize, color: Colors.cyan,),


              ),

            ],
          )

        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {




    return Scaffold(
        appBar: AppBar(
          title: Text("Food"),backgroundColor: Colors.deepOrangeAccent,
          actions: [IconButton(
            onPressed: () {
              showDialog(context: context,
                  builder: (BuildContext context) {
                   return FoodOrder();
              });
            },
            icon: Icon(Icons.food_bank,),

          ),],
        ),
        body: ListView(

          children: [Column(
            children: [
              Row(),
              titleSection(0),
              titleSection(1),
              titleSection(2),
              titleSection(3),
              titleSection(4),
              titleSection(5),

            ],
          )],
        )
    );

  }
}
