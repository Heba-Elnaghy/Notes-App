import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';

import '../Models/note_model.dart';
import 'colorItem.dart';

class EditColorListView extends StatefulWidget {
  const EditColorListView({
    Key? key,
    required this.note,
  }) : super(key: key);
  final NoteModel note;

  @override
  State<EditColorListView> createState() => _EditColorListViewState();
}

class _EditColorListViewState extends State<EditColorListView> {
  late int currentIndx;
  @override
  void initState() {
    currentIndx = KColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20 * 2,
      child: ListView.builder(
        itemCount: KColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () {
                currentIndx = index;
                widget.note.color = KColors[index].value;
                setState(() {});
              },
              child: ColorItem(
                color: KColors[index],
                isActive: currentIndx == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
