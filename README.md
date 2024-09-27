# SkyMemer

SkyMemer is a Flutter-based mobile application that allows users to create customized memes from video streams. This README provides an overview of the project structure, current progress, and future tasks.

## Project Overview

SkyMemer enables users to:
- Select a video from a provided list
- Choose a specific frame or a clip up to 10 seconds
- Add and customize text (including emojis) on the selected media
- Export the final meme as an image or GIF
- Save the exported memes to the device gallery

## Project Structure

### Screens

1. **HomeScreen** (`lib/screens/home_screen.dart`)
   - Displays a grid of image assets
   - Allows navigation to ImageDetailScreen

2. **ImageDetailScreen** (`lib/screens/image_detail_screen.dart`)
   - Shows a detailed view of the selected image
   - Implements like functionality with animation
   - Provides options to share and edit the image

3. **CreateScreen** (`lib/screens/create_screen.dart`)
   - Allows users to add text overlays to images
   - Provides image selection functionality (placeholder implementation)

4. **SearchScreen** (not implemented yet)

5. **NotificationsScreen** (not implemented yet)

6. **ProfileScreen** (not implemented yet)

### Widgets

1. **BottomNavBar** (`lib/widgets/bottom_nav_bar.dart`)
   - Implements a custom bottom navigation bar
   - Handles navigation between main screens

2. **EmptyState** (`lib/widgets/empty_state.dart`)
   - Displays a message when no content is available

3. **NotificationItem** (`lib/widgets/notification_item.dart`)
   - Represents a single notification item (not used yet)

4. **StickerOverlay** (`lib/widgets/sticker_overlay.dart`)
   - Allows adding and manipulating stickers on images (not fully implemented)

5. **TextOverlay** (`lib/widgets/text_overlay.dart`)
   - Enables adding and customizing text on images
   - Provides options for font size, color, and alignment

### Main App

The main app structure is defined in `lib/main.dart`, which sets up the initial routes and theme for the application.

## Current Progress

- [x] Basic app structure and navigation
- [x] Home screen with image grid
- [x] Image detail screen with like functionality
- [x] Create screen with text overlay capabilities
- [x] Custom bottom navigation bar
- [x] Text customization (size, color, alignment)

## TODO List

### Video Functionality
- [ ] Implement video selection and playback
- [ ] Add video timeline navigation
- [ ] Enable frame and clip selection (up to 10 seconds)

### Meme Creation
- [ ] Integrate emoji support in text overlays
- [ ] Implement sticker functionality
- [ ] Add more text effects (bold, italic, underline)

### Export and Save
- [ ] Implement image export functionality
- [ ] Add GIF export for video clips
- [ ] Enable saving to device gallery

### UI/UX Improvements
- [ ] Refine overall app design and theme
- [ ] Implement search functionality
- [ ] Create notifications screen
- [ ] Develop user profile screen

### Future Enhancements
- [ ] Advanced text effects and animations
- [ ] Video filters and visual effects
- [ ] User authentication
- [ ] Meme sharing capabilities
- [ ] Social media integration

## Getting Started

To run this project:

1. Ensure you have Flutter installed on your machine
2. Clone this repository
3. Run `flutter pub get` to install dependencies
4. Connect a device or start an emulator
5. Run `flutter run` to start the app

## Contributing

Ronaldo and Lula simbora ganahr 5k de euro .
