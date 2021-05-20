import 'package:flutter/material.dart';
import 'package:tarkov_task_manager/screens/item_checklist_screen.dart';

class FlashDrive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTileItem(
      name: 'FlashDrive',
      message: 'アイテム説明とか',
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
      message: 'セラピストに必要なアイテム',
      image: 'Gas_Analyzer_Icon.png',
      itemsNeeded: 3,
    );
  }
}

class Salewa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTileItem(
      name: 'Salewa',
      message: 'セラピストに必要なアイテム',
      image: 'Salewa_Icon.png',
      itemsNeeded: 3,
    );
  }
}

class Morphine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTileItem(
      name: 'Morphine',
      message: 'セラピストに必要なアイテム',
      image: 'Morphine_Icon.png',
      itemsNeeded: 4,
    );
  }
}

class SparkPlug extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTileItem(
      name: 'SparkPlug',
      message: 'セラピストに必要なアイテム',
      image: 'Spark_Plug_Icon.png',
      itemsNeeded: 8,
    );
  }
}
