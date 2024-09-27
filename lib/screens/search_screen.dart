import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF00AEEF), // Sky Blue
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SearchBar(),
          ),
          TrendingSection(),
          SuggestedAccountsSection(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF00AEEF)),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search memes, users, hashtags',
          hintStyle: GoogleFonts.roboto(
            fontSize: 14,
            color: const Color(0xFF003B73),
          ),
          prefixIcon: const Icon(Icons.search, color: Color(0xFF00AEEF)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}

class TrendingSection extends StatelessWidget {
  final List<String> trendingHashtags = [
    '#FlutterMemes',
    '#CodingHumor',
    '#TechJokes',
    '#ProgrammerLife',
    '#DeveloperHumor',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Trending',
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF003B73),
            ),
          ),
        ),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trendingHashtags.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Navigate to Hashtag Results Screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF5F5F5),
                    foregroundColor: const Color(0xFF00AEEF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(trendingHashtags[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class SuggestedAccountsSection extends StatelessWidget {
  final List<Map<String, String>> suggestedUsers = [
    {'username': 'flutter_dev', 'avatar': 'assets/images/user1.jpg'},
    {'username': 'code_wizard', 'avatar': 'assets/images/user2.jpg'},
    {'username': 'meme_master', 'avatar': 'assets/images/user3.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Suggested Accounts',
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF003B73),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: suggestedUsers.length,
          itemBuilder: (context, index) {
            return UserCard(
              username: suggestedUsers[index]['username']!,
              avatarUrl: suggestedUsers[index]['avatar']!,
            );
          },
        ),
      ],
    );
  }
}

class UserCard extends StatelessWidget {
  final String username;
  final String avatarUrl;

  const UserCard({required this.username, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(avatarUrl),
      ),
      title: Text(
        username,
        style: GoogleFonts.roboto(
          fontSize: 14,
          color: const Color(0xFF003B73),
        ),
      ),
      trailing: ElevatedButton(
        onPressed: () {
          // TODO: Implement follow functionality
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00AEEF),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text('Follow'),
      ),
      onTap: () {
        // TODO: Navigate to User Profile Screen
      },
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
