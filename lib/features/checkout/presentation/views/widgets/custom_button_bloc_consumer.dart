import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_gateway/core/utils/api_keys.dart';
import 'package:payment_gateway/core/widgets/custom_button_widget.dart';
import 'package:payment_gateway/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:payment_gateway/features/checkout/data/models/amount_model/details.dart';
import 'package:payment_gateway/features/checkout/data/models/item_list_model/item.dart';
import 'package:payment_gateway/features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:payment_gateway/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_gateway/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:payment_gateway/features/checkout/presentation/views/thank_you_view.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const ThankYouView();
          }));
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(
            content: Text(state.errorMessage),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            // PaymentIntentInputModel paymentIntentInputModel =
            //     PaymentIntentInputModel(
            //         amount: "100",
            //         currency: 'USD',
            //         customerId: "cus_RC7A6M2NjNdOPp");
            // BlocProvider.of<PaymentCubit>(context)
            //     .makePayment(paymentIntentInputModel: paymentIntentInputModel);

            var transactionData = getTransactionsData();
            executePaypalPayment(context, transactionData);
          },
          isLoading: state is PaymentLoading ? true : false,
          text: "Continue",
        );
      },
    );
  }

  void executePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transactionData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.paypalClientId,
        secretKey: ApiKeys.paypalSecretKey,
        transactions: [
          {
            "amount": transactionData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionData.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({AmountModel amount, ItemListModel itemList}) getTransactionsData() {
    var amount = AmountModel(
        total: "100",
        currency: "USD",
        details: Details(subtotal: "100", shipping: "0", shippingDiscount: 0));

    List<OrderItemModel> orders = [
      OrderItemModel(name: "Apple", price: "4", quantity: 10, currency: "USD"),
      OrderItemModel(name: "Apple", price: "5", quantity: 12, currency: "USD")
    ];
    var itemList = ItemListModel(items: orders);

    return (amount: amount, itemList: itemList);
  }
}
