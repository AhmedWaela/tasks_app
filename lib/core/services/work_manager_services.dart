import 'package:workmanager/workmanager.dart';

class WorkManagerServices {
  Future<void> initialize() async {
    await Workmanager().initialize(callbackDispatcher);
  }
}

void callbackDispatcher() {}
