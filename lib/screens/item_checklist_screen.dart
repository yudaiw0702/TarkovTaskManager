import 'package:flutter/material.dart';
import 'package:tarkov_task_manager/models/item_model.dart';
import 'package:tarkov_task_manager/screens/item_checklist_done_tab.dart';

class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('アイテムチェックリスト'),
        bottom: TabBar(controller: _controller, tabs: _buildSimpleTabs()),
      ),
      body: TabBarView(
        controller: _controller,
        children: _buildTabPages(),
      ),
      //Column(children: <Widget>[Expanded(child: ItemList())]),
    );
  }

  List<Widget> _buildSimpleTabs() {
    return [
      Tab(text: '未完了'),
      Tab(text: '完了'),
    ];
  }

  /// タブの中身として表示するPage(Widget)の配列を生成
  List<Widget> _buildTabPages() {
    return [
      Column(children: <Widget>[Expanded(child: ItemList())]),
      Column(children: <Widget>[Expanded(child: ItemListDone())]),
    ];
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
          FlashDrive(),
          GasAnalyzer(),
          FlashDrive(),
          GasAnalyzer(),
          FlashDrive(),
          GasAnalyzer(),
          FlashDrive(),
          GasAnalyzer(),
          FlashDrive(),
          GasAnalyzer(),
          FlashDrive(),
          GasAnalyzer(),
        ],
      ),
    );
  }
}

class ListTileItem extends StatefulWidget {
  final String name;
  final String message;
  final String image;
  final int itemsNeeded;

  ListTileItem({
    Key key,
    @required this.name,
    @required this.message,
    @required this.image,
    @required this.itemsNeeded,
  }) : super(key: key);

  @override
  _ListTileItemState createState() => _ListTileItemState();
}

class _ListTileItemState extends State<ListTileItem> {
  int _itemCount = 0;
  @override
  Widget build(BuildContext context) {
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
              leading: Image.asset(
                'assets/images/items/${widget.image}',
                width: 50,
                height: 50,
                fit: BoxFit.contain,
              ),
              title: Row(
                children: [
                  Expanded(child: Text(widget.name)),
                  Expanded(
                      child: Text(
                    '$_itemCount/${widget.itemsNeeded}',
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
                  Flexible(child: Text(widget.message)),
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
                      onPressed: () => setState(() => _itemCount--),
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
                        setState(() {
                          var itemCount = _itemCount;
                          if (itemCount <= widget.itemsNeeded) {
                            return itemCount++;
                          }
                        });
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