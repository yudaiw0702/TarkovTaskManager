import 'package:flutter/material.dart';
import 'package:tarkov_task_manager/models/item_model.dart';

class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('アイテムチェックリスト'),
        ),
        body: Stack(children: [
          Column(
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int i) {
                        return buildListItem(items, i);
                      })),
            ],
          ),
        ]));
  }

  buildListItem(List<Item> items, int i) {
    return Container(
      key: ObjectKey(items[i]),
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
              leading: Image.asset(
                'assets/images/items/${items[i].image}',
                width: 50,
                height: 50,
                fit: BoxFit.contain,
              ),
              title: Row(
                children: [
                  Expanded(child: Text(items[i].name)),
                  Expanded(
                      child: Text(
                    '${items[i].count}/${items[i].itemsNeeded}',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.right,
                  )),
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
                      border: Border.all(color: Colors.greenAccent, width: 4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(width: 8),
                  Flexible(child: Text(items[i].message)),
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
                        bottom: BorderSide(color: Colors.greenAccent, width: 2),
                      ),
                    ),
                    // child: Text(
                    //   widget.textReason,
                    //   style: TextStyle(color: Colors.blueAccent),
                    // ),
                  ),
                  SizedBox(width: 24),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.deepOrangeAccent,
                      ),

                      /// 取得ボタンを押したときの動作
                      onPressed: () {
                        if (items[i].count > 0) {
                          setState(() => items[i].count--);
                        }
                      },
                      child: Text('減らす'),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.greenAccent,
                        backgroundColor: Colors.greenAccent.withOpacity(0.2),
                      ),
                      onPressed: () {
                        if (items[i].count < items[i].itemsNeeded) {
                          setState(() => items[i].count++);
                        }
                      },
                      child: Text('取得'),
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
