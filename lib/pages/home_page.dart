import 'dart:developer';

import 'package:damir/api/apis.dart';
import 'package:damir/main.dart';
import 'package:damir/models/chat_user.dart';
import 'package:damir/pages/profile_page.dart';
import 'package:damir/widgets/chat_user_card.dart';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  static String route = 'HomePage';
}

class _HomePageState extends State<HomePage> {
  List<ChatUser> list = [];

  @override
  void initState() {
    super.initState();
    Apis.getSelfInfo();
    log('API ${Apis.getSelfInfo()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Damir Chat'),
        leading: Icon(Icons.home_outlined),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(
                              user: Apis.me,
                            )));
              },
              icon: Icon(Icons.more_vert)),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 18.0, right: 10.0),
        child: FloatingActionButton(
          onPressed: () async {
            await Apis.auth.signOut();
            await GoogleSignIn().signOut();
          },
          child: Icon(Icons.add_comment_rounded),
        ),
      ),
      body: StreamBuilder(
        stream: Apis.getAllUsers(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              final data = snapshot.data?.docs;

              list =
                  data?.map((e) => ChatUser.fromJson(e.data())).toList() ?? [];
              log('list --> ${list.length}');
              if (list.isNotEmpty) {
                return ListView.builder(
                    padding: EdgeInsets.only(top: mq.height * 0.01),
                    itemCount: list.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ChatUserCard(
                        user: list[index],
                      );
                    });
              } else {
                return Center(
                  child: Text(
                    'No Connection Found',
                    style: TextStyle(fontSize: 20),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
