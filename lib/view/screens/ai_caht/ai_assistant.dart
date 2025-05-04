import 'package:flutter/material.dart';
import 'package:insider_jobs/utils/chat_data.dart';
import 'package:insider_jobs/view/widgets/my_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:q_chat_bot/q_bot.dart';
import 'package:q_chat_bot/q_bot_config.dart';

import '../../widgets/my_drawer.dart';

class AiAssistant extends StatefulWidget {
  const AiAssistant({super.key});

  @override
  State<AiAssistant> createState() => _AiAssistantState();
}

class _AiAssistantState extends State<AiAssistant> {


  QBotConfig config = QBotConfig(
    txtFieldPadding: EdgeInsets.fromLTRB(8, 8, 0, 8),
    msgController: TextEditingController(),
    hintText: "Type your message",
    welcomeMsg: "Hi",
    botIcon: Icon(Icons.smart_toy_outlined),
    botMsgBgColor: Color(0xFFF35AA0),
    userIcon: Icon(Icons.person),
    userMsgBgColor: Color(0xFF9C27B0).withOpacity(0.6),
    paddingBetweenMsgs: 8,
    msgStyle: TextStyle(
      color: Colors.white
    ),
    msgTime: Text(
      DateFormat('hh:mm a').format(DateTime.now()),
      style: TextStyle(
        color: Colors.grey,
        fontSize: 10,
        fontWeight: FontWeight.w500
      ),
    ),
    sendIcon: Icon(
      Icons.send,
      color: Color(0xFF9C27B0),
    ),
    bgColor: Color(0xFF9C27B0).withOpacity(0.05),
    txtFiledDecoration: InputDecoration(
      hintText: "Type your message",
      hintStyle: TextStyle(
          color: Color(0xFFF35AA0).withOpacity(0.3)
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: Color(0xFFF35AA0).withOpacity(0.7),
        ),
      ),
    ),
    keywords: keywords,
    responses: responses,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(
          title: "Ai Assistant",
          color: Color.lerp(Color(0xFFF35AA0), Color(0xFF9C27B0), 0.5),
        ),
        drawer: const MyDrawer(),
      body: QBot(config: config) // QBot is a widget that takes the config as a parameter
    );
  }
}
