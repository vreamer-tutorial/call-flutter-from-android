import 'package:direct_reply_notification/data-service.dart';
import 'package:direct_reply_notification/flutter-method-channel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
  FlutterMethodChannel.instance.configureChannel();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Idea from Native Android'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Idea(),
              ],
            ),
          ),
        ));
  }
}

class Idea extends StatelessWidget {
  const Idea({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: DataService.instance.ideaController.stream,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Text(
              snapshot.data,
              style: Theme.of(context).textTheme.headline4,
            );
          }

          return Text(
            "Waiting for new idea",
            style: Theme.of(context).textTheme.headline4,
          );
        });
  }
}
