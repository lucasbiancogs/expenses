import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class AdaptativeTextInput extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onSubmitted;
  final String label;
  final TextInputType keyboardType;

  AdaptativeTextInput({
    @required this.controller,
    @required this.onSubmitted,
    @required this.label,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
              keyboardType: keyboardType,
              controller: controller,
              onSubmitted: onSubmitted,
              placeholder: label,
              placeholderStyle: TextStyle(
                color: Theme.of(context).primaryColor
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
              style: TextStyle(
                color: Theme.of(context).primaryColor
              ),
            ),
          )
        : TextField(
            keyboardType: keyboardType,
            controller: controller,
            onSubmitted: onSubmitted,
            decoration: InputDecoration(labelText: label));
  }
}
