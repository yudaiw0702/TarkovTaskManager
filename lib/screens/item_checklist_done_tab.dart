import 'package:flutter/material.dart';

class ItemListDone extends StatefulWidget {
  @override
  _ItemListDoneState createState() => _ItemListDoneState();
}

class _ItemListDoneState extends State<ItemListDone> {
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
                    ),
                  ),
                  Container(
                      child: IconButton(
                    icon: Icon(Icons.close),
                    color: Colors.red,
                    onPressed: () {},
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FlashDrive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTileItem(
      name: 'FlashDrive',
      message: '完了',
      image: 'Secure_Flash_drive_Icon.png',
      itemsNeeded: 5,
    );
  }
}

class GasAnalyzer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTileItem(
      name: 'GasAnalyzer',
      message: '完了',
      image: 'Gas_Analyzer_Icon.png',
      itemsNeeded: 3,
    );
  }
}
