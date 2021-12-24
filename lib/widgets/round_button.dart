import 'package:flutter/material.dart';

// ویجت و قالب کلی دکمه ها در اپ
class RoundButton extends StatelessWidget {
  // مقدار متن هر دکمه
  final String text;
  // متغیری برای صدا زدن تا کلیک وقتی روی دکمه کلیک شد
  final VoidCallback onPressedCallBack;

  // کانستراکتور
  const RoundButton({
    Key? key,
    // گرفتن مقدار متن هر دکمه از صفحه قبلی
    required this.text,
    // گرفتن تابعی که هر بار کلیک شد صدا زده شود
    required this.onPressedCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(100, 100),
        side: const BorderSide(
          color: Colors.white,
          width: 2,
        ),
        shape: const CircleBorder(),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 28,
        ),
      ),
      onPressed: onPressedCallBack,
    );
  }
}
