import 'package:flutter/material.dart';

class ItemCheckList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text('アイテムチェックリスト'),
      ),
      body: Center(
         child: ChangeForm(),
      ),
    );
  }
}

class ChangeForm extends StatefulWidget {
  @override
  _ChangeFormState createState() => _ChangeFormState();
}

class _ChangeFormState extends State<ChangeForm> {

  bool _flag = false;

  void _handleCheckbox(bool e) {
    setState(() {
      _flag = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: 100,
          child: Column(
            children: <Widget>[
              CheckboxListTile(
                activeColor: Colors.blue,
                title: Text('アイテム名'),
                subtitle: Text('サブタイトル'),
                value: _flag,
                onChanged: _handleCheckbox,)
            ],
          ),
        )
    );
  }
}