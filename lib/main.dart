import 'package:flutter/material.dart';
import 'package:tarkov_task_manager/screens/main_screen.dart';

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

