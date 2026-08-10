import 'package:flutter/material.dart';

class Destination {
  const Destination(this.title, this.icon, this.widget, this.isFABvisible);
  final String title;
  final IconData icon;
  final Widget widget;
  final bool isFABvisible;
}