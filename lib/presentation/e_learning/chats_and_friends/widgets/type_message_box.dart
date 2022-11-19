import 'package:academic_master/application/e_learning/chats_and_friends/add_group_chat_message/add_group_chat_message_bloc.dart';
import 'package:academic_master/injection.dart';
import 'package:academic_master/presentation/core/custum_textfield.dart';
import 'package:academic_master/presentation/theme/theme.dart';
import 'package:academic_master/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageInputField extends StatefulWidget {
  const MessageInputField({
    Key? key,
  }) : super(key: key);

  @override
  State<MessageInputField> createState() => _MessageInputFieldState();
}

class _MessageInputFieldState extends State<MessageInputField> {
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddGroupChatMessageBloc>(),
      child: BlocBuilder<AddGroupChatMessageBloc, AddGroupChatMessageState>(
        builder: (context, initialGroupChatMessageState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: bottomPadding,
              left: leftPadding / 2,
              right: rightpadding / 2,
            ),
            child: InputField(
              backgroundColor: Apptheme.backgroundColor,
              controller: messageController,
              hintText: "Type Something..",
              onChanged: (value) {
                context.read<AddGroupChatMessageBloc>().add(
                      AddGroupChatMessageEvent.messageDescriptionChanged(
                        value!,
                      ),
                    );
              },
              suffixIcon: Padding(
                padding: const EdgeInsets.only(
                  right: 18,
                ),
                child: GestureDetector(
                  onTap: () {
                    context.read<AddGroupChatMessageBloc>().add(
                          AddGroupChatMessageEvent.addMessagePressed(
                            initialGroupChatMessageState.message,
                          ),
                        );

                    messageController.clear();
                  },
                  child: CircleAvatar(
                    backgroundColor: Apptheme.primaryColor,
                    radius: 16.r,
                    child: Icon(
                      Icons.arrow_upward,
                      size: 17.h,
                      color: Apptheme.backgroundColor,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}
