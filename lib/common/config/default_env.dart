part of '../config.dart';

class DefaultConfig {
  static String environment = '';
  static String app_name = '';
  static bool enableCrashAnalytics = false;
  static String defaultLanguage = '';
  static String baseUrl = '';
  static Map serverConfig = {};
  static String appConfig = '';
  static bool defaultDarkTheme = false;
  static String countryCodeDefault = 'EGY';
  static String dialCodeDefault = '+20';
  static String nameDefault = 'Egypt';
  static Map advanceConfig = {};
  static Map storeIdentifier = {};
  static Map defaultDrawer = {};
  static List defaultSettings = [];
  static Map loginSetting = {};
  static Map oneSignalKey = {};
  static List onBoardingData = [];
  static Map productDetail = {};
  static Map productVariantLayout = {};
  static Map adConfig = {};
  static Map firebaseDynamicLinkConfig = {
    'isEnabled': true,
    // Domain is the domain name for your product.
    // Let’s assume here that your product domain is “example.com”.
    // Then you have to mention the domain name as : https://example.page.link.
    'uriPrefix': 'https://fluxstoreinspireui.page.link',
    //The link your app will open
    'link': 'https://mstore.io/',
    //----------* Android Setting *----------//
    'androidPackageName': 'com.inspireui.fluxstore',
    'androidAppMinimumVersion': 1,
    //----------* iOS Setting *----------//
    'iOSBundleId': 'com.inspireui.mstore.flutter',
    'iOSAppMinimumVersion': '1.0.1',
    'iOSAppStoreId': '1469772800'
  };
  static List<Map> languagesInfo = <Map>[];
  static List<String> unsupportedLanguages = <String>[];
  static Map paymentConfig = {};
  static Map payments = {};
  static Map stripeConfig = {};
  static Map paypalConfig = {};
  static Map razorpayConfig = {};
  static Map tapConfig = {};
  static Map mercadoPagoConfig = {};
  static Map afterShip = {};
  static Map productAddons = {};
  static Map cartDetail = {};
  static Map productVariantLanguage = {};
  static int excludedCategory = 311;
  static Map saleOffProduct = {};
  static bool notStrictVisibleVariant = true;
  static Map configChat = {};
  static List<Map> smartChat = <Map>[];
  static String adminEmail = 'hello@nabolia.net';
  static String adminName = 'Nabolia';
  static Map vendorConfig = {};
  static Map loadingIcon;
  static Map productCard = {};
  static String cardFit;
  static List defaultCountryShipping = [
  {
   "name": "Egypt",
   "iosCode": "EG",
    "icon": "https://en.wikipedia.org/wiki/Flag_of_Egypt#/media/File:Flag_of_Egypt.svg"
 }];
}
