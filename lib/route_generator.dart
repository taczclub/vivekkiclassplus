import 'package:flutter/material.dart';
import 'package:vivekkiclassplus/screens/CurrentAffairViewScreen.dart';
import 'package:vivekkiclassplus/screens/CurrentAffairsScreen.dart';
import 'package:vivekkiclassplus/screens/NetjrfScreen.dart';
import 'package:vivekkiclassplus/screens/NetjrfTestCategoryScreen.dart';
import 'package:vivekkiclassplus/screens/NetjrfTestScreen.dart';
import 'package:vivekkiclassplus/screens/NetjrfTestSubcategoryScreen.dart';
import 'package:vivekkiclassplus/screens/NetjrfTestsScreen.dart';
import 'package:vivekkiclassplus/screens/PpNoteCategoryScreen.dart';
import 'package:vivekkiclassplus/screens/PpNoteView.dart';
import 'package:vivekkiclassplus/screens/PpNotesScreen.dart';
import 'package:vivekkiclassplus/screens/PpScreen.dart';
import 'package:vivekkiclassplus/screens/PpTestCategoryScreen.dart';
import 'package:vivekkiclassplus/screens/PpTestScreen.dart';
import 'package:vivekkiclassplus/screens/PpTestSubCategoryScreen.dart';
import 'package:vivekkiclassplus/screens/PpTestsScreen.dart';
import 'package:vivekkiclassplus/screens/PpVideoCategoryScreen.dart';
import 'package:vivekkiclassplus/screens/PpVideoPlayerScreen.dart';
import 'package:vivekkiclassplus/screens/PpVideoSubCategoryScreen.dart';
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
      case 'netjrf_videos_category':
        return MaterialPageRoute(builder: (_) => VideoCategoryScreen());
      case 'sociology_category':
        return MaterialPageRoute(builder: (_) => SociologyCategoryScreen());
      case 'pp_category':
        return MaterialPageRoute(builder: (_) => PpCategoryScreen());
      case 'netjrf_category':
        return MaterialPageRoute(builder: (_) => NetjrfCategoryScreen());
      case 'sociology_videos_category':
        return MaterialPageRoute(
            builder: (_) => SociologyVideoCategoryScreen());
      case 'pp_videos_category':
        return MaterialPageRoute(builder: (_) => PpVideoCategoryScreen());
      case 'videos_sub_category':
        final String id = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => VideoSubCategoryScreen(id: id));
      case 'netjrf_notes_category':
        return MaterialPageRoute(builder: (_) => NoteCategoryScreen());
      case 'sociology_notes_category':
        return MaterialPageRoute(builder: (_) => SociologyNoteCategoryScreen());
      case 'pp_notes_category':
        return MaterialPageRoute(builder: (_) => PpNoteCategoryScreen());
      case 'sociology_tests_category':
        return MaterialPageRoute(builder: (_) => SociologyTestCategoryScreen());
      case 'pp_tests_category':
        return MaterialPageRoute(builder: (_) => PpTestCategoryScreen());
      case 'netjrf_tests_category':
        return MaterialPageRoute(builder: (_) => NetjrfTestCategoryScreen());
      case 'notes_sub_category':
        final String id = settings.arguments;
        return MaterialPageRoute(builder: (_) => NoteSubCategoryScreen(id: id));
      case 'sociology_notes_sub_category':
        final String id = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => SociologyTestSubCategoryScreen(id: id));
      case 'pp_notes_sub_category':
        final String id = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => PpTestSubCategoryScreen(id: id));
      case 'sociology_tests_sub_category':
        final String id = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => SociologyTestSubCategoryScreen(id: id));
      case 'pp_tests_sub_category':
        final String id = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => PpTestSubCategoryScreen(id: id));
      case 'netjrf_tests_sub_category':
        final String id = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => NetjrfTestSubCategoryScreen(id: id));
      case 'sociology_videos_sub_category':
        final String id = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => SociologyVideoSubCategoryScreen(id: id));
      case 'pp_videos_sub_category':
        final String id = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => PpVideoSubCategoryScreen(id: id));
      case 'video_player':
        final String id = settings.arguments;
        return MaterialPageRoute(builder: (_) => VideoPlayerScreen(id: id));
      case 'sociology_video_player':
        final String id = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => SociologyVideoPlayerScreen(id: id));
      case 'pp_video_player':
        final String id = settings.arguments;
        return MaterialPageRoute(builder: (_) => PpVideoPlayerScreen(id: id));
      case 'notes_screen':
        final String id = settings.arguments;
        return MaterialPageRoute(builder: (_) => NotesScreen(id: id));
      case 'sociology_tests':
        final String id = settings.arguments;
        return MaterialPageRoute(builder: (_) => SociologyTestsScreen(id: id));
      case 'pp_tests':
        final String id = settings.arguments;
        return MaterialPageRoute(builder: (_) => PpTestsScreen(id: id));
      case 'netjrf_tests':
        final String id = settings.arguments;
        return MaterialPageRoute(builder: (_) => NetjrfTestsScreen(id: id));
      case 'sociology_notes_screen':
        final String id = settings.arguments;
        return MaterialPageRoute(builder: (_) => SociologyNotesScreen(id: id));
      case 'pp_notes_screen':
        final String id = settings.arguments;
        return MaterialPageRoute(builder: (_) => PpNotesScreen(id: id));
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
      case 'pp_note_view':
        Map<String, dynamic> body = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => PpNoteViewScreen(
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
      case 'netjrf_test':
        Map<String, dynamic> body = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => NetjrfTestScreen(
            id: body['id'],
          ),
        );
      case 'pp_test':
        Map<String, dynamic> body = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => PpTestScreen(
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
