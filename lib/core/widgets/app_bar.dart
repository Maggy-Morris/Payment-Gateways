import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_gateway/styles.dart';

AppBar buildAppBar({final String? title}) {
  return AppBar(
    centerTitle: true,
    leading: Center(child: SvgPicture.asset("assets/images/Arrow 1.svg")),
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Text(
      title ?? "",
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),
  );
}
