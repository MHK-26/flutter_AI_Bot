import 'package:ai_bot/chat/view/view.dart';
import 'package:ai_bot/constants/constants.dart';
import 'package:ai_bot/theme/theme_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme/theme_bloc/bloc/theme_bloc.dart';

class MainApp extends StatelessWidget {
  final ThemeRepository themeRepository;

  const MainApp({super.key, required this.themeRepository});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: state.isDarkMode ? darkMode : lightMode,
          home: const ChatScreen(),
        );
      },
    );
  }
}
