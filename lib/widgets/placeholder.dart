import 'package:flutter/material.dart';
import 'package:wallzon/model/constants.dart';

final Widget placeholder = Container(
  color: const Color.fromRGBO(255, 255, 255, 0.3),
  child: const Center(
      child: CircularProgressIndicator(
    color: kForegroundColor,
  )),
);
