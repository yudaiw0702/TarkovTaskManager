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
            //InkWellでリップルエフェクトをかける
            child: InkWell(
              onTap: () => debugPrint("Card tapped"),
              child: Padding(
                padding: EdgeInsets.all(1.0),
                child: ListTile(
                  leading: Image.asset('assets/images/prapor.jpg', width: 50),
                  title: Text('Prapor'),
                ),
              ),
            ),
          ),

          Card(
            child: InkWell(
              onTap: () => debugPrint("Card tapped"),
              child: Padding(
                padding: EdgeInsets.all(1.0),
                child: ListTile(
                  leading: Image.asset('assets/images/therapist.jpg', width: 50),
                  title: Text('Therapist'),
                ),
              ),
            ),
          ),

          Card(
            child: InkWell(
              onTap: () => debugPrint("Card tapped"),
              child: Padding(
                padding: EdgeInsets.all(1.0),
                child: ListTile(
                  leading: Image.asset('assets/images/fence.jpg', width: 50),
                  title: Text('Fence'),
                ),
              ),
            ),
          ),

          Card(
            child: InkWell(
              onTap: () => debugPrint("Card tapped"),
              child: Padding(
                padding: EdgeInsets.all(1.0),
                child: ListTile(
                  leading: Image.asset('assets/images/skier.jpg', width: 50),
                  title: Text('Skier'),
                ),
              ),
            ),
          ),

          Card(
            child: InkWell(
              onTap: () => debugPrint("Card tapped"),
              child: Padding(
                padding: EdgeInsets.all(1.0),
                child: ListTile(
                  leading: Image.asset('assets/images/peacekeeper.jpg', width: 50),
                  title: Text('Peacekeeper'),
                ),
              ),
            ),
          ),

          Card(
            child: InkWell(
              onTap: () => debugPrint("Card tapped"),
              child: Padding(
                padding: EdgeInsets.all(1.0),
                child: ListTile(
                  leading: Image.asset('assets/images/mechanic.jpg', width: 50),
                  title: Text('Mechanic'),
                ),
              ),
            ),
          ),

          Card(
            child: InkWell(
              onTap: () => debugPrint("Card tapped"),
              child: Padding(
                padding: EdgeInsets.all(1.0),
                child: ListTile(
                  leading: Image.asset('assets/images/ragman.jpg', width: 50),
                  title: Text('Ragman'),
                ),
              ),
            ),
          ),

          Card(
            child: InkWell(
              onTap: () => debugPrint("Card tapped"),
              child: Padding(
                padding: EdgeInsets.all(1.0),
                child: ListTile(
                  leading: Image.asset('assets/images/jaeger.jpg', width: 50),
                  title: Text('Jaeger'),
                ),
              ),
            ),
          ),

          Card(
            child: InkWell(
              onTap: () => debugPrint("Card tapped"),
              child: Padding(
                padding: EdgeInsets.all(1.0),
                child: ListTile(
                  leading: Image.asset('assets/images/kappa_container.png', width: 50),
                  title: Text('Kappaまでに必要なアイテム'),
                ),
              ),
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