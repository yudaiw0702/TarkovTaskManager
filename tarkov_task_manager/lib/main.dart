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
          Text('Prapor'),
          Text('Therapist'),
          Text('Fence'),
          Text('Skier'),
          Text('Peacekeeper'),
          Text('Mechanic'),
          Text('Ragman'),
          Text('Jaeger'),
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