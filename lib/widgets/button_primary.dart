import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  const ButtonPrimary({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final isSmall = mq.width < 400;

    return Material(
      color: const Color(0xffC67C4E),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: isSmall ? 48 : 56,
          width: double.infinity,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: isSmall ? 14 : 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
