import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_nav_bar.dart';
import '../constants/colors.dart';

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
            color: AppColors.skyBlue,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: SearchBar(),
          ),
          TrendingSection(),
          SuggestedAccountsSection(),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.skyBlue),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search memes, users, hashtags',
          hintStyle: GoogleFonts.roboto(
            fontSize: 14,
            color: AppColors.deepBlue,
          ),
          prefixIcon: const Icon(Icons.search, color: AppColors.skyBlue),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }
}

class TrendingSection extends StatelessWidget {
  const TrendingSection({super.key});

  static const List<String> trendingHashtags = [
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
              color: AppColors.deepBlue,
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
                    // Navigate to Hashtag Results Screen when implemented
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.lightGray,
                    foregroundColor: AppColors.skyBlue,
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
  const SuggestedAccountsSection({super.key});

  static const List<String> suggestedUsers = [
    'flutter_dev',
    'code_wizard',
    'meme_master',
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
              color: AppColors.deepBlue,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: suggestedUsers.length,
          itemBuilder: (context, index) {
            return UserCard(
              username: suggestedUsers[index],
            );
          },
        ),
      ],
    );
  }
}

class UserCard extends StatelessWidget {
  final String username;

  const UserCard({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: AppColors.lightGray,
        child: Icon(Icons.person, color: AppColors.deepBlue),
      ),
      title: Text(
        username,
        style: GoogleFonts.roboto(
          fontSize: 14,
          color: AppColors.deepBlue,
        ),
      ),
      trailing: ElevatedButton(
        onPressed: () {
          // Implement follow functionality when ready
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.skyBlue,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text('Follow'),
      ),
      onTap: () {
        // Navigate to User Profile Screen when implemented
      },
    );
  }
}
