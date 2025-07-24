import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_hive/cubits/loadCubit/load_cubit.dart';
import 'package:note_hive/models/note_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.pagePath, required this.note});
  final String pagePath;
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border.all(color: Colors.yellow, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, pagePath);
          },
          child: Column(
            children: [
              ListTile(
                title: Text(
                  note.title,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    note.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () async {
                    // Delete the note from Hive
                    await note.delete(); // ✅ حذف النوت من Hive
                    final cubit = context.read<LoadCubit>();
                    cubit.fetchAllNotes();
                    // Show a snackbar to confirm deletion
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Note deleted',
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 16 ,fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        animation: CurvedAnimation(
                          parent: AnimationController(
                            vsync: Scaffold.of(context),
                            duration: Duration(milliseconds: 300),
                          ),
                          curve: Curves.easeInOut,
                      ),
                      )
                    );
                  },
                  icon: Icon(Icons.delete, color: Colors.black, size: 30),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  textAlign: TextAlign.right,
                  // Format hour and minute with leading zero if needed (e.g., 08:07 instead of 8:7)
                  //"${note.createdTime.hour.toString().padLeft(2, '0')}:${note.createdTime.minute.toString().padLeft(2, '0')}",
                  //there is another way using intl package
                  timeago.format(note.createdTime),
                  style: TextStyle(
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
