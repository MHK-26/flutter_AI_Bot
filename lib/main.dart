import 'package:ai_bot/app.dart';
import 'package:ai_bot/theme/theme_bloc/bloc/theme_bloc.dart';
import 'package:ai_bot/theme/repo/theme_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  final themeRepository = ThemeRepository();
  runApp(BlocProvider(
    create: (context) => ThemeBloc(themeRepository: themeRepository),
    child: MainApp(
      themeRepository: themeRepository,
    ),
  ));
}
