import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_gateway/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:payment_gateway/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:payment_gateway/features/checkout/presentation/views/widgets/cart_info_item.dart';
import 'package:payment_gateway/features/checkout/presentation/views/widgets/payment_method_bottom_sheet.dart';
import 'package:payment_gateway/features/checkout/presentation/views/widgets/total_price_widget.dart';

import '../../../../../core/widgets/custom_button_widget.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(child: Image.asset("assets/images/cart.png")),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(title: "Order Subtotal", value: r"$42.45"),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(title: "Discount", value: r"$0"),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(title: "Shipping", value: r"$8"),
          const Divider(
            height: 34,
            thickness: 2,
            color: Color(0xffC7C7C7),
          ),
          const TotalPrice(
            title: "Total",
            value: r"$50.97",
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            text: "Complete Payment",
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              //   return const PaymentDatails();
              // }));

              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => PaymentCubit(CheckoutRepoImpl()),
                      child: const PaymentMethodBottomSheet(),
                    );
                  });
            },
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
