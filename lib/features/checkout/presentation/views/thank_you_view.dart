import 'package:flutter/material.dart';
import 'package:payment_gateway/features/checkout/presentation/views/widgets/thank_you_view_body.dart';

import '../../../../core/widgets/app_bar.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Transform.translate(
          offset: const Offset(0, -16), child: const ThankYouViewBody()),
    );
  }
}
