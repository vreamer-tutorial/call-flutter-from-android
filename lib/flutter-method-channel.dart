import 'package:direct_reply_notification/data-service.dart';
import 'package:flutter/services.dart';

class FlutterMethodChannel {
  static const channelName = 'channel';
  MethodChannel methodChannel;

  static final FlutterMethodChannel instance = FlutterMethodChannel._init();
  FlutterMethodChannel._init();

  void configureChannel() {
    methodChannel = MethodChannel(channelName);
    methodChannel.setMethodCallHandler(this.methodHandler);
  }

  Future<void> methodHandler(MethodCall call) async {
    final String idea = call.arguments;

    switch (call.method) {
      case "showNewIdea":
        DataService.instance.addIdea(idea);
        break;
      default:
        print('no method handler for method ${call.method}');
    }
  }
}
