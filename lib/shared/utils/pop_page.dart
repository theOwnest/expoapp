import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

popPage(BuildContext context) {
  if (context.canPop()) {
    context.pop();
  }
}
