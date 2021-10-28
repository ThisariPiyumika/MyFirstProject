import 'package:flutter/material.dart';

const textInputDecprations = InputDecoration(
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.orange),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.yellow),
  ),
  border: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.red),
  ),
  hintStyle: TextStyle(fontSize: 12.0, color: Colors.yellow),
);
