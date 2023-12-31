import 'package:cached_network_image/cached_network_image.dart';
import 'package:damir/main.dart';
import 'package:damir/models/chat_user.dart';
import 'package:flutter/material.dart';

class ChatUserCard extends StatefulWidget {
  final ChatUser user;
  const ChatUserCard({super.key, required this.user});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: mq.width * 0.04, vertical: 4),
        color: Colors.blue.shade100,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: InkWell(
          onTap: () {},
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(mq.height * 0.3),
              child: CachedNetworkImage(
                width: mq.height * 0.055,
                height: mq.height * 0.055,
                fit: BoxFit.cover,
                imageUrl: widget.user.image,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ),
            ),
            title: Text(widget.user.name),
            subtitle: Text(
              widget.user.about,
              maxLines: 1,
            ),
            trailing: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.greenAccent.shade400),
            ),
            //  trailing: Text(
            //   '12:00',
            //   style: TextStyle(color: Colors.black54),
            // ),
          ),
        ));
  }
}
