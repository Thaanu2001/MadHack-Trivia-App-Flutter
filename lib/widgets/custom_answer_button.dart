import 'package:flutter/material.dart';

class CustomAnswerButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function() onTap;
  const CustomAnswerButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: (isSelected) ? Color(0xff0B4A93) : Color(0xff36A8E1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
