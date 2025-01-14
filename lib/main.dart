import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_gateway/core/utils/api_keys.dart';
import 'package:payment_gateway/features/checkout/presentation/views/my_cart_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // set the publishable key for Stripe - this is mandatory
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}

//create payment intent {amount , currency}
// Future<void> initPaymentSheet() async {
//   try {
//     // // 1. create payment intent on the server
//     // final data = await _createTestPaymentSheet();

//     // 2. initialize the payment sheet
//     await Stripe.instance.initPaymentSheet(
//       paymentSheetParameters: SetupPaymentSheetParameters(
//         // // Set to true for custom flow
//         // customFlow: false,
//         // Main params
//         merchantDisplayName: 'Flutter Stripe Store Demo',
//         paymentIntentClientSecret: data['paymentIntent'],
//         // // Customer keys
//         // customerEphemeralKeySecret: data['ephemeralKey'],
//         // customerId: data['customer'],
//         // Extra options
//         // applePay: const PaymentSheetApplePay(
//         //   merchantCountryCode: 'US',
//         // ),
//         // googlePay: const PaymentSheetGooglePay(
//         //   merchantCountryCode: 'US',
//         //   testEnv: true,
//         // ),
//         style: ThemeMode.dark,
//       ),
//     );
//     setState(() {
//       _ready = true;
//     });
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Error: $e')),
//     );
//     rethrow;
//   }
// }
