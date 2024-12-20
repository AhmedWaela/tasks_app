// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:tasks_app/features/tasks/data/models/task_model.dart';

// class TaskWidget extends StatelessWidget {
//   const TaskWidget({super.key, required this.taskModel});
//   final TaskModel taskModel;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         width: MediaQuery.sizeOf(context).width,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Color(0xffF9FFFA),
//           boxShadow: [
//             BoxShadow(
//               color: Color(0x40000000),
//               blurRadius: 5.6,
//               offset: Offset(0, 5.6),
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       taskModel.title,
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
//                     ),
//                     SizedBox(
//                       width: 9,
//                     ),
//                     SvgPicture.asset('assets/images/Bell.svg')
//                   ],
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//                 Text(
//                   taskModel.description ?? '',
//                   style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xff717171)),
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Row(
//                   children: [
//                     SvgPicture.asset('assets/images/Icon (1).svg'),
//                     SizedBox(
//                       width: 4,
//                     ),
//                     Text(
//                         "${taskModel.dateTime.year}-${taskModel.dateTime.month}-${taskModel.dateTime.day}",
//                         style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                             color: Color(0xff717171))),
//                     SizedBox(
//                       width: 17,
//                     ),
//                     SvgPicture.asset('assets/images/Time Circle.svg'),
//                     SizedBox(
//                       width: 4,
//                     ),
//                     Text(
//                         '${taskModel.dateTime.hour}:${taskModel.dateTime.minute}',
//                         style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                             color: Color(0xff717171))),
//                   ],
//                 )
//               ],
//             ),
//             Spacer(),
//             SvgPicture.asset('assets/images/Pen.svg')
//           ],
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasks_app/core/assets/app_assets.dart';
import 'package:tasks_app/core/styles/app_styles.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0XFFF6FFF9),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 5.6,
          ),
        ],
      ),
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Text(
                    'Flutter Session',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  SvgPicture.asset(AppAssets.bellSvgPath)
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Reminder',
                style: AppStyles.textStyle12W400Grey,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.dateSvgPath,
                    height: 16,
                    width: 16,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text(
                    '2024-12-12',
                    style: AppStyles.textStyle12W400Grey,
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  SvgPicture.asset(
                    AppAssets.timeCircleSvgPath,
                    height: 16,
                    width: 16,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text(
                    '2024-12-12',
                    style: AppStyles.textStyle12W400Grey,
                  )
                ],
              ),
            ],
          ),
          Spacer(),
          SvgPicture.asset(
            AppAssets.penSvgPath,
            height: 16,
            width: 16,
          ),
        ],
      ),
    );
  }
}
