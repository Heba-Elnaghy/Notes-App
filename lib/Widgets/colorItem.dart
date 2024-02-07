// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/cubits/cubit/add_note_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    Key? key,
    required this.isActive,
    required this.color,
  }) : super(key: key);
  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: const Color(0xffF8F6F4),
            radius: 20,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 18,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 20,
          );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndx = 0;

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
                BlocProvider.of<AddNoteCubit>(context).color = KColors[index];
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
