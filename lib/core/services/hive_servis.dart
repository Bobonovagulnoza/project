import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HiveLocalServices {
  static Box? hive;

  static Future<void> getInstance() async {
    await Hive.initFlutter();
    await Hive.openBox("Elaro");
    hive = Hive.box("Elaro");

  }

  static Future<void> insertData(Map<String, dynamic> json) async{
    await hive?.add(json);
  }

  static List<Map<dynamic, dynamic>> readAllData() {
    List<Map<dynamic, dynamic>> list = [];
    list = hive?.values.map((e) => e as Map<dynamic, dynamic>).toList() ?? list;
    return list;
  }

  static readOneData(int index) {
    return hive?.getAt(index);
  }

  static updateData(int index, Map<dynamic, dynamic> json) async{
    await hive?.putAt(index, json);
  }
}