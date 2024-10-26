import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishtar/common/widget/custom_text_field.dart';
import 'package:ishtar/common/widget/text_widget.dart';
import 'package:ishtar/config/app_text_styles.dart';
import 'package:ishtar/features/chats/cubit/chats_cubit.dart';
import 'package:ishtar/features/chats/models/chats_model.dart';

class ChatInfoScreen extends StatelessWidget {
  final ChatModel chatModel;
  const ChatInfoScreen({super.key, required this.chatModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatsCubit, ChatsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          bottomSheet: CustomCardChat(
            isBottom: true,
            image: chatModel.image,
            name: chatModel.name,
          ),
          body: SafeArea(
            child: Column(
              children: [
                CustomCardChat(
                  image: chatModel.image,
                  name: chatModel.name,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: ChatsCubit.instance.messages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 10.h),
                        child: Align(
                          alignment:
                              ChatsCubit.instance.messages[index].sendByMe
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment:
                                ChatsCubit.instance.messages[index].sendByMe
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 34.h,
                                width: 220.w,
                                padding: EdgeInsets.only(right: 9.w, top: 9.h),
                                //alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: ChatsCubit
                                          .instance.messages[index].sendByMe
                                      ? Color(0xffFFFFFF)
                                      : Color(0xff188DFF),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(13.r),
                                    topRight: Radius.circular(13.r),
                                    // bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(13.r),
                                  ),
                                ),
                                child: TextWidget(
                                  ChatsCubit.instance.messages[index].message,
                                  textStyle: AppTextStyle.textStyle(
                                    appFontSize: 13.sp,
                                    appFontWeight: FontWeight.w600,
                                    appFontHeight: 24.36.sp,
                                    color: ChatsCubit
                                            .instance.messages[index].sendByMe
                                        ? Color(0xff010101)
                                        : Color(0xffFFFFFF),
                                  ),
                                ),
                              ),
                              Container(
                                child: TextWidget(
                                  ChatsCubit.instance.messages[index].time,
                                  textStyle: AppTextStyle.textStyle(
                                      appFontSize: 11.sp,
                                      appFontWeight: FontWeight.w400,
                                      appFontHeight: 20.61.sp,
                                      color: Color(0xff010101)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomCardChat extends StatelessWidget {
  const CustomCardChat({
    super.key,
    required this.name,
    required this.image,
    this.isBottom = false,
  });
  final String name;
  final String image;
  final bool isBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isBottom ? Alignment.center : null,
      height: isBottom ? 103.h : 110.h,
      width: double.infinity,
      padding: isBottom
          ? null
          : EdgeInsets.only(right: 55.w, bottom: 15.h, top: 50.h),
      decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: isBottom
              ? BorderRadius.only(
                  topLeft: Radius.circular(28.r),
                  topRight: Radius.circular(28.r),
                )
              : BorderRadius.only(
                  bottomLeft: Radius.circular(28.r),
                  bottomRight: Radius.circular(28.r),
                ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff0000000F).withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ]),
      child: isBottom
          ? CustomTextField(
              isChatInfo: true,
              // decoration: InputDecoration(
              //   border: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(26.r),
              //   ),
              // ),
            )
          : Row(
              children: [
                Image.asset(
                  image,
                  height: 45.h,
                  width: 45.w,
                ),
                SizedBox(width: 5.w),
                TextWidget(
                  name,
                  textStyle: AppTextStyle.textStyle(
                      appFontSize: 13.sp,
                      appFontWeight: FontWeight.w600,
                      appFontHeight: 24.36,
                      color: Color(0xff010101)),
                ),
              ],
            ),
    );
  }
}
