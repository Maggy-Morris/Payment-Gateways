import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_gateway/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_gateway/features/checkout/data/repos/checkout_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());

  final CheckoutRepo checkoutRepo;

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());

    var data = await checkoutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);

    data.fold((ifLeft) => emit(PaymentFailure(errorMessage: ifLeft.errMessage)),
        (ifRight) => emit(PaymentSuccess()));
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
