import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fstore/models/AppGain/AppGain.dart';
import 'package:fstore/models/AppGain/textfieldappgain.dart';
import 'package:provider/provider.dart';
import 'package:uni_links/uni_links.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:flutter/services.dart';

import '../../common/config.dart';
import '../../common/constants.dart';
import '../../common/tools.dart';
import '../../common/wrappers/one_sinnal/one_signal_wapper.dart';
import '../../models/app_model.dart';
import '../../models/index.dart' show Product, ProductModel;
import '../../models/point_model.dart';
import '../../models/user_model.dart';
import '../../screens/base.dart';
import '../../screens/index.dart' show ProductDetailScreen;
import '../../services/index.dart';
import '../../widgets/home/background.dart';
import '../../widgets/home/fake_status_bar.dart';
import '../../widgets/home/index.dart';
import 'deeplink_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}


Future _initSDK() async {
  var data = {
    'appId': '6091222301584b000c4a4f53',
    'apiKey':
    'b516845d5cfc29b1c38154f424b96cf41ad064fb71a0a9321f0be60717b39c46',
    'configure': true
  };

  await Appgain().initAppgainSDK(data);

  await Future.delayed(Duration(seconds: 50), () {
    Appgain().matchLink();

  });


  // await Appgain().matchLink();
  // TextFieldAlertDialog().displayDialog(myContext);
}

enum UniLinksType { string, uri }


class HomeScreenState extends BaseScreen<HomeScreen> with AutomaticKeepAliveClientMixin<HomeScreen> {
  String _initialLink;
  Uri _initialUri;
  String _latestLink = 'Unknown';
  Uri _latestUri;
  StreamSubscription _sub;

  UniLinksType _type = UniLinksType.string;

  static BuildContext homeContext;

  static BuildContext loadingContext;

  @override
  bool get wantKeepAlive => true;

  // Uri _latestUri;
  // StreamSubscription _sub;
  int itemId;
  changeRoute(Uri linkk) async {
    String link = linkk.toString();
    if (link.contains("product-category/")) {
      link = linkk.path.replaceAll("/", "").replaceAll("%20", " ");
      print('category name: $link');

      moveToCategory(link);
    } else if (link.contains("product/")) {
      link = linkk.path.replaceAll("/", "").replaceAll("%20", " ");
      print('product name: $link');

      moveToProduct(link);
    } else if (link.contains("tag/")) {
      link = linkk.path.replaceAll("/", "").replaceAll("%20", " ");
      print('tag name: $link');

      moveToTag(link);
    }
  }

  moveToCategory(String category) async {
    int time = 12;
    if (context != null) {
      time = 1;
    }
    await Future.delayed(Duration(seconds: time), () {
      final data = Provider.of<AppModel>(context, listen: false).appConfig;

      for (int r = 0; r < data["HorizonLayout"][2]["items"].length; r++) {
        if (data["HorizonLayout"][2]["items"][r]['name'] == category) {
          ProductModel.showList(
            config: data["HorizonLayout"][2]["items"][r],
            context: context,
            products: data["HorizonLayout"][2]["items"][r]["data"] ?? [],
          );
        }
      }
    });
  }

  moveToProduct(String productName) async {
    int time = 12;
    if (context != null) {
      time = 1;
    }
    Product product;
    Future.delayed(Duration(seconds: time), () async {
      // product = await Services().getProductBySlug(productName);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //       builder: (context) => ProductDetailScreen(product: product)),
      // );
    });
  }

  moveToTag(String tagName) async {
    int time = 12;
    if (context != null) {
      time = 1;
    }
    await Future.delayed(Duration(seconds: time), () {
      final data = Provider.of<AppModel>(context, listen: false).appConfig;
      print(data);
      print("=======================");
      for (int r = 0; r < data["HorizonLayout"][1]["items"].length; r++) {
        print("-------");

        print("---tag----");

        print(data["HorizonLayout"][1]["items"][r]["tag"].toString());
        if (data["HorizonLayout"][1]["items"][r]["tag"].toString() == tagName) {
          print('here ragaie data-- ge on loop1');
          print(data["HorizonLayout"][1]["items"][r]);
          print('here ragaie data-- ge on loop2');

          print(data["HorizonLayout"][2]["items"][r]);

          ProductModel.showList(
            config: data["HorizonLayout"][2]["items"][r],
            context: context,
            tag: tagName,
            products: data["HorizonLayout"][1]["items"][r]["data"] ?? [],
          );
        }
      }
      //}
    });
  }

  @override
  void dispose() {
    printLog("[Home] dispose");
    _sub?.cancel();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    initPlatformState();
    _initSDK();
    printLog("[Home] initState");
    super.initState();
  }

  Future<void> initPlatformState() async {
    if (_type == UniLinksType.string) {
      await initPlatformStateForStringUniLinks();
    } else {
      await initPlatformStateForUriUniLinks();
    }
  }

  Future<void> initPlatformStater() async {
    if (_type == UniLinksType.string) {
      await initUniLinks();
    } else {
      await initUniLinkss();
    }
  }

  StreamSubscription _sub1;

  Future<Null> initUniLinks() async {
    // ... check initialLink

    // Attach a listener to the stream
    _sub1 = getLinksStream().listen((String link) {
      // Parse the link and warn the user, if it is not correct
      TextFieldAlertDialog().showAlertDialog(link);
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
    });

    // NOTE: Don't forget to call _sub.cancel() in dispose()
  }

  Future<Null> initUniLinkss() async {
    // ... check initialUri

    // Attach a listener to the stream
    _sub1 = getUriLinksStream().listen((Uri uri) {
      TextFieldAlertDialog().showAlertDialog(uri?.toString() ?? 'Unknown');

      // Use the uri and warn the user, if it is not correct
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
    });

    // NOTE: Don't forget to call _sub.cancel() in dispose()
  }

  /// An implementation using a [String] link
  Future<void> initPlatformStateForStringUniLinks() async {
    /* Product x;
    x.name = "00000000000";
    Navigator.of(
      context,
    ).pushNamed(
      RouteList.productDetail,
      arguments: x,
    );*/
    // changeRoute();
    // Attach a listener to the link s stream
    _sub = getLinksStream().listen((String link) {
      if (link != null) {
        _latestUri = Uri.parse(link);

        changeRoute(_latestUri);
      }
    }, onError: (Object err) {
      if (!mounted) return;
      setState(() {
        _latestLink = 'Failed to get latest link: $err.';
        _latestUri = null;
      });
    });

    // Attach a second listener to the stream
    getLinksStream().listen((String link) {
      print('got link: $link');
    }, onError: (Object err) {
      print('got err: $err');
    });

    // Get the latest link
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _initialLink = await getInitialLink();
      print('initial link: $_initialLink');
      if (_initialLink != null) {
        _initialUri = Uri.parse(_initialLink);

        changeRoute(_initialUri);
      }
    } on PlatformException {
      _initialLink = 'Failed to get initial link.';
      _initialUri = null;
    } on FormatException {
      _initialLink = 'Failed to parse the initial link as Uri.';
      _initialUri = null;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _latestLink = _initialLink;
      _latestUri = _initialUri;
    });
  }

////////////////////////////////////////////////////////////////////////////////////////
  /// An implementation using the [Uri] convenience helpers
  Future<void> initPlatformStateForUriUniLinks() async {
    // Attach a listener to the Uri links stream
    _sub = getUriLinksStream().listen((Uri uri) {
      if (!mounted) return;
      setState(() {
        _latestUri = uri;
        _latestLink = uri?.toString() ?? 'Unknown';
      });
    }, onError: (Object err) {
      if (!mounted) return;
      setState(() {
        _latestUri = null;
        _latestLink = 'Failed to get latest link: $err.';
      });
    });

    // Attach a second listener to the stream
    getUriLinksStream().listen((Uri uri) {
      print('got uri: ${uri?.path} ${uri?.queryParametersAll}');
    }, onError: (Object err) {
      print('got err: $err');
    });

    // Get the latest Uri
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _initialUri = await getInitialUri();
      print('initial uri: ${_initialUri?.path}'
          ' ${_initialUri?.queryParametersAll}');
      _initialLink = _initialUri?.toString();
    } on PlatformException {
      _initialUri = null;
      _initialLink = 'Failed to get initial uri.';
    } on FormatException {
      _initialUri = null;
      _initialLink = 'Bad parse the initial link as Uri.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _latestUri = _initialUri;
      _latestLink = _initialLink;
    });
  }

  // Future<void> initPlatformStateForStringUniLinks() async {
  //   // Attach a listener to the links stream
  //   _sub = getLinksStream().listen((String link) {
  //     if (!mounted) return;
  //     setState(() {
  //       _latestUri = null;
  //       try {
  //         if (link != null) _latestUri = Uri.parse(link);
  //         setState(() {
  //           itemId = int.parse(_latestUri.path.split('/')[1]);
  //         });

  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => ItemDeepLink(
  //               itemId: itemId,
  //             ),
  //           ),
  //         );
  //       } on FormatException {
  //         printLog('[initPlatformStateForStringUniLinks] error');
  //       }
  //     });
  //   }, onError: (err) {
  //     if (!mounted) return;
  //     setState(() {
  //       _latestUri = null;
  //     });
  //   });

  //   getLinksStream().listen((String link) {
  //     printLog('got link: $link');
  //   }, onError: (err) {
  //     printLog('got err: $err');
  //   });
  // }


  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    printLog('[Home] afterFirstLayout');

    Future.delayed(
        const Duration(seconds: 1),
        () => Utils.changeStatusBarColor(
            Provider.of<AppModel>(context, listen: false).themeMode));

    homeContext = context;

    if (OneSignalWapper.hasNotificationData &&
        OneSignalWapper.productIdArray.isNotEmpty) {
      showLoading(context);
    }

    final userModel = Provider.of<UserModel>(context, listen: false);

    if (userModel.user != null &&
        userModel.user.cookie != null &&
        kAdvanceConfig['EnableSyncCartFromWebsite']) {
      await Services()
          .widget
          .syncCartFromWebsite(userModel.user.cookie, context);
    }

    if (userModel.user != null && userModel.user.cookie != null) {
      await Provider.of<PointModel>(context, listen: false)
          .getMyPoint(userModel.user.cookie);
    }

    DynamicLinkService();

    ShowNotificationOffer(context);
  }

  // ignore: always_declare_return_types
  static ShowNotificationOffer(BuildContext context) async {
    if (OneSignalWapper.hasNotificationData &&
        OneSignalWapper.productIdArray.isNotEmpty) {
      var loadedProducts = <Product>[];
      loadedProducts.clear();
      final _service = Services();
      for (var i = 0; i < OneSignalWapper.productIdArray.length; i++) {
        var newProduct =
            await _service.api.getProduct(OneSignalWapper.productIdArray[i]);
        loadedProducts.add(newProduct);
      }
      hideLoading();
      var loadedCategoryID = OneSignalWapper.categoryID;
      OneSignalWapper.hasNotificationData = false;
      OneSignalWapper.productIdArray.clear();
      OneSignalWapper.categoryID = 'null';
      if (loadedProducts.length == 1) {
        return Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) =>
                  ProductDetailScreen(product: loadedProducts[0]),
              fullscreenDialog: true,
            ));
      } else if (loadedProducts.length > 1) {
        dynamic config;
        if (loadedCategoryID != 'null') {
          config = {'category': loadedCategoryID, 'name': 'Hot Offers!'};
        } else {
          config = {'category': '15', 'name': 'Hot Offers!'};
        }
        await ProductModel.showList(
            context: context, config: config, products: loadedProducts);
      }
    }
  }

  // ignore: always_declare_return_types
  static showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        loadingContext = context;
        return Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(5.0)),
            padding: const EdgeInsets.all(50.0),
            child: kLoadingWidget(context),
          ),
        );
      },
    );
  }

  // ignore: always_declare_return_types
  static hideLoading() {
    Navigator.of(loadingContext).pop();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    printLog('[Home] build');
    return Consumer<AppModel>(
      builder: (context, value, child) {
        if (value.appConfig == null) {
          return kLoadingWidget(context);
        }
        bool isStickyHeader = value.appConfig['Setting'] != null
            ? (value.appConfig['Setting']['StickyHeader'] ?? false)
            : false;

        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: Stack(
            children: <Widget>[
              if (value.appConfig['Background'] != null)
                isStickyHeader
                    ? SafeArea(
                        child: HomeBackground(
                          config: value.appConfig['Background'],
                        ),
                      )
                    : HomeBackground(config: value.appConfig['Background']),
              HomeLayout(
                isPinAppBar: isStickyHeader,
                isShowAppbar: value.appConfig['HorizonLayout'][0]['layout'] == 'logo',
                configs: value.appConfig,
                key: Key(value.langCode),
              ),
              const FakeStatusBar(),
            ],
          ),
        );
      },
    );
  }
}
