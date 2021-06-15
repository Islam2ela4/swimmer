// ignore_for_file: prefer_single_quotes, lines_longer_than_80_chars final

Map<String, dynamic> environment = {
  "appConfig": "lib/config/config_en.json",
  "serverConfig": {
    "accessToken": "ed3cb187b21d80b208a6f57feb0ecc38",
    "blog": "https://mstore.io",
    "url": "https://swimming-store-egypt.myshopify.com/",
    "type": "shopify"
  },
  "defaultDarkTheme": false,
  "loginSMSConstants": {
    "countryCodeDefault": "EG",
    "dialCodeDefault": "+20",
    "nameDefault": "Egypt"
  },
  "storeIdentifier": {
    "disable": true,
    "android": "com.swimmingstore.app",
    "ios": "1499641231"
  },
  "advanceConfig": {
    "DefaultLanguage": "en",
    "DetailedBlogLayout": "halfSizeImageType",
    "EnablePointReward": true,
    "hideOutOfStock": false,
    "EnableRating": true,
    "hideEmptyProductListRating": true,
    "EnableShipping": true,
    "EnableSkuSearch": true,
    "showStockStatus": true,
    "GridCount": 3,
    "isCaching": false,
    "kIsResizeImage": false,
    "DefaultCurrency": {
      "symbol": "\LE",
      "decimalDigits": 2,
      "symbolBeforeTheNumber": true,
      "currency": "LE",
      "currencyCode": "LE",
      "smallestUnitRate": 100
    },
    "Currencies": [
      {
        "symbol": "LE",
        "decimalDigits": 2,
        "symbolBeforeTheNumber": true,
        "currency": "LE",
        "currencyCode": "LE",
        "smallestUnitRate": 100
      },
      {
        "symbol": "LE",
        "decimalDigits": 2,
        "symbolBeforeTheNumber": true,
        "currency": "LE",
        "currencyCode": "LE"
      },
      {
        "symbol": "€",
        "decimalDigits": 2,
        "symbolBeforeTheNumber": true,
        "currency": "EUR",
        "currencyCode": "EUR"
      },
      {
        "symbol": "£",
        "decimalDigits": 2,
        "symbolBeforeTheNumber": true,
        "currency": "Pound sterling",
        "currencyCode": "gbp",
        "smallestUnitRate": 100
      },
      {
        "symbol": "LE",
        "decimalDigits": 2,
        "symbolBeforeTheNumber": true,
        "currency": "LE",
        "currencyCode": "LE"
      }
    ],
    "DefaultStoreViewCode": "",
    "EnableAttributesConfigurableProduct": ["color", "size"],
    "EnableAttributesLabelConfigurableProduct": ["color", "size"],
    "isMultiLanguages": true,
    "EnableApprovedReview": false,
    "EnableSyncCartFromWebsite": false,
    "EnableSyncCartToWebsite": false,
    "EnableShoppingCart": false,
    "EnableFirebase": true,
    "RatioProductImage": 1.2,
    "EnableCouponCode": true,
    "ShowCouponList": true,
    "ShowAllCoupons": true,
    "ShowExpiredCoupons": true,
    "AlwaysShowTabBar": false,
    "PrivacyPoliciesPageId": 25569,
    "QueryRadiusDistance": 10
  },
  "defaultDrawer": {
    "logo": "assets/images/logo.png",
    "background": null,
    "items": [
      {"type": "home", "show": true},
      {"type": "blog", "show": true},
      {"type": "categories", "show": true},
      {"type": "cart", "show": true},
      {"type": "profile", "show": true},
      {"type": "login", "show": true},
      {"type": "category", "show": true}
    ]
  },
  "defaultSettings": [
    "products",
    "chat",
    "wishlist",
    "notifications",
    "language",
    "currencies",
    "darkTheme",
    "order",
    "point",
    "rating",
    "privacy",
    "about"
  ],
  "loginSetting": {
    "IsRequiredLogin": false,
    "showAppleLogin": false,
    "showFacebook": false,
    "showSMSLogin": false,
    "showGoogleLogin": false,
    "showPhoneNumberWhenRegister": false,
    "requirePhoneNumberWhenRegister": false
  },
  "oneSignalKey": {
    "enable": false,
    "appID": "8b45b6db-7421-45e1-85aa-75e597f62714"
  },
  "onBoardingData": [
    {"title": "", "image": "assets/images/fogg-delivery-1.png", "desc": ""},
    {
      "title": "",
      "image": "assets/images/fogg-uploading-1.png",
      "desc":
          "See all things happening around you just by a click in your phone. Fast, convenient and clean."
    },
    {
      "title": "Let's Get Started",
      "image": "fogg-order-completed.png",
      "desc": "Waiting no more, let's see what we get!"
    }
  ],
  "adConfig": {
    "enable": false,
    "facebookTestingId": "",
    "googleTestingId": ["123", "457"],
    "ads": [
      {
        "type": "banner",
        "provider": "google",
        "iosId": "ca-app-pub-3940256099942544/2934735716",
        "androidId": "ca-app-pub-3940256099942544/6300978111",
        "showOnScreens": ["home", "search"],
        "hideOnScreens": []
      },
      {
        "type": "banner",
        "provider": "google",
        "iosId": "ca-app-pub-2101182411274198/5418791562",
        "androidId": "ca-app-pub-2101182411274198/4052745095",
        "hideOnScreens": []
      },
      {
        "type": "interstitial",
        "provider": "google",
        "iosId": "ca-app-pub-3940256099942544/4411468910",
        "androidId": "ca-app-pub-3940256099942544/4411468910",
        "hideOnScreens": []
      },
      {
        "type": "reward",
        "provider": "google",
        "iosId": "ca-app-pub-3940256099942544/1712485313",
        "androidId": "ca-app-pub-3940256099942544/4411468910",
        "hideOnScreens": []
      },
      {
        "type": "banner",
        "provider": "facebook",
        "iosId": "IMG_16_9_APP_INSTALL#430258564493822_876131259906548",
        "androidId": "IMG_16_9_APP_INSTALL#430258564493822_489007588618919",
        "hideOnScreens": []
      },
      {
        "type": "interstitial",
        "provider": "facebook",
        "iosId": "430258564493822_489092398610438",
        "androidId": "IMG_16_9_APP_INSTALL#430258564493822_489092398610438",
        "hideOnScreens": []
      }
    ]
  },
  "firebaseDynamicLinkConfig": {
    "isEnabled": true,
    "uriPrefix": "https://fluxstoreinspireui.page.link",
    "link": "https://mstore.io/",
    "androidPackageName": "com.appgain.nabolia",
    "androidAppMinimumVersion": 1,
    "iOSBundleId": "com.inspireui.mstore.flutter",
    "iOSAppMinimumVersion": "1.0.1",
    "iOSAppStoreId": "1469772800"
  },
  "languagesInfo": [
    {
      "name": "English",
      "icon": "assets/images/country/gb.png",
      "code": "en",
      "text": "English",
      "storeViewCode": ""
    },
    {
      "name": "Arabic",
      "icon": "assets/images/country/ar.png",
      "code": "ar",
      "text": "Arabic",
      "storeViewCode": "ar"
    }
  ],
  "unsupportedLanguages": ["ku"],
  "paymentConfig": {
    "DefaultCountryISOCode": "EGY",
    "DefaultStateISOCode": "EG-C",
    "EnableShipping": true,
    "EnableAddress": true,
    "EnableCustomerNote": true,
    "EnableAddressLocationNote": false,
    "EnableAlphanumericZipCode": false,
    "EnableReview": false,
    "allowSearchingAddress": true,
    "GuestCheckout": true,
    "EnableOnePageCheckout": true,
    "NativeOnePageCheckout": false,
    "CheckoutPageSlug": {"en": "checkout"},
    "EnableCreditCard": true,
    "UpdateOrderStatus": false,
    "ShowOrderNotes": true,
    "EnableRefundCancel": false
  },
  "payments": {
    "paypal": "assets/icons/payment/paypal.png",
    "stripe": "assets/icons/payment/stripe.png",
    "razorpay": "assets/icons/payment/razorpay.png",
    "tap": "assets/icons/payment/tap.png"
  },
  "stripeConfig": {
    "serverEndpoint": "https://stripe-server.vercel.app",
    "publishableKey": "pk_test_MOl5vYzj1GiFnRsqpAIHxZJl",
    "enabled": true,
    "paymentMethodId": "stripe",
    "returnUrl": "nabolia://inspireui.com",
    "enableManualCapture": false
  },
  "paypalConfig": {
    "clientId":
        "ASlpjFreiGp3gggRKo6YzXMyGM6-NwndBAQ707k6z3-WkSSMTPDfEFmNmky6dBX00lik8wKdToWiJj5w",
    "secret":
        "ECbFREri7NFj64FI_9WzS6A0Az2DqNLrVokBo0ZBu4enHZKMKOvX45v9Y1NBPKFr6QJv2KaSp5vk5A1G",
    "production": false,
    "paymentMethodId": "paypal",
    "enabled": true
  },
  "razorpayConfig": {
    "keyId": "rzp_test_SDo2WKBNQXDk5Y",
    "keySecret": "RrgfT3oxbJdaeHSzvuzaJRZf",
    "paymentMethodId": "razorpay",
    "enabled": true
  },
  "tapConfig": {
    "SecretKey": "sk_test_XKokBfNWv6FIYuTMg5sLPjhJ",
    "paymentMethodId": "tap",
    "enabled": true
  },
  "mercadoPagoConfig": {
    "accessToken":
        "TEST-5726912977510261-102413-65873095dc5b0a877969b7f6ffcceee4-613803978",
    "production": false,
    "paymentMethodId": "woo-mercado-pago-basic",
    "enabled": true
  },
  "defaultCountryShipping": [
    {"name": "Egypt", "iosCode": "EG", "icon": "EG"}
  ],
  "afterShip": {
    "api": "e2e9bae8-ee39-46a9-a084-781d0139274f",
    "tracking_url": "https://fluxstore.aftership.com"
  },
  "productDetail": {
    "height": 0.41236891984105417,
    "marginTop": 0.0,
    "safeArea": false,
    "showVideo": false,
    "showBrand": false,
    "showThumbnailAtLeast": 1,
    "layout": "simpleType",
    "borderRadius": 3.0,
    "enableReview": false,
    "attributeImagesSize": 50.0,
    "showSku": true,
    "showStockQuantity": true,
    "showProductCategories": true,
    "showProductTags": false,
    "hideInvalidAttributes": false
  },
  "productVariantLayout": {
    "color": "color",
    "size": "box",
    "height": "option",
    "color-image": "image"
  },
  "productAddons": {
    "allowImageType": true,
    "allowVideoType": true,
    "allowCustomType": true,
    "allowedCustomType": ["png", "pdf", "docx"],
    "allowMultiple": false,
    "fileUploadSizeLimit": 5.0
  },
  "cartDetail": {"minAllowTotalCartValue": 0, "maxAllowQuantity": 10},
  "productVariantLanguage": {
    "en": {
      "color": "Color",
      "size": "Size",
      "height": "Height",
      "color-image": "Color"
    },
    "ar": {
      "color": "اللون",
      "size": "بحجم",
      "height": "ارتفاع",
      "color-image": "اللون"
    },
    "vi": {
      "color": "Màu",
      "size": "Kích thước",
      "height": "Chiều Cao",
      "color-image": "Màu"
    }
  },
  "excludedCategory": 311,
  "saleOffProduct": {"ShowCountDown": true, "Color": "#C7222B"},
  "notStrictVisibleVariant": true,
  "configChat": {
    "EnableSmartChat": true,
    "showOnScreens": [
      "profile",
      "home",
      "wishlist",
      "checkout",
      "orders",
      "order-detail",
      "notify",
      "category",
      "category-search",
      "search",
      "page",
      "cart",
      "html",
      "product",
      "products",
      "detail-blog",
      "blogs",
      "blog",
      "currencies",
      "language",
      "update-user",
      "home-search"
    ],
    "hideOnScreens": []
  },
  "smartChat": [
    {"app": "https://wa.me/+201501081030", "iconData": "whatsapp"},
    {"app": "tel:+201501081030", "iconData": "phone"}
  ],
  "adminEmail": "ahmed.hassan@nabolia.net",
  "adminName": "Ahmed",
  "vendorConfig": {
    "VendorRegister": true,
    "DisableVendorShipping": false,
    "ShowAllVendorMarkers": true,
    "DisableNativeStoreManagement": false,
    "dokan": "my-account?vendor_admin=true",
    "wcfm": "store-manager?vendor_admin=true"
  },
  "loadingIcon": {"type": "fadingCircle", "size": 55.80993363993071},
  "productCard": {
    "hidePrice": false,
    "hideStore": true,
    "hideTitle": true,
    "borderRadius": 3.0,
    "boxFit": "fill",
    "boxShadow": {"x": 0.0, "y": 0.0, "blurRadius": 0.0}
  }
};
