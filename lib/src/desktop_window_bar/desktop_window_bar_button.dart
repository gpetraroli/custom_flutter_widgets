import 'package:flutter/material.dart';

class DesktopWindowBarButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;

  const DesktopWindowBarButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25,
      height: 25,
      child: IconButton.filled(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
          backgroundColor: MaterialStateProperty.all(Colors.grey.shade300),
          overlayColor: MaterialStateProperty.all(Colors.grey.shade400),
          iconSize: MaterialStateProperty.all(12),
          iconColor: MaterialStatePropertyAll(Colors.grey.shade700),
        ),
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
