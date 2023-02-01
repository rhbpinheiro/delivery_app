// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DeliveryButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String label;
  final double? width;
  final double? height;
  const DeliveryButton({
    Key? key,
    required this.onpressed,
    required this.label,
    this.width,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onpressed,
        child: Text(label),
      ),
    );
  }
}
