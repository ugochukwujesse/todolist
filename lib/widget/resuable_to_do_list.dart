import 'package:flutter/material.dart';
import 'package:to_do_list/home_screen.dart';
import 'package:to_do_list/utility/app_colour.dart';
import 'package:to_do_list/utility/app_font_weight.dart';
import 'package:to_do_list/utility/app_space.dart';
import 'package:to_do_list/utility/app_text_size.dart';



class ReusableToDoList extends StatefulWidget {
  const ReusableToDoList({
    super.key,
    required this.currentDateTime,
    required this.title,
    required this.description,
    required this.icon1,
    required this.icon2,
  });

  final DateTime currentDateTime;
  final String title;
  final String description;
  final Widget icon1;
  final Widget icon2;

  @override
  State<ReusableToDoList> createState() => _ReusableToDoListState();
}

class _ReusableToDoListState extends State<ReusableToDoList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.only(left: 20,right: 20),
      child:  Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                     Text(widget.title,
                      style: const TextStyle(
                        fontSize: AppTextSize.h18,
                        fontWeight: AppFontWeight.w500,
                        color: AppColour.primaryColor,
                      ),
                    ),
                    Spacer(),
                    Text("Date: ${widget.currentDateTime.day}/${widget.currentDateTime.month}/${widget.currentDateTime.year}",
                      style: const TextStyle(
                        fontSize: AppTextSize.h12,
                        fontWeight: AppFontWeight.w400,
                        color: AppColour.textColor,
                      ),
                    )
                  ],
                ),
                AppSpacing.space5,
                 Text(widget.description,
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                    fontWeight: AppFontWeight.w400,
                    fontSize: AppTextSize.h12,
                    color: AppColour.textColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    widget.icon2,
                    const SizedBox(width: 10,),
                    widget.icon1
                  ],
                ),
                AppSpacing.space5,
                Divider(
                  thickness: 1,
                  height: 2,
                  color: AppColour.primaryColor.withOpacity(0.5),
                ),
                AppSpacing.space20


              ],
            ),
          )
        ],
      ),
    );
  }
}