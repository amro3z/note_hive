import 'package:flutter/material.dart';

class ListOfColors extends StatefulWidget {
  const ListOfColors({super.key, required this.onColorSelected});
  final void Function(int) onColorSelected;

  @override
  State<ListOfColors> createState() => _ListOfColorsState();
}

class _ListOfColorsState extends State<ListOfColors> {
  int colorOfNote = Colors.yellow.value; // Default selected color

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: Colors.primaries.length,
        itemBuilder: (context, index) {
          final color = Colors.primaries[index];
          final isSelected =
              color.value == colorOfNote; // ✅ check if this color is selected

          return Padding(
            padding: const EdgeInsets.all(4),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  colorOfNote = color.value; // ✅ update selected color
                });
                widget.onColorSelected(
                  colorOfNote,
                ); // ✅ pass selected color to parent (AddForm)
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                  border: isSelected
                      ? Border.all(
                          color: Colors.white,
                          width: 4,
                        ) // ✅ add white border if selected
                      : null,
                ),
                width: 50,
                height: 50,
                child: isSelected
                    ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 26,
                      ) // ✅ show check icon if selected
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
