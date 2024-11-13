class PaymentIntentInputModel {
  final String amount;

  final String currency;
  final String customerId;

  PaymentIntentInputModel(
      {required this.amount, required this.currency, required this.customerId});
  toJson() {
    return {
      //just for test don't use it in production
      'amount': "${amount}00",
      'currency': currency,
      'customer': customerId,
    };
  }
}
