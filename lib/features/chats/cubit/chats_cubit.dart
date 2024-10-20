import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishtar/app/app.dart';
import 'package:ishtar/config/resources.dart';
import 'package:ishtar/features/chats/models/chats_model.dart';
import 'package:ishtar/features/chats/models/message_model.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit() : super(ChatsInitial());

  static final ChatsCubit _chatsCubit =
      BlocProvider.of(navigatorKey.currentContext!);

  static ChatsCubit get instance => _chatsCubit;

  List<ChatModel> chats = [
    ChatModel(
        id: 1,
        name: "الاسم هنا",
        message: "نص الرساله الأول يظهر هنا",
        image: ImageManger.pic1,
        date: "منذ 2 دقيقة"),
    ChatModel(
        id: 2,
        name: "الاسم هنا",
        message: "نص الرساله الأول يظهر هنا",
        image: ImageManger.pic2,
        date: "منذ 2 دقيقة"),
    ChatModel(
        id: 3,
        name: "الاسم هنا",
        message: "نص الرساله الأول يظهر هنا",
        image: ImageManger.pic3,
        date: "منذ 2 دقيقة"),
    ChatModel(
        id: 4,
        name: "الاسم هنا",
        message: "نص الرساله الأول يظهر هنا",
        image: ImageManger.pic4,
        date: "منذ 2 دقيقة"),
    ChatModel(
        id: 5,
        name: "الاسم هنا",
        message: "نص الرساله الأول يظهر هنا",
        image: ImageManger.profileHome,
        date: "منذ 2 دقيقة"),
    ChatModel(
        id: 6,
        name: "الاسم هنا",
        message: "نص الرساله الأول يظهر هنا",
        image: ImageManger.pic5,
        date: "منذ 2 دقيقة"),
    ChatModel(
        id: 7,
        name: "الاسم هنا",
        message: "نص الرساله الأول يظهر هنا",
        image: ImageManger.pic6,
        date: "منذ 2 دقيقة"),
    ChatModel(
        id: 8,
        name: "الاسم هنا",
        message: "نص الرساله الأول يظهر هنا",
        image: ImageManger.pic6,
        date: "منذ 2 دقيقة"),
    ChatModel(
        id: 7,
        name: "الاسم هنا",
        message: "نص الرساله الأول يظهر هنا",
        image: ImageManger.pic6,
        date: "منذ 2 دقيقة"),
  ];
  List<MessagesModel> messages = [
    MessagesModel(
      message: 'نص الرساله المرسل من قبلي هنا',
      sendByMe: true,
      time: '6:12Pm',
    ),
    MessagesModel(
      message: 'نص الرساله المرسل من المرسل هنا',
      sendByMe: false,
      time: '6:10 Pm',
    ),
    MessagesModel(
      message: 'نص الرساله المرسل من قبلي هنا',
      sendByMe: true,
      time: '6:10 Pm',
    ),
    MessagesModel(
      message: 'نص الرساله المرسل من المرسل هنا',
      sendByMe: false,
      time: '6:08 Pm',
    ),
  ];
}
