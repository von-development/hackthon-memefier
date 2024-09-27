import 'package:flutter/material.dart';

class StickerOverlay extends StatefulWidget {
  final String stickerAsset;
  final Function(StickerOverlay) onUpdate;

  const StickerOverlay({Key? key, required this.stickerAsset, required this.onUpdate}) : super(key: key);

  @override
  _StickerOverlayState createState() => _StickerOverlayState();
}

class _StickerOverlayState extends State<StickerOverlay> {
  Offset position = const Offset(20, 20);
  double scale = 1.0;

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
        onScaleUpdate: (details) {
          setState(() {
            scale = details.scale.clamp(0.5, 3.0);
          });
          widget.onUpdate(widget);
        },
        child: Transform.scale(
          scale: scale,
          child: Image.asset(
            widget.stickerAsset,
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}