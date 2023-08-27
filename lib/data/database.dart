import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  //reference to hive box
  final _myBox = Hive.openBox('mybox');
}
