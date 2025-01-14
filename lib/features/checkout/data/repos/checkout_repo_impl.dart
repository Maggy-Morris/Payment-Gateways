import 'package:dartz/dartz.dart';
import 'package:payment_gateway/core/errors/failures.dart';
import 'package:payment_gateway/core/utils/stripe_service.dart';
import 'package:payment_gateway/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_gateway/features/checkout/data/repos/checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);

      return right(null);
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
