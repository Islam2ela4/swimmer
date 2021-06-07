import 'package:flutter/services.dart';

class Appgain {

  static const appgainPlatform = MethodChannel('com.Appgain.io/AppgainSDK');
  final _initalizeAppgainSDK = 'initSDK';
  final _gettingUserId = 'getUserID';
  final _createMatchLink = 'matchLink';
  final _createfireAutomatorWithPersonalization = 'fireAutomatorWithPersonalization';
  final _cancelfireAutomatorWithPersonalization = 'cancelfireAutomator'; //cancel automator
  final _createfireAutomator = 'fireAutomator';
  final _setUpuserId = 'setuserId';
  final _logNewPurchase = 'addPurchase';
  final _enableReciveNotificationWith = 'enableReciveNotification';
  final _createNotificationChannel = 'addNotificationChannel';
  final _updateUserWith = 'updateUser';
  final _logEventwith = 'logEvent';
  //parameter :-
// appId (String)
// apiKey (String)
// configure (Bool)
// Output : -  callback with two parameter
  ///   response  as string
  ///    info dictionary
  ///
  ///
  ///

  Future initAppgainSDK(Map data) async {
    try {
      // var data =  {'appId':'value1','apiKey':'value1','configure':'value1'};
      await appgainPlatform
          .invokeMethod(_initalizeAppgainSDK, data)
          .then((result) {
        //add what you like here
       // matchLink();
        print(result);
                print("start check matching");

      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  Future matchLink() async {
    try {
      await appgainPlatform.invokeMethod(_createMatchLink, '').then((result) {
        //add what you like here
        print(result);
      });
    } on PlatformException catch (e) {
      print(e.message + "eeeeeeeeeerrrrorrrr");
    }
  }

  //
  Future fireAutomator(Map data) async {
    try {
      //  var data = {'triggerPointName':'value'};
      await appgainPlatform
          .invokeMethod(_createfireAutomator, data)
          .then((result) {
        //add what you like here
        print(result);
      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  Future fireAutomatorWithPersonalization(Map data) async {
    try {
      // var data = {'triggerPointName':'value','personalizationMap':{'key':'value','key':'value','key':'value'}};

      await appgainPlatform
          .invokeMethod(_createfireAutomatorWithPersonalization, data)
          .then((result) {
        //add what you like here
        print(result);
      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

//
  Future cancelfireAutomatorWithPersonalization(Map data) async {
    try {
      await appgainPlatform
          .invokeMethod(_cancelfireAutomatorWithPersonalization, data)
          .then((result) {
        //add what you like here
        print(result);
      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  Future getUserId() async {
    try {
      await appgainPlatform.invokeMethod(_gettingUserId, '').then((result) {});
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  //
  Future addNotificationChannel(Map data) async {
    try {
      await appgainPlatform
          .invokeMethod(_createNotificationChannel, data)
          .then((result) {
        //add what you like here
        print(result);
      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  Future setUserId(Map data) async {
    try {
      // var data = {'productName':'productName','curruncy':'sr','amount':22};
      await appgainPlatform.invokeMethod(_setUpuserId, data).then((result) {
        //add what you like here
        print(result);
      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
  //
  Future addPurchase(Map data) async {
    try {
      // var data = {'productName':'productName','curruncy':'sr','amount':22};
      await appgainPlatform.invokeMethod(_logNewPurchase, data).then((result) {
        //add what you like here
        print(result);
      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  Future enableReciveNotification(String type) async {
    try {
      var data = {'enable': 1, 'type': type};
      await appgainPlatform
          .invokeMethod(_enableReciveNotificationWith, data)
          .then((result) {
        //add what you like here
        print(result);
        // TextFieldAlertDialog().showAlertDialog( result.toString());
        // TextFieldAlertDialog().showAlertDialog("success");
      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
//MARK: log event
//type (String)
//action (String)
// Output : -  callback with two parameter
  ///   response  as string
  ///    info dictionary

  Future logEvent(Map data) async {
    //var data = {'type': 'testType', 'action': 'testAction'};
    try {
      await appgainPlatform.invokeMethod(_logEventwith, data).then((result) {
        //add what you like here
        print(result);
      });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }
}
