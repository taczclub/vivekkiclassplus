import 'package:flutter/material.dart';
import 'package:vivekkiclassplus/screens/CurrentAffairViewScreen.dart';
import 'package:vivekkiclassplus/screens/CurrentAffairsScreen.dart';
import 'package:vivekkiclassplus/screens/SociologyNoteCategoryScreen.dart';
import 'package:vivekkiclassplus/screens/SociologyNoteSubCategoryScreen.dart';
import 'package:vivekkiclassplus/screens/SociologyNoteViewScreen.dart';
import 'package:vivekkiclassplus/screens/SociologyNotesScreen.dart';
import 'package:vivekkiclassplus/screens/SociologyScreen.dart';
import 'package:vivekkiclassplus/screens/SociologyTestCategoryScreen.dart';
import 'package:vivekkiclassplus/screens/SociologyTestScreen.dart';
import 'package:vivekkiclassplus/screens/SociologyTestSubcategoryScreen.dart';
import 'package:vivekkiclassplus/screens/SociologyTestsScreen.dart';
import 'package:vivekkiclassplus/screens/SociologyVideoCategoryScreen.dart';
import 'package:vivekkiclassplus/screens/SociologyVideoPlayerScreen.dart';
import 'package:vivekkiclassplus/screens/SociologyVideoSubCategoryScreen.dart';
import './screens/MainScreen.dart';
import './screens/VideoCategoryScreen.dart';
import './screens/VideoSubCategoryScreen.dart';
import './screens/VideoPlayerScreen.dart';
import './screens/NoteCategoryScreen.dart';
import './screens/NoteSubCategoryScreen.dart';
import './screens/NotesScreen.dart';
import './screens/NoteViewScreen.dart';
import './screens/PlansScreen.dart';
import './screens/HelpScreen.dart';
import './screens/AboutScreen.dart';
import './screens/ContactScreen.dart';
import './screens/ProfileScreen.dart';
import './screens/QstudentScreen.dart';
import './screens/LoginScreen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        final int i = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => MainScreen(
                  index: i,
                ));
      case 'videos_category':
        return MaterialPageRoute(builder: (_) => VideoCategoryScreen());
      case 'sociology_category':
        return MaterialPageRoute(builder: (_) => SociologyCategoryScreen());
      case 'sociology_videos_category':
        return MaterialPageRoute(
            builder: (_) => SociologyVideoCategoryScreen());
      case 'videos_sub_category':
        final String id = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => VideoSubCategoryScreen(id: id));
      case 'notes_category':
        return MaterialPageRoute(builder: (_) => NoteCategoryScreen());
      case 'sociology_notes_category':
        return MaterialPageRoute(builder: (_) => SociologyNoteCategoryScreen());
      case 'sociology_tests_category':
        return MaterialPageRoute(builder: (_) => SociologyTestCategoryScreen());
      case 'notes_sub_category':
        final String id = settings.arguments;
        return MaterialPageRoute(builder: (_) => NoteSubCategoryScreen(id: id));
      case 'sociology_notes_sub_category':
        final String id = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => SociologyTestSubCategoryScreen(id: id));
      case 'sociology_tests_sub_category':
        final String id = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => SociologyTestSubCategoryScreen(id: id));
      case 'sociology_videos_sub_category':
        final String id = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => SociologyVideoSubCategoryScreen(id: id));
      case 'video_player':
        final String id = settings.arguments;
        return MaterialPageRoute(builder: (_) => VideoPlayerScreen(id: id));
      case 'sociology_video_player':
        final String id = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => SociologyVideoPlayerScreen(id: id));
      case 'sociology_video_player':
        final String id = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => SociologyVideoPlayerScreen(id: id));
      case 'notes_screen':
        final String id = settings.arguments;
        return MaterialPageRoute(builder: (_) => NotesScreen(id: id));
      case 'sociology_tests':
        final String id = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => SociologyTestsScreen(id: id)); //
      case 'sociology_notes_screen':
        final String id = settings.arguments;
        return MaterialPageRoute(builder: (_) => SociologyNotesScreen(id: id));
      case 'note_view':
        Map<String, dynamic> body = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => NoteViewScreen(
            title: body['title'],
            pdf: body['pdf'],
          ),
        );
      case 'sociology_note_view':
        Map<String, dynamic> body = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => SociologyNoteViewScreen(
            title: body['title'],
            pdf: body['pdf'],
          ),
        );
      case 'sociology_test':
        Map<String, dynamic> body = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => SociologyTestScreen(
            id: body['id'],
          ),
        );
      case 'current_affair_view':
        Map<String, dynamic> body = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => CurrentAffairsViewScreen(
            title: body['title'],
            pdf: body['pdf'],
          ),
        );
      case 'plans_screen':
        return MaterialPageRoute(builder: (_) => PlansScreen());
      case 'help_screen':
        return MaterialPageRoute(builder: (_) => HelpScreen());
      case 'about_screen':
        return MaterialPageRoute(builder: (_) => AboutScreen());
      case 'contact_screen':
        return MaterialPageRoute(builder: (_) => ContactScreen());
      case 'profile_screen':
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case 'qstudent_screen':
        return MaterialPageRoute(builder: (_) => QstudentScreen());
      case 'login_screen':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case 'current_affair_screen':
        return MaterialPageRoute(builder: (_) => CurrentAffairsScreen());
    }
  }
}
