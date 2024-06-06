import 'package:ai_bot/chat/chat.dart';
import 'package:ai_bot/chat/widgets/widgets.dart';
import 'package:ai_bot/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _inputController = TextEditingController();
  final List<Message> _messages = [];
  bool _isLoading = false;

  /// Calls the Gemini model to generate a response based on user input.
  Future<void> callGeminiModel() async {
    final inputText = _inputController.text.trim();
    if (inputText.isNotEmpty) {
      setState(() {
        _isLoading = true;
        _messages.add(Message(text: inputText, isUser: true));
        _inputController.clear();
      });
      try {
        final model = GenerativeModel(
          model: 'gemini-pro',
          apiKey: dotenv.env['GOOGLE_API_KEY']!,
        );
        final content = [Content.text(inputText)];
        final response = await model.generateContent(content);

        setState(() {
          _messages.add(Message(text: response.text!, isUser: false));
        });
      } catch (e) {
        setState(() {
          _messages.add(Message(text: 'somthing went wrong', isUser: false));
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeBloc>().state.isDarkMode;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        title: Text(
          'AI Bot',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            icon: isDarkMode
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
            onPressed: () => context.read<ThemeBloc>().add(ToggleTheme()),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: _messages.isEmpty
                ? Center(
                    child: Text(
                      'Start chatting with the AI bot now',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  )
                : ListView.builder(
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];
                      return MessageTile(message: message);
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _inputController,
                      decoration: InputDecoration(
                        hintText: 'Write your message...',
                        hintStyle: Theme.of(context).textTheme.bodySmall,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _isLoading ? null : callGeminiModel,
                    icon: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.send),
                    ),
                    color: _isLoading ? Colors.grey : Colors.blue,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
