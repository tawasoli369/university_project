import 'pages/options_page.dart';
import 'package:flutter/material.dart';

// شروغ برنامه
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // تابعی برای ساختن و نمایش یوآی صفحه
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // دیزیبل کردن نمایش دیباگ بنر
      debugShowCheckedModeBanner: false,
      // مقدار دهی یوآی صفحه اصلی
      home: OptionsPage(),
    );
  }
}
