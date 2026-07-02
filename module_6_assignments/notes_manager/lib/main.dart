import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'config/app_theme.dart';
import 'core/common/repositories/note_repository.dart';
import 'core/providers/theme_provider.dart';
import 'features/home/presentation/controllers/home_controller.dart';
import 'features/add_note/presentation/controllers/add_note_controller.dart';
import 'features/home/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        Provider<NoteRepository>(create: (_) => NoteRepository()),
        ChangeNotifierProxyProvider<NoteRepository, HomeController>(
          create: (context) => HomeController(context.read<NoteRepository>()),
          update: (context, repo, previous) => HomeController(repo),
        ),
        ChangeNotifierProxyProvider<NoteRepository, AddNoteController>(
          create: (context) =>
              AddNoteController(context.read<NoteRepository>()),
          update: (context, repo, previous) => AddNoteController(repo),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            title: 'Notes Manager',
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: AppTheme.lightTheme(),
            darkTheme: AppTheme.darkTheme(),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
