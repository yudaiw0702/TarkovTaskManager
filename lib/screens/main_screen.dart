import 'package:flutter/material.dart';
import 'package:tarkov_task_manager/models/trader_card_model.dart';
import 'package:tarkov_task_manager/screens/item_checklist_screen.dart';
import 'package:tarkov_task_manager/screens/item_checklist_screen_test.dart';
import 'dart:math' as math;


class TaskListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBarの表示とタイトル設定
      appBar: AppBar(title: Text('タスク一覧')),
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
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ItemListScreen(),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(1.0),
                child: ListTile(
                  leading: Image.asset('assets/images/kappa_container.png',
                      width: 50),
                  title: Text('Kappa取得までに必要なアイテム'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
