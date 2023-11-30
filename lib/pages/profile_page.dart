import 'package:cached_network_image/cached_network_image.dart';
import 'package:damir/api/apis.dart';
import 'package:damir/helper/dialogs.dart';
import 'package:damir/main.dart';
import 'package:damir/models/chat_user.dart';
import 'package:damir/pages/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilePage extends StatefulWidget {
  final ChatUser user;
  const ProfilePage({super.key, required this.user});

  @override
  State<ProfilePage> createState() => _ProfilePageState();

  static String route = 'ProfilePage';
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Profile Page'),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            ],
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 18.0, right: 10.0),
            child: FloatingActionButton.extended(
              backgroundColor: Colors.redAccent,
              onPressed: () async {
                Dialogs.showProgressBar(context);
                await Apis.auth.signOut().then((value) async {
                  await GoogleSignIn().signOut().then((value) {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  });
                });
              },
              icon: Icon(Icons.logout),
              label: Text('Logout'),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * 0.05),
            child: Column(
              children: [
                SizedBox(
                  width: mq.width,
                  height: mq.height * 0.05,
                ),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(mq.height * 0.1),
                      child: CachedNetworkImage(
                        width: mq.height * 0.2,
                        height: mq.height * 0.2,
                        fit: BoxFit.cover,
                        imageUrl: widget.user.image,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => CircleAvatar(
                          child: Icon(
                            Icons.person,
                            size: 120,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: MaterialButton(
                        color: Colors.white,
                        shape: CircleBorder(),
                        onPressed: () {},
                        child: Icon(Icons.edit, color: Colors.blue),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: mq.width,
                  height: mq.height * 0.05,
                ),
                Text(
                  widget.user.email,
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
                SizedBox(
                  width: mq.width,
                  height: mq.height * 0.05,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    hintText: 'eg. Happy Singh',
                    labelText: 'Name',
                  ),
                  initialValue: widget.user.name,
                ),
                SizedBox(
                  width: mq.width,
                  height: mq.height * 0.05,
                ),
                TextFormField(
                  initialValue: widget.user.about,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.info,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    hintText: 'eg. Feeling Happy',
                    labelText: 'About',
                  ),
                ),
                SizedBox(
                  width: mq.width,
                  height: mq.height * 0.05,
                ),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        minimumSize: Size(mq.width * 0.4, mq.height * 0.06)),
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      size: 30,
                    ),
                    label: Text(
                      'UPDATE',
                      style: TextStyle(fontSize: 16),
                    )),
              ],
            ),
          )),
    );
  }
}
