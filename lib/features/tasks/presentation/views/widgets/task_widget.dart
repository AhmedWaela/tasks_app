import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasks_app/features/tasks/data/models/task_model.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffF9FFFA),
          boxShadow: [
            BoxShadow(
              color: Color(0x40000000),
              blurRadius: 5.6,
              offset: Offset(0, 5.6),
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      taskModel.title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    SvgPicture.asset('assets/images/Bell.svg')
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  taskModel.description ?? '',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff717171)),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/images/Icon (1).svg'),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                        "${taskModel.dateTime.year}-${taskModel.dateTime.month}-${taskModel.dateTime.day}",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff717171))),
                    SizedBox(
                      width: 17,
                    ),
                    SvgPicture.asset('assets/images/Time Circle.svg'),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                        '${taskModel.dateTime.hour}:${taskModel.dateTime.minute}',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff717171))),
                  ],
                )
              ],
            ),
            Spacer(),
            SvgPicture.asset('assets/images/Pen.svg')
          ],
        ),
      ),
    );
  }
}
