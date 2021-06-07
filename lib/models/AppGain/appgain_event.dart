import 'dart:async';

import 'package:flutter/services.dart';
import 'package:fstore/models/appgain/textfieldappgain.dart';

abstract class Bloc {
  void dispose();
}

class DeepLinkBloc extends Bloc {

 //Event Channel creation
  static const stream = const EventChannel('com.Appgain.io/AppgainSDKEvent');


  StreamController<String> _stateController = StreamController();

  Stream<String> get state => _stateController.stream;

  Sink<String> get stateSink => _stateController.sink;


  //Adding the listener into contructor
  DeepLinkBloc() {
    //Checking application start by deep link
              TextFieldAlertDialog().showAlertDialog("HELLO URL DeepLinkBloc");

    startUri().then(_onRedirected);


    //Checking broadcast stream, if deep link was clicked in opened appication
    stream.receiveBroadcastStream().listen((d) => _onRedirected(d));
  }


  _onRedirected(String uri) {
    // Here can be any uri analysis, checking tokens etc, if it’s necessary
    // Throw deep link URI into the BloC's stream
          TextFieldAlertDialog().showAlertDialog(uri);

    stateSink.add(uri);
  }


  @override
  void dispose() {
                  TextFieldAlertDialog().showAlertDialog("HELLO URL dispose");

    _stateController.close();
  }


  Future<String> startUri() async {
                  TextFieldAlertDialog().showAlertDialog("HELLO URL startUri");

    // try {
    //   return platform.invokeMethod('initialLink');
    // } on PlatformException catch (e) {
    //   return "Failed to Invoke: '${e.message}'.";
    // }
  }
} 
