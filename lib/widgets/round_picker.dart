import 'package:flutter/material.dart';

// ویجت و قالب کلی تعداد دور در اپ
class RoundPicker extends StatelessWidget {
  final int rounds;
  final Function onPressedCallBack;

  const RoundPicker({
    Key? key,
    required this.rounds,
    required this.onPressedCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          'دور',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.white, Color(0xfffcfcfc)],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(1, 2), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              MaterialButton(
                child: const Text('-', style: TextStyle(fontSize: 20)),
                onPressed: () => onPressedCallBack('-'),
              ),
              Text(
                rounds.toString(),
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                ),
              ),
              MaterialButton(
                child: const Text('+', style: TextStyle(fontSize: 16)),
                onPressed: () => onPressedCallBack('+'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
