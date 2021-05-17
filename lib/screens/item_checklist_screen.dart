import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tarkov_task_manager/providers/item_provider.dart';

class ItemCheckList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('アイテムチェックリスト'),
      ),
      body: ChangeNotifierProvider<CounterModel>(
        create: (context) => CounterModel(),
        child: Row(
          children: <Widget>[
            Expanded(child: ItemList())
          ]
        ),
      ),
    );
  }
}

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          _FlashDrive(),
          _GasAnalyzer(),
          _FlashDrive(),
          _GasAnalyzer(),
          _FlashDrive(),
          _GasAnalyzer(),
          _FlashDrive(),
          _GasAnalyzer(),
          _FlashDrive(),
          _GasAnalyzer(),
        ],
      ),
    );
  }
}

class _Post extends StatelessWidget {
  final String name;
  final String message;
  final String textReason;
  final String image;
  final Color colorPrimary;
  final Color colorPositive;
  final String textPositive;
  final Color colorNegative;
  final String textNegative;
  final int itemsNeeded;
  

  _Post({
    Key key,
    @required this.name,
    @required this.message,
    @required this.textReason,
    @required this.colorPrimary,
    @required this.colorPositive,
    @required this.textPositive,
    @required this.colorNegative,
    @required this.textNegative,
    @required this.image,
    @required this.itemsNeeded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CounterModel getItem = Provider.of<CounterModel>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        elevation: 8,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            ListTile(
              leading: Image.asset('assets/images/items/$image'),
              title: Row(
                children: [
                  Expanded(child:Text(name)),
                  Expanded(
                      child: Text('${getItem.count}/$itemsNeeded',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.right,
                      )
                  ),
                ],
              ),
              subtitle: Text('Find in raid'),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 72),
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      border: Border.all(color: colorPrimary, width: 4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(child: Text(message)),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: colorPrimary, width: 2),
                      ),
                    ),
                    child: Text(
                      textReason,
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                  SizedBox(width: 24),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: colorNegative,
                      ),
                      /// 取得ボタンを押したときの動作
                      onPressed: (){
                        if (getItem.count < itemsNeeded) {
                          getItem.increment();
                        }
                      },
                      child: Text(textNegative),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: colorPositive,
                        backgroundColor: colorPositive.withOpacity(0.2),
                      ),
                      onPressed: () {},
                      child: Text(textPositive),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FlashDrive extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return _Post(
      name: 'FlashDrive',
      message: 'アイテム説明とか',
      textReason: '',
      colorPrimary: Colors.greenAccent,
      colorPositive: Colors.greenAccent,
      textPositive: 'Passed',
      colorNegative: Colors.blueAccent,
      textNegative: '取得',
      image: 'Secure_Flash_drive_Icon.png',
      itemsNeeded: 5,
    );
  }
}

class _GasAnalyzer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Post(
      name: 'GasAnalyzer',
      message: 'セラピストに必要なアイテム',
      textReason: 'Pending Reason',
      colorPrimary: Colors.deepOrangeAccent,
      colorPositive: Colors.blueAccent,
      textPositive: 'Publish',
      colorNegative: Colors.deepOrangeAccent,
      textNegative: 'Decline',
      image: 'Gas_Analyzer_Icon.png',
      itemsNeeded: 3,
    );
  }
}