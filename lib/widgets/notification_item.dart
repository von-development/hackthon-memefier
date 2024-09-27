import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors.dart';

class NotificationItem extends StatelessWidget {
  final String type;
  final String text;
  final String timestamp;
  final VoidCallback onTap;

  const NotificationItem({
    super.key,
    required this.type,
    required this.text,
    required this.timestamp,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _buildIcon(),
      title: Text(
        text,
        style: GoogleFonts.roboto(
          fontSize: 14,
          color: AppColors.deepBlue,
        ),
      ),
      subtitle: Text(
        timestamp,
        style: GoogleFonts.roboto(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildIcon() {
    IconData iconData;
    switch (type) {
      case 'like':
        iconData = Icons.favorite;
        break;
      case 'comment':
        iconData = Icons.comment;
        break;
      case 'follow':
        iconData = Icons.person_add;
        break;
      case 'mention':
        iconData = Icons.alternate_email;
        break;
      default:
        iconData = Icons.notifications;
    }
    return Icon(iconData, color: AppColors.skyBlue, size: 24);
  }
}