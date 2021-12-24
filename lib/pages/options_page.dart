import 'package:flutter/material.dart';
import '../widgets/time_picker.dart';
import '../widgets/round_picker.dart';
import 'timer_page.dart';
import '../widgets/round_button.dart';

// صفحه برای انتخاب مدت فعالیت،استراحت و تعداد دور
class OptionsPage extends StatefulWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  // متغیری برای نگه داشتن مقدار دقیقه فعالیت
  int _activityMinutes = 0;
  // متغیری برای نگه داشتن مقدار ثانیه فعالیت
  int _activitySeconds = 0;
  // متغیری برای نگه داشتن مقدار دقیقه استراحت
  int _restMinutes = 0;
  // متغیری برای نگه داشتن مقدار ثانیه استراحت
  int _restSeconds = 0;
  // متغیری برای نگه داشتن تعداد دور
  int _rounds = 0;

  // تابعی برای آپدیت کردن مقدار فعالیت
  void updateActivity(int value, String unit) {
    if (unit == 'm') {
      setState(() => _activityMinutes = value);
    } else if (unit == 's') {
      setState(() => _activitySeconds = value);
    }
  }

  // تابعی برای آپدیت کردن مقدار استراحت
  void updateRest(int value, String unit) {
    if (unit == 'm') {
      setState(() => _restMinutes = value);
    } else if (unit == 's') {
      setState(() => _restSeconds = value);
    }
  }

  // تابعی برای آپدیت کردن تعداد دور
  void updateRounds(String direction) {
    if (direction == '-') {
      setState(() => _rounds--);
    } else if (direction == '+') {
      setState(() => _rounds++);
    }
  }

  // تابع برای ساختن یوآی صفحه اصلی
  @override
  Widget build(BuildContext context) {
    return Container(
      // نمایش بک گروند کل صفحه
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[Color(0xff09c6f9), Color(0xff045de9)]),
      ),
      // ویجتی که ساختار کلی صفحه را شکل می دهد
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // ویجتی برای نمایش متن " تایمر "
            const Text('تایمر',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                )),
            // ویجتی برای نمایش باکسی برای انتخاب مقدار فعالیت و استراحت
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TimePicker(
                    title: 'فعالیت',
                    minutes: _activityMinutes,
                    seconds: _activitySeconds,
                    onChangeCallBack: updateActivity,
                  ),
                ),
                Expanded(
                    child: TimePicker(
                        title: 'استراحت',
                        minutes: _restMinutes,
                        seconds: _restSeconds,
                        onChangeCallBack: updateRest))
              ],
            ),
            // ویجتی برای نمایش باکسی برای انتخاب تعداد دور
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundPicker(
                  rounds: _rounds,
                  onPressedCallBack: updateRounds,
                ),
              ],
            ),
            // دکمه شروع
            RoundButton(
              text: 'شروع',
              // تابعی که وقتی رو دکمه کلیک شد فراخوانی می شود
              onPressedCallBack: () {
                // دستوری برای رفتن به صفحه شروع
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return TimerPage(
                        activityTime:
                            (_activityMinutes * 60) + _activitySeconds,
                        restTime: (_restMinutes * 60) + _restSeconds,
                        rounds: _rounds,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
