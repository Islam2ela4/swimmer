part of '../config.dart';

Map get kPaymentConfig => Configurations.paymentConfig;

Map get Payments => Configurations.payments;

Map get kStripeConfig => Configurations.stripeConfig;

Map get PaypalConfig => Configurations.paypalConfig;

Map get RazorpayConfig => Configurations.razorpayConfig;

Map get TapConfig => Configurations.tapConfig;

Map get MercadoPagoConfig => Configurations.mercadoPagoConfig;

Map get afterShip => Configurations.afterShip;

/// Limit the country list from Billing Address
/// []: default show all country
//List get DefaultCountry => Configurations.defaultCountryShipping;

const List DefaultCountry = [
  {
   "name": "Egypt",
   "iosCode": "EG",
    "icon": "https://en.wikipedia.org/wiki/Flag_of_Egypt#/media/File:Flag_of_Egypt.svg"
 }];
