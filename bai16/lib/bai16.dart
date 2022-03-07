import 'dart:async';
import 'package:flutter/services.dart';

class MyBrowser {
  static const MethodChannel _channel = const MethodChannel('my_browser');
  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion'); return version;
  }
  Future<void> openBrowser(String urlString) async {
    try {
      final int result = await _channel.invokeMethod(
          'openBrowser', <String, String>{'url': urlString});
    }
    on PlatformException catch (e) {
      // Unable to open the browser print(e);
    }
  }
}