import 'package:flutter/services.dart';

class FlutterMethodChannel {
  static const channelName = 'channel';
  MethodChannel methodChannel;

  static final FlutterMethodChannel instance = FlutterMethodChannel._init();
  FlutterMethodChannel._init();

  void configureChannel() {
    methodChannel = MethodChannel(channelName);
  }
}
