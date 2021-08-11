import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:fs_shim/fs_shim.dart';
import 'package:function_types/function_types.dart';
import 'package:path/path.dart' as p;

class NoteFileNameEditor extends StatefulWidget {
  final String filePath;
  final FileSystem fs;
  final Func2<String, bool, void> onChanged;

  final String fileName;
  final String dirName;

  NoteFileNameEditor({
    required this.filePath,
    required this.fs,
    required this.onChanged,
  })  : fileName = p.basename(filePath),
        dirName = p.dirname(filePath);

  @override
  _NoteFileNameEditorState createState() => _NoteFileNameEditorState();
}

class _NoteFileNameEditorState extends State<NoteFileNameEditor> {
  bool exists = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.headline6;

    return TextField(
      keyboardType: TextInputType.text,
      style: style,
      decoration: InputDecoration(
        hintText: tr('editors.common.defaultFileNameHint'),
        border: InputBorder.none,
        fillColor: theme.scaffoldBackgroundColor,
        hoverColor: theme.scaffoldBackgroundColor,
        contentPadding: const EdgeInsets.all(0.0),
      ),
      // controller: widget.textController,
      textCapitalization: TextCapitalization.sentences,
      maxLines: null,
      onChanged: _onChanged,
    );
  }

  void _onChanged(String name) async {
    //var newPath = p.join(widget.dirName, name);

    // Check if the path exists
    // Handle other exceptions!
    // Accordingly fuck
    /*
    var e = widget.fileNameExists(value);
    if (e != exists) {
      setState(() {
        exists = e;
      });
    }

    widget.onChanged(name, e);
    */
  }

  // TODO: Ensure it cannot contain / or some other special characters
}