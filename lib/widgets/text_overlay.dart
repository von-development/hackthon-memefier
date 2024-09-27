import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class TextOverlay extends StatefulWidget {
  final Function(TextOverlay) onUpdate;

  const TextOverlay({super.key, required this.onUpdate});

  @override
  _TextOverlayState createState() => _TextOverlayState();
}

class _TextOverlayState extends State<TextOverlay> {
  String text = 'Tap to edit';
  Offset position = const Offset(20, 20);
  double fontSize = 20;
  Color textColor = Colors.white;
  TextAlign textAlign = TextAlign.center;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            position += details.delta;
          });
          widget.onUpdate(widget);
        },
        onTap: _editText,
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              color: textColor,
              shadows: [
                Shadow(
                  blurRadius: 3.0,
                  color: Colors.black,
                  offset: Offset(1.0, 1.0),
                ),
              ],
            ),
            textAlign: textAlign,
          ),
        ),
      ),
    );
  }

  void _editText() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Text'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      text = value;
                    });
                  },
                  controller: TextEditingController(text: text),
                  maxLines: null,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('Font Size:'),
                    Expanded(
                      child: Slider(
                        value: fontSize,
                        min: 10,
                        max: 50,
                        onChanged: (value) {
                          setState(() {
                            fontSize = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.format_align_left),
                      onPressed: () => setState(() => textAlign = TextAlign.left),
                      color: textAlign == TextAlign.left ? Colors.blue : null,
                    ),
                    IconButton(
                      icon: Icon(Icons.format_align_center),
                      onPressed: () => setState(() => textAlign = TextAlign.center),
                      color: textAlign == TextAlign.center ? Colors.blue : null,
                    ),
                    IconButton(
                      icon: Icon(Icons.format_align_right),
                      onPressed: () => setState(() => textAlign = TextAlign.right),
                      color: textAlign == TextAlign.right ? Colors.blue : null,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Pick a color'),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: textColor,
                              onColorChanged: (color) {
                                setState(() {
                                  textColor = color;
                                });
                              },
                              pickerAreaHeightPercent: 0.8,
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Done'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Change Color'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                widget.onUpdate(widget);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}