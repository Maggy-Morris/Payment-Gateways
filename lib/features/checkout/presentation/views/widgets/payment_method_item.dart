import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem(
      {super.key, required this.isActive, required this.image});
  final bool isActive;
  final String image;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 600),
      width: 103,
      height: 62,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.50,
              color: isActive ? const Color(0xFF34A853) : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(15)),
        shadows: [
          BoxShadow(
              blurRadius: 4,
              offset: const Offset(0, 0),
              spreadRadius: 0,
              color: isActive ? const Color(0xFF34A853) : Colors.white)
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Center(
            child: SvgPicture.asset(
          image,
          // height: 24,
        )),
      ),
    );
  }
}
