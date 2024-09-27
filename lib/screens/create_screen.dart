import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/text_overlay.dart';

class CreateScreen extends StatefulWidget {
  final String? initialImageAsset;

  const CreateScreen({super.key, this.initialImageAsset});

  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  List<Widget> overlays = [];
  String? selectedImageAsset;

  @override
  void initState() {
    super.initState();
    selectedImageAsset = widget.initialImageAsset;
  }

  void _addTextOverlay() {
    setState(() {
      overlays.add(TextOverlay(
        onUpdate: (textOverlay) {
          // Handle text overlay updates if needed
        },
      ));
    });
  }

  void _selectImage() async {
    // Implement image selection logic here
    // For example, you can use image_picker package
    // For now, we'll just set a placeholder
    setState(() {
      selectedImageAsset = 'assets/images/placeholder.jpg';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Meme'),
        actions: [
          IconButton(
            icon: Icon(Icons.image),
            onPressed: _selectImage,
          ),
        ],
      ),
      body: Stack(
        children: [
          // Base image or canvas
          selectedImageAsset != null
              ? Image.asset(
                  selectedImageAsset!,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: double.infinity,
                )
              : Container(
                  color: Colors.grey[200],
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(child: Text('Select an image to start')),
                ),
          // Overlays
          ...overlays,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTextOverlay,
        child: Icon(Icons.text_fields),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }
}