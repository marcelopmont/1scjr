import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  final IconData icon;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      elevation: 8,
      child: ListTile(
        onTap: onPressed,
        leading: Icon(
          icon,
          color: Colors.teal,
        ),
        title: Text(
          text,
          style: const TextStyle(
            color: Colors.teal,
          ),
        ),
      ),
    );
  }
}
