import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'search_screen.dart';

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
            color: const Color(0xFF00AEEF), // Sky Blue
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Color(0xFFF5F5F5)], // White to Light Gray
            ),
          ),
        ),
      ),
      body: MemeGrid(),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }
}

class MemeGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: 10, // Placeholder for infinite scroll
      itemBuilder: (context, index) {
        return MemeCard();
      },
    );
  }
}

class MemeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/placeholder.jpg', // Replace with actual meme thumbnail
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Icon(
              Icons.play_circle_outline,
              size: 32,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          Positioned(
            left: 8,
            bottom: 8,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundImage: AssetImage('assets/images/user_avatar.jpg'), // Replace with actual user avatar
                ),
                const SizedBox(width: 4),
                Text(
                  'Username',
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: const Color(0xFF003B73), // Deep Blue
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: const Color(0xFF00AEEF),
      unselectedItemColor: const Color(0xFF003B73),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Create'),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      onTap: (index) {
        if (index != currentIndex) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/search');
              break;
            // TODO: Add cases for other screens when they are implemented
            default:
              break;
          }
        }
      },
    );
  }
}
