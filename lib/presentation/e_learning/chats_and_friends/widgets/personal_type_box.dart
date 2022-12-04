import 'package:academic_master/application/e_learning/chats_and_friends/add_personal_chat_message/add_personal_chat_message_bloc.dart';
import 'package:academic_master/injection.dart';
import 'package:academic_master/presentation/core/custum_textfield.dart';
import 'package:academic_master/presentation/theme/theme.dart';
import 'package:academic_master/presentation/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalTypeBoxField extends StatefulWidget {
  final String partnerId;
  const PersonalTypeBoxField({
    super.key,
    required this.partnerId,
  });

  @override
  State<PersonalTypeBoxField> createState() => _PersonalMessageBoxFieldState();
}

class _PersonalMessageBoxFieldState extends State<PersonalTypeBoxField> {
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddPersonalChatMessageBloc>(),
      child:
          BlocBuilder<AddPersonalChatMessageBloc, AddPersonalChatMessageState>(
        builder: (context, initialPersonalChatMessageState) {
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
                context.read<AddPersonalChatMessageBloc>().add(
                      AddPersonalChatMessageEvent.messageDescriptionChanged(
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
                    context.read<AddPersonalChatMessageBloc>().add(
                          AddPersonalChatMessageEvent.addMessagePressed(
                            initialPersonalChatMessageState.message,
                            widget.partnerId,
                          ),
                        );
                    messageController.clear();
                  },
                  child: CircleAvatar(
                    backgroundColor: Apptheme.primaryColor,
                    // ignore: sort_child_properties_last
                    child: Icon(
                      Icons.arrow_upward,
                      size: 17.h,
                      color: Apptheme.backgroundColor,
                    ),
                    radius: 16.r,
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
