import 'package:flutter/material.dart';

import '../screens/collDetail_scr.dart';

class CollectionCard extends StatelessWidget {

  final String name;
  final bool stat;
  final String req;
  final int numb;
 
  CollectionCard(
     this.name,
     this.stat,
     this.req,
     this.numb,
   );

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => CollectionDetail(name,stat,req,numb)
        ));
      },
          child: Container(
        margin: EdgeInsets.all(5),
        height: mq.size.height*0.15,
        width:  (mq. size. width-20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Icon(Icons.home,color: Colors.lightGreen,size: 45,),
              height: mq.size.height*0.8 ,
              width: 75,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:  Colors.white
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height:5),
                Row(
                  children: <Widget>[
                    Text('Location : ',style: TextStyle(color: Colors.white)),
                    Text(name ,style: TextStyle(color: Colors.white))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('Status : ',style: TextStyle(color: Colors.white)),
                    Text(stat?"ACTIVE":"INACTIVE",style: TextStyle(color: Colors.white))
                  ],
                ),
                Text('* tap for more info', style: TextStyle(fontSize: 8,color: Colors.black87))
              ]
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.lightGreen,
          border: Border.all(
            color: Colors.lightGreen,
            width: 3
            
          ),
          borderRadius: BorderRadius.circular(6)
        ),
      ),
    );
  }
}