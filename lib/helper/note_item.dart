import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_hive/cubits/loadCubit/load_cubit.dart';
import 'package:note_hive/models/note_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class NoteItem extends StatefulWidget {
  const NoteItem({super.key, required this.pagePath, required this.note});
  final String pagePath;
  final NoteModel note;

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Rebuild the widget every 30 seconds to update the timeago label
    _timer = Timer.periodic(Duration(seconds: 30), (_) {
      // make sure to the widget still mounted (still on screen) before calling setState
      // this prevents memory leaks if the widget is disposed before the timer ticks
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel(); //  Clean up timer to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color(widget.note.color),
          border: Border.all(color: Color(widget.note.color), width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              widget.pagePath,
              arguments: widget.note,
            );
          },
          child: Column(
            children: [
              ListTile(
                title: Text(
                  widget.note.title,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    widget.note.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () async {
                    await widget.note.delete();
                    context.read<LoadCubit>().fetchAllNotes();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          'Note deleted',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        duration: const Duration(seconds: 2),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.delete, color: Colors.black, size: 30),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  timeago.format(
                    widget.note.createdTime,
                  ), //  هذا يتحدث كل 30 ثانية
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
