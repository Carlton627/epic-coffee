import 'package:flutter/material.dart';

// Colors
Color? primaryColor = Colors.deepPurpleAccent.shade700;
Color? foregroundColor = Colors.white;

// Constant configurations
const String appName = 'Epic Coffee';
const String fontFamilyUbuntu = 'Ubuntu';
const String fontFamilyKanit = 'Kanit';
const String coffeeLabelString = 'Coffee weight';
const String waterLabelString = 'Water required';
const String coffeeHintString = 'in gms';
const String waterHintString = 'in gms';

// Themes
const textInputTheme = TextStyle(
  color: Colors.brown,
  fontSize: 20,
  fontFamily: fontFamilyKanit,
  fontStyle: FontStyle.italic,
);

InputDecoration setInputTheme(hintString, labelString) {
  return InputDecoration(
    hintText: hintString,
    hintStyle: const TextStyle(
      color: Colors.brown,
      fontFamily: fontFamilyUbuntu,
      fontSize: 20,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.brown,
          width: 3,
        )
    ),
    // fillColor: Colors.grey[700],
  );
}
