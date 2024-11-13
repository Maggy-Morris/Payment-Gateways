import 'package:flutter/material.dart';
import 'package:payment_gateway/styles.dart';

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({super.key, required this.text1, required this.text2});
  final String text1, text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: Styles.style18,
        ),
        Text(
          text2,
          style: Styles.styleBold18,
        )
      ],
    );
  }
}
