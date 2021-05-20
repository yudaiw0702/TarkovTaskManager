import 'package:flutter/material.dart';
import 'package:tarkov_task_manager/screens/item_list_screen.dart';

class Item {
  String name;
  String status;
  String message;
  String image;
  int itemsNeeded;
  int count;

  Item({
    Key key,
    this.name,
    this.status,
    this.message,
    this.image,
    this.itemsNeeded,
    this.count,
  });
}

List<Item> items = [
  Item(
    name: 'FlashDrive',
    message: '進行中',
    image: 'Secure_Flash_drive_Icon.png',
    status: 'false',
    itemsNeeded: 5,
    count: 0,
  ),
  Item(
    name: 'GasAnalyzer',
    message: '進行中',
    image: 'Gas_Analyzer_Icon.png',
    status: 'false',
    itemsNeeded: 3,
    count: 0,
  ),
  Item(
    name: 'Salewa',
    message: '進行中',
    image: 'Salewa_Icon.png',
    status: 'false',
    itemsNeeded: 3,
    count: 0,
  ),
  Item(
    name: 'Morphine',
    message: '進行中',
    image: 'Morphine_Icon.png',
    status: 'false',
    itemsNeeded: 4,
    count: 0,
  ),
  Item(
    name: 'SparkPlug',
    message: '進行中',
    image: 'Spark_Plug_Icon.png',
    status: 'false',
    itemsNeeded: 8,
    count: 0,
  ),
];
