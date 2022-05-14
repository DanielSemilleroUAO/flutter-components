import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [

          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://media-exp1.licdn.com/dms/image/C5603AQHZWHtBvDGHyw/profile-displayphoto-shrink_200_200/0/1606771784225?e=1632960000&v=beta&t=Kk5g4fM64vdkouxN3gCJZwH2Ml9BvJ83lb1Sw5CRGq8'),
              radius: 30.0,
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('DR'),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage('https://media-exp1.licdn.com/dms/image/C5603AQHZWHtBvDGHyw/profile-displayphoto-shrink_200_200/0/1606771784225?e=1632960000&v=beta&t=Kk5g4fM64vdkouxN3gCJZwH2Ml9BvJ83lb1Sw5CRGq8'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}