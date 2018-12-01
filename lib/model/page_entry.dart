import 'package:flutter/material.dart';

@immutable
class PageEntry {
  final String image;
  final String title;
  final String description;

  const PageEntry({
    @required this.image,
    @required this.title,
    @required this.description,
  });
}
