import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_nav_bar.dart';
import '../constants/colors.dart';
import 'image_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SkyMemer',
          style: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.skyBlue,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const ImageGrid(),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }
}

class ImageGrid extends StatelessWidget {
  const ImageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // List of actual image filenames in your assets/images/ folder
    final List<String> imageAssets = [
      'Absolutely disgusting.jpg',
      'Bee movie.jpg',
      'Carlos.jpg',
      'chat choqué surpris.jpg',
      'Chien 3.jpg',
      'Dr Stone choqué.jpg',
      'Gon and Killua.jpg',
      'Hold up.jpg',
      'Holy water.jpg',
      'Homer 2.jpg',
      'I Miss Ten Seconds Ago.jpg',
      'Impossible.jpg',
      'Jojo Whispering To Surprised Emma.jpg',
      'Kakyoin.jpg',
      'Koichi choqué.jpg',
      'Krabs 1.jpg',
      'Mario 1.jpg',
      'Mario 2.jpg',
    ];

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: imageAssets.length,
      itemBuilder: (context, index) {
        return ImageCard(imageAsset: 'assets/images/${imageAssets[index]}');
      },
    );
  }
}

class ImageCard extends StatefulWidget {
  final String imageAsset;

  const ImageCard({super.key, required this.imageAsset});

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  bool isLiked = false;

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageDetailScreen(imageAsset: widget.imageAsset),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                widget.imageAsset,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: GestureDetector(
                onTap: _toggleLike,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? AppColors.skyBlue : Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
