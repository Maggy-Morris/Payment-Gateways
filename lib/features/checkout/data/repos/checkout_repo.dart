import 'package:dartz/dartz.dart';
import 'package:payment_gateway/core/errors/failures.dart';
import 'package:payment_gateway/features/checkout/data/models/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
