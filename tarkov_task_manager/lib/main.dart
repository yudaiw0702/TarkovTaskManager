import 'package:flutter/material.dart';

void main() {
  // 最初に表示するWidget
  runApp(TarkovTaskManager());
}

class TarkovTaskManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // アプリ名
      title: 'Tarkov Task Manager',
      //テーマをダークモードにする
      theme: ThemeData.dark(),
      // リスト一覧画面を表示
      home: TaskListPage(),
    );
  }
}

// リスト一覧画面用Widget
class TaskListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBarの表示とタイトル設定
      appBar: AppBar(
        title: Text('タスク一覧')
      ),
      body: ListView(
        children: <Widget>[
          // CardとListTileを使い、簡単に整ったUIを作成
          Card(
            child: ListTile(
              title: Text('Prapor'),
            ),
          ),

          Card(
            child: ListTile(
              title: Text('Therapist'),
            ),
          ),

          Card(
            child: ListTile(
              title: Text('Fence'),
            ),
          ),

          Card(
            child: ListTile(
              title: Text('Skier'),
            ),
          ),

          Card(
            child: ListTile(
              title: Text('Peacekeeper'),
            ),
          ),

          Card(
            child: ListTile(
              title: Text('Mechanic'),
            ),
          ),

          Card(
            child: ListTile(
              title: Text('Ragman'),
            ),
          ),

          Card(
            child: ListTile(
              title: Text('Jaeger'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // "push"で新規画面に遷移
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // 遷移先の画面としてリスト追加画面を指定
              return TaskAddPage();
            }),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// リスト追加画面用Widget
class TaskAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          // ボタンをクリックした時の処理
          onPressed: () {
            // "pop"で前の画面に戻る
            Navigator.of(context).pop();
          },
          child: Text('リスト追加画面（クリックで戻る）'),
        ),
      ),
    );
  }
}