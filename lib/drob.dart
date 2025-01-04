import 'package:flutter/material.dart';
import 'bfs.dart';

String? initVal;
int? pLocat;
String? info;
List<List> input = [];

class drob extends StatefulWidget{
  @override
  State createState() => dropBotton();
}
class dropBotton extends State<drob> {
  //String? initVal;
  List<String> bloodTyps =["A+","A-","B+","B-","O-","O+","AB+","AB-"];
  List<String> location =  ["","Bani Kinanah","Alramtha","irbid city","Alwasatea","Alshonah","Bani 3baid","Almazar","Altaibah","Alkorah"];
  //List<List> input = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body:Center(

        child:
        Column(
          children: [

            SizedBox(height: 60,),
            SizedBox(width: 180,

             child:DropdownButtonFormField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.bloodtype),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25)
                )
              ),
                value: initVal,


                items: bloodTyps.map((i){
                  return DropdownMenuItem(child: Text(i), value: i,);
                }).toList()

                ,
                onChanged:(v){
                input =[];
                  setState(() {
                    initVal = v;
                  });
            }
            ),
            ),
            SizedBox(height: 70,),
            SizedBox(width: 180,
              child:DropdownButtonFormField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(25)
                      )
                  ),
                  value: pLocat,

                  items: location.map((i){
                    return DropdownMenuItem(child: Text(i), value: location.indexOf(i));
                  }).toList()

                  ,
                  onChanged:(v){

                    setState(() {
                      pLocat = v as int;

                        bfs(pLocat);



                    });
                  }
              ),
            ),

            SizedBox(height: 70,),
            SizedBox(width: 280,
              child:DropdownButtonFormField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.person_search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25)
                      )
                  ),


                  value: info,
                  items: input.map((i){
                    String s = i.join(", ");
                    return DropdownMenuItem(child: Text(s), value: s);

                  }).toList()

                  ,
                  onChanged:(v){

                    setState(() {
                      v = info;
                    });
                  }
              ),
            ),

          ],
        ),
      ),

    );
  }
}