import 'package:flutter/material.dart';

class TraderCard extends StatelessWidget {
  final String text;
  final String image;
  const TraderCard({
    Key key,
    @required this.text,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(

        //タップされたときの動作
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Mypage(),),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(1.0),
          child: ListTile(
            leading: Image.asset('assets/images/$image.jpg', width: 50),
            title: Text(text),
          ),
        ),
      ),
    );
  }
}

//画面遷移
class Mypage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TraderName')),
      body: Center(
        child: Text('遷移しました'),
      ),
    );
  }
}