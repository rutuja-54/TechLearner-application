import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentGateway extends GetxController {
  late Razorpay razorpay;
  @override
  void onInit() {
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "ERROR: ", toastLength: Toast.LENGTH_SHORT);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void dispatchPayment(
      int amount, String name, int contact, String email, String wallet) {
    var options = {
      'key': 'rzp_test_0Dq02SVbjVEzjT',
      'amount': amount,
      'name': name,
      'description': 'Payment',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': contact, 'email': email},
      'external': {
        'wallets': [wallet]
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }
}
