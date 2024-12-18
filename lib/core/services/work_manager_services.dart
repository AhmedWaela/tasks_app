import 'package:workmanager/workmanager.dart';

class WorkManagerServices {
  static Future<void> initialize() async {
    await Workmanager().initialize(callbackDispatcher);
  }

  static Future<void> registerMyTask() async {
    await Workmanager().registerOneOffTask('id1', 'task1');
  }
}

void callbackDispatcher() {}
