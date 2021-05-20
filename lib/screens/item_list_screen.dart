import 'package:flutter/material.dart';
import 'package:tarkov_task_manager/models/item_model.dart';
import 'package:tarkov_task_manager/screens/item_list_comp_screen.dart';

class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  @override
  void initState() {
    super.initState();
  }

  //　Itemのアップデートを行う処理
  void updateItems(Item item, int i) {
    if (item.status == 'false') {
      final updatedTask = Item(
        name: item.name,
        message: '完了',
        image: item.image,
        status: 'true',
        itemsNeeded: item.itemsNeeded,
        count: item.count,
      );
      //tasksのi番目のタスクを新しいタスクと入れ替える。
      items[i] = updatedTask;
    } else if (item.status == 'true') {
      final updatedTask = Item(
        name: item.name,
        message: '進行中',
        image: item.image,
        status: 'false',
        itemsNeeded: item.itemsNeeded,
        count: item.count,
      );
      items[i] = updatedTask;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('アイテムチェックリスト'),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(Icons.check_box),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompletedTasks(
                        items: items,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
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
                      onPressed: items[i].count <= 0
                          ? null
                          : () {
                              setState(() => items[i].count--);
                              if (items[i].count < items[i].itemsNeeded &&
                                  items[i].status == 'true') {
                                updateItems(items[i], i);
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
                      onPressed: items[i].count >= items[i].itemsNeeded
                          ? null
                          : () {
                              setState(() => items[i].count++);
                              if (items[i].count == items[i].itemsNeeded &&
                                  items[i].status == 'false') {
                                updateItems(items[i], i);
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
