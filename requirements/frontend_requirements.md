## Project Overview
**skyapp** is a mobile application developed using Flutter and Supabase that enables users to create customized memes from video streams. The app allows users to:

- 🎥 Select a video from a provided list.
- ⏳ Choose a specific frame or a clip up to 10 seconds.
- ✍️ Add and customize text (including emojis) on the selected media.
- 📤 Export the final meme as an image or GIF.
- 💾 Save the exported memes to the device gallery.

The primary goal is to build a Minimum Viable Product (MVP) focusing on core functionalities with a clean and intuitive user interface.

## Feature Requirements
### MVP Features
#### 1. Video Selection
- 🖼️ Display a grid or list of provided video thumbnails.
- ▶️ Allow users to preview and select a video.

#### 2. Frame and Clip Selection
- 🎞️ Play the selected video with basic controls (play, pause, scrub).
- 📍 Enable users to navigate through the video timeline.
- ✂️ Allow selection of a specific frame or a clip (maximum 10 seconds).

#### 3. Meme Editing
- 📝 Add text and emojis to the selected frame or clip.
- ✨ Provide text customization options:
  - Change font type and size.
  - Modify text color.
  - Apply basic text effects (bold, italic, underline).
- 🔄 Enable positioning of text and emojis anywhere on the media.

#### 4. Export Functionality
- 🖼️ Export single frames as images.
- 🎥 Export clips as GIFs (not exceeding 10 seconds).
- 📂 Save the exported media to the device gallery.

#### 5. Basic UI/UX
- 🛠️ Implement intuitive navigation between screens.
- 📱 Ensure responsive design across different devices and screen sizes.

### Future Enhancements (Beyond MVP)
- 🎨 Advanced text effects and animations.
- 🌟 Stickers and overlays.
- 🎥 Video filters and visual effects.
- 🔒 User authentication and meme sharing.
- 🌐 Social media integration.

## Relevant Docs
### Flutter
- [Flutter Documentation](https://flutter.dev/docs)
- [Flutter Widgets Catalog](https://flutter.dev/docs/development/ui/widgets)
- [Animations in Flutter](https://flutter.dev/docs/development/ui/animations)

### Supabase
- [Supabase Flutter Quickstart](https://supabase.com/docs/guides/getting-started/flutter)
- [Supabase Auth Documentation](https://supabase.com/docs/guides/auth)
- [Database and Storage](https://supabase.com/docs/guides/database)

### Plugins and Packages
- `video_player`
- `video_trimmer`
- `image_editor`
- `emoji_picker_flutter`
- `flutter_ffmpeg`
- `path_provider`
- `google_fonts`

## Current File Structure
skyapp/
├── android/
├── ios/
├── lib/
│   ├── main.dart
│   ├── screens/
│   │   ├── home_screen.dart
│   │   ├── video_selection_screen.dart
│   │   ├── meme_editing_screen.dart
│   │   └── export_screen.dart
│   ├── widgets/
│   │   ├── custom_button.dart
│   │   ├── custom_text_field.dart
│   │   └── draggable_text.dart
│   ├── services/
│   │   ├── video_service.dart
│   │   ├── export_service.dart
│   │   └── supabase_service.dart
│   ├── models/
│   └── utils/
├── assets/
│   ├── videos/
│   ├── fonts/
├── pubspec.yaml
├── .env.local
└── README.md
