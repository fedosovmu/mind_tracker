import 'package:flutter/material.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_app_bar.dart';
import 'package:mind_tracker/src/views/common_widgets/custom_leading.dart';
import 'package:mind_tracker/src/views/common_widgets/standard_button.dart';
import 'package:mind_tracker/src/views/screens/mood_assessment/note_screen/widgets/note_text_input.dart';
import 'package:mind_tracker/src/views/utils/metrics.dart';
import 'package:mind_tracker/src/views/utils/custom_icon_paths.dart';


class NoteScreen extends StatelessWidget {
  String _note;

  NoteScreen(oldNote) {
    _note = oldNote;
  }

  @override
  Widget build(BuildContext context) {
    final noteTextInput = NoteTextInput(_note);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Заметка',
        leading: CustomLeading(
          pathToIcon: CustomIconPaths.back,
          onPressed: () {
            print('Back button pressed');
            Navigator.pop(context);
          }
        ),
      ),
      body: SizedBox.expand(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: dp(16), right: dp(16), top: dp(16)),
              child: noteTextInput,
            ),
            Positioned(
              left: dp(16),
              right: dp(16),
              bottom: 0,
              child: SafeArea(
                minimum: EdgeInsets.only(bottom: dp(16)),
                child: StandardButton(
                  title: 'Добавить',
                  onPressed: () {
                    print('Add note button pressed');
                    String note = noteTextInput.controller.text;
                    Navigator.of(context).pop(note);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}