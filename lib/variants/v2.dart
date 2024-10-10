import 'package:flutter/material.dart';

class BorderChanger extends StatefulWidget {
  @override
  State<BorderChanger> createState() => _BorderChangerState();
}

class _BorderChangerState extends State<BorderChanger> {
  double _topright = 0;
  double _topleft = 0;
  double _bottomright = 0;
  double _bottomleft = 0;

  void _topRight(double value) {
    setState(() {
      _topright = value;
    });
  }

  void _bottomRight(double value) {
    setState(() {
      _bottomright = value;
    });
  }

  void _topLeft(double value) {
    setState(() {
      _topleft = value;
    });
  }

  void _bottomLeft(double value) {
    setState(() {
      _bottomleft = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 46.0),
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(_topright),
                  topLeft: Radius.circular(_topleft),
                  bottomLeft: Radius.circular(_bottomleft),
                  bottomRight: Radius.circular(_bottomright))),
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Text("TR: "),
                  Text(
                    _topright.toStringAsFixed(2),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Slider(
                      value: _topright, min: 0, max: 300, onChanged: _topRight),
                ],
              ),
            ),
            Expanded(
                child: Column(
              children: [
                const Text("TL: "),
                Text(_topleft.toStringAsFixed(2),
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Slider(value: _topleft, min: 0, max: 300, onChanged: _topLeft)
              ],
            ))
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Text("BR: "),
                  Text(
                    _bottomright.toStringAsFixed(2),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Slider(
                      value: _bottomright,
                      min: 0,
                      max: 300,
                      onChanged: _bottomRight),
                ],
              ),
            ),
            Expanded(
                child: Column(
              children: [
                const Text("BL: "),
                Text(_bottomleft.toStringAsFixed(2),
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Slider(
                    value: _bottomleft,
                    min: 0,
                    max: 300,
                    onChanged: _bottomLeft)
              ],
            ))
          ],
        ),

      ],
    );
  }
}
