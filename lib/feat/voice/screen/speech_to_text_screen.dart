import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextScreen extends StatefulWidget {
  const SpeechToTextScreen({super.key});

  @override
  State<SpeechToTextScreen> createState() => _SpeechToTextScreenState();
}

class _SpeechToTextScreenState extends State<SpeechToTextScreen> {
  late stt.SpeechToText _speech;
  late TextEditingController _controller;

  bool _isListening = false;
  int _cursorPosition = 0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _controller = TextEditingController();
    _controller.addListener(_updateCursorPosition);
  }

  void _updateCursorPosition() {
    _cursorPosition = _controller.selection.baseOffset;
  }

  void _listen() async {
    void onSpeechResult(SpeechRecognitionResult result) {
      setState(() {
        if (_isListening) {
          _controller.text = result.recognizedWords;
        }
      });
    }

    if (!_isListening) {
      bool available = await _speech.initialize();
      if (available) {
        setState(() => _isListening = true);

        _speech.listen(onResult: onSpeechResult);
      }
    } else {
      setState(() => _isListening = false);
      // _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speech to Text Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Your text will appear here...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _listen,
              child: Text(_isListening ? 'Stop Listening' : 'Start Listening'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_updateCursorPosition);
    _controller.dispose();
    super.dispose();
  }
}
