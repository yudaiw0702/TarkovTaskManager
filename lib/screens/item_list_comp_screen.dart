import 'package:flutter/material.dart';
import 'package:tarkov_task_manager/models/item_model.dart';

class CompletedTasks extends StatelessWidget {
// constructor内で親Widgetからの変数の継承？を行う
// 注意：　Classを呼び出す際に継承したい変数の代入を忘れない
  CompletedTasks({Key key, this.items}) : super(key: key);

  final List<Item> items;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Completed Tasks"),
        ),
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int i) {
//Taskオブジェクトのstatusが’true’になっているもの（完了された）Taskのみを表示する
                      return (items[i].status == 'true')
                          ? Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text(items[i].name),
                                  leading: Icon(
                                    Icons.check_box,
                                    color: Colors.greenAccent,
                                  ),
                                ),
                                Divider(height: 0)
                              ],
                            )
                          : Container();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
