import 'package:flutter/material.dart';

class Medicines {
  final int productId;
  final String imageUrl;
  final Color containerColor;
  final Color textBgcolor;
  final String titles;
  final List<String> specifications;
  final String directionsForUse;
  final List<String> safetyInfo;
  final String productInfo;
  final String uses;
  final int units;

  Medicines(
      {required this.productId,
      required this.imageUrl,
      required this.containerColor,
      required this.textBgcolor,
      required this.titles,
      required this.specifications,
      required this.directionsForUse,
      required this.safetyInfo,
      required this.productInfo,
      required this.uses,
      required this.units});

  factory Medicines.fromJson(Map<String, dynamic> json) {
    return Medicines(
      productId: json['productId'],
      imageUrl: json['imageUrl'],
      containerColor: Color(json['containerColor']),
      textBgcolor: Color(json['textBgcolor']),
      titles: json['titles'],
      specifications: List<String>.from(json['specifications']),
      directionsForUse: json['directionsForUse'],
      safetyInfo: List<String>.from(json['safetyInfo']),
      productInfo: json['productInfo'],
      uses: json['uses'],
      units: json['units'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'imageUrl': imageUrl,
      'containerColor': containerColor.value,
      'textBgcolor': textBgcolor.value,
      'titles': titles,
      'specifications': specifications,
      'directionsForUse': directionsForUse,
      'safetyInfo': safetyInfo,
      'productInfo': productInfo,
      'uses': uses,
      'units': units,
    };
  }
}
