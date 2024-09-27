import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/notification_item.dart';
import '../widgets/empty_state.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy notifications data
    final List<Map<String, String>> notifications = [
      {'type': 'like', 'text': 'John liked your meme', 'timestamp': '2m ago'},
      {'type': 'comment', 'text': 'Sarah commented on your post', 'timestamp': '5m ago'},
      {'type': 'follow', 'text': 'Mike started following you', 'timestamp': '1h ago'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: notifications.isEmpty
          ? const EmptyState(message: 'No notifications yet')
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return NotificationItem(
                  type: notification['type']!,
                  text: notification['text']!,
                  timestamp: notification['timestamp']!,
                  onTap: () {
                    // Handle notification tap
                  },
                );
              },
            ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 3),
    );
  }
}