import 'package:flutter/material.dart';
import 'package:responsive_ui/app_setting.dart';
import 'package:responsive_ui/ui/list_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery
    // Lấy thông tin liên quan đến kích cỡ màn hình, chiều doc/ngang
    final mq = MediaQuery.of(context);
    print('Width = ${mq.size.width}');
    print('Height = ${mq.size.height}');
    print('Aspect ratio = ${mq.size.aspectRatio}');
    print('Orientation = ${mq.orientation}');


    // 1st
    // if (mq.orientation == Orientation.landscape) {
    //   return ListProduct(col: 4);
    // } else {
    //   return ListProduct(col: 2);
    // }

    // 2nd way: breakpoint = 600
    // final isWide = mq.size.width >= AppSetting.WIDE_SCREEN_BREAKPOINT;
    // if (isWide) {
    //   return ListProduct(col: 4);
    // } else {
    //   return ListProduct(col: 2);
    // }

    // LayoutBuilder
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        print('maxWidth = ${constraints.maxWidth}');
        if (constraints.maxWidth >= AppSetting.WIDE_SCREEN_BREAKPOINT) {
          return ListProductHorizontal();
        } else {
          return ListProduct(col: 2);
        }
      }),
    );

    // OrientationBuilder
    // return Scaffold(
    //   body: OrientationBuilder(builder: (context, orientation) {
    //     // Che độ dọc
    //     if (orientation == Orientation.portrait) {
    //       return ListProduct(col: 2);
    //     } else { // Ngnag
    //       return ListProductHorizontal();
    //     }
    //   }),
    // );
  }
}
