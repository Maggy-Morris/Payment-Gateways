import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_gateway/features/checkout/presentation/views/widgets/card_info_widget.dart';
import 'package:payment_gateway/features/checkout/presentation/views/widgets/payment_item_info.dart';
import 'package:payment_gateway/features/checkout/presentation/views/widgets/total_price_widget.dart';
import 'package:payment_gateway/styles.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
          color: const Color(0xFFEDEDED),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
      child: Padding(
        padding: const EdgeInsets.only(top: 66.0, left: 22, right: 22),
        child: Column(
          children: [
            const Text(
              "Thank you!",
              textAlign: TextAlign.center,
              style: Styles.style25,
            ),
            Text(
              "Your transaction was successful",
              textAlign: TextAlign.center,
              style: Styles.style20,
            ),
            const SizedBox(
              height: 42,
            ),
            const PaymentItemInfo(text1: "Date", text2: "09/12/2024"),
            const SizedBox(
              height: 20,
            ),
            const PaymentItemInfo(text1: 'Time', text2: "10:15 AM"),
            const SizedBox(
              height: 20,
            ),
            const PaymentItemInfo(text1: "To", text2: "Sam Louis"),
            const Divider(
              thickness: 2,
              height: 60,
            ),
            const TotalPrice(title: "Total", value: r"$50.97"),
            const SizedBox(
              height: 30,
            ),
            const CardInfoWidget(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  FontAwesomeIcons.barcode,
                  size: 64,
                ),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1.50,
                      color: Color(0xFF34A853),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  )),
                  child: Center(
                    child: Text(
                      "Paid",
                      textAlign: TextAlign.center,
                      style: Styles.style24.copyWith(
                        color: const Color(0xFF34A853),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: ((MediaQuery.sizeOf(context).height * 0.2 + 20) / 2) - 29,
            )
          ],
        ),
      ),
    );
  }
}
