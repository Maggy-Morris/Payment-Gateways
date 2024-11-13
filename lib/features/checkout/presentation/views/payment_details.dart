import 'package:flutter/material.dart';
import 'package:payment_gateway/core/widgets/app_bar.dart';
import 'package:payment_gateway/features/checkout/presentation/views/widgets/payment_details_view_body.dart';

class PaymentDatails extends StatelessWidget {
  const PaymentDatails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(title: "Payment Details"),
        body: const PaymentDetailsViewBody());
  }
}
