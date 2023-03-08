import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.teal,
  });

  final IconData? icon;
  final String text;
  final Function() onPressed;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(16),
      elevation: 8,
      child: ListTile(
        onTap: onPressed,
        leading: icon != null
            ? Icon(
                icon,
                color: Colors.teal,
              )
            : null,
        title: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
