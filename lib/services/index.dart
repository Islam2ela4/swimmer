import 'package:fstore/models/entities/product.dart';
import 'package:fstore/widgets/common/internet_connectivity.dart';
import '../frameworks/shopify/services/shopify_mixin.dart';
import 'service_config.dart';

export 'service_config.dart';

class Services with ConfigMixin, ShopifyMixin {

  static final Services _instance = Services._internal();

  factory Services() => _instance;

  Services._internal();


  @override
  Future<Product> getProductBySlug(slug, {lang}) async {

    MyConnectivity.checking();
    return api.getProductBySlug(slug, lang: lang);
  }

}
