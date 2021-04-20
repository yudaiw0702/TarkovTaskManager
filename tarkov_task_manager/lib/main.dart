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

          Row(
            children: [
              Text('タスク進捗：0%'),
              Text('獲得アイテム数：0/100'),
            ],
          ),

          TraderCard(
            image: 'prapor',
            text: 'Prapor',
          ),

          TraderCard(
            image: 'therapist',
            text: 'Therapist',
          ),

          TraderCard(
            image: 'fence',
            text: 'Fence',
          ),

          TraderCard(
            image: 'skier',
            text: 'Skier',
          ),

          TraderCard(
            image: 'peacekeeper',
            text: 'Peacekeeper',
          ),

          TraderCard(
            image: 'mechanic',
            text: 'Mechanic',
          ),

          TraderCard(
            image: 'ragman',
            text: 'Ragman',
          ),

          TraderCard(
            image: 'jaeger',
            text: 'Jaeger',
          ),

          Card(
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ItemPage(),),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(1.0),
                child: ListTile(
                  leading: Image.asset('assets/images/kappa_container.png', width: 50),
                  title: Text('Kappa取得までに必要なアイテム'),
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

//トレーダーカード
class TraderCard extends StatelessWidget {
  final String text;
  final String image;
  const TraderCard({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(

        //タップされたときの動作
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Mypage(),),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(1.0),
          child: ListTile(
            leading: Image.asset('assets/images/$image.jpg', width: 50),
            title: Text(text),
          ),
        ),
      ),
    );
  }
}

//画面遷移
class Mypage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TraderName')),
      body: Center(
        child: Text('遷移しました'),
      ),
    );
  }
}

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('アイテムチェックリスト')),
      body: Center(
        child: Text('遷移しました'),
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