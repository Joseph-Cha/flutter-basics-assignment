import 'package:flutter/material.dart';

class AddActionButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const AddActionButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(-2, 4),
          ),
        ],
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: GestureDetector(
          onTap: onPressed,
          child: Icon(Icons.add, color: Colors.white, size: 24),
        ),
      ),
    );
  }
}
