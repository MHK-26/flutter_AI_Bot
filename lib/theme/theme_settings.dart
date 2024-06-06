// import 'package:ai_bot/theme/theme_bloc/bloc/theme_bloc.dart';
// import 'package:expenses_app/bloc/theme_bloc/bloc/theme_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// class ThemeSettingsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final isDarkMode = context.watch<ThemeBloc>().state.isDarkMode;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Theme Settings',
//             style: TextStyle(
//                 color: Theme.of(context).appBarTheme.backgroundColor)),
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         foregroundColor: Theme.of(context).appBarTheme.backgroundColor,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Toggle Theme',
//               style: AppFonts.bVP_20.copyWith(
//                   color: Theme.of(context).appBarTheme.backgroundColor),
//             ),
//             Switch(
//               value: isDarkMode,
//               onChanged: (_) {
//                 context.read<ThemeBloc>().add(ToggleTheme());
//               },
//             ),
//             // Spacer(),
//             SizedBox(height: 20),

//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 children: [
//                   Text(
//                     'v1.0.0',
//                     style: AppFonts.bVP_12.copyWith(
//                         color: Theme.of(context).appBarTheme.backgroundColor),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'Developed by MHK',
//                     style: AppFonts.bVP_12.copyWith(
//                         color: Theme.of(context).appBarTheme.backgroundColor),
//                   ),
//                   SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       GestureDetector(
//                         onTap: () =>
//                             _launchURL('https://www.linkedin.com/in/mhk-26'),
//                         child: Text(
//                           'LinkedIn',
//                           style: AppFonts.bVP_12.copyWith(
//                             color:
//                                 Theme.of(context).appBarTheme.backgroundColor,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 5.w,
//                       ),
//                       Text(
//                         '.',
//                         style: AppFonts.bVP_12.copyWith(
//                           color: Theme.of(context).appBarTheme.backgroundColor,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 5.w,
//                       ),
//                       GestureDetector(
//                         onTap: () => _launchURL('https://www.mhk26.com'),
//                         child: Text(
//                           'Website',
//                           style: AppFonts.bVP_12.copyWith(
//                             color:
//                                 Theme.of(context).appBarTheme.backgroundColor,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//     );
//   }

//   void _launchURL(String url) async {
//     if (await canLaunchUrl(Uri.parse(url))) {
//       await launchUrl(Uri.parse(url));
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }
