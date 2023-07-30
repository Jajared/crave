import 'dart:convert';
import 'package:crave/core/models/post_model.dart';
import 'package:crave/core/models/user_model.dart';
import 'package:crave/db/mongodb.dart';
import 'package:crave/styles/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final storage = const FlutterSecureStorage();
  String name = "";
  String email = "";
  Widget? profilePicture;
  String profileBase64 = "";

  @override
  void initState() {
    super.initState();
    HapticFeedback.lightImpact();
    getUserData();
  }

  void getUserData() {
    storage.read(key: 'user').then((user) {
      if (user != null) {
        UserModel currentUser = userModelFromJson(user);
        setState(() {
          name = currentUser.name;
          email = currentUser.email;
          profileBase64 = currentUser.profilePicture;
          profilePicture =
              Image.memory(base64Decode(currentUser.profilePicture));
        });
      } else {
        print('User data not found.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          toolbarHeight: 40,
          leading: TextButton(
            child: const Icon(Icons.arrow_back_outlined),
            onPressed: () => context.pop(),
          ),
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
              child: const Icon(Icons.more_horiz_outlined),
              onPressed: () {},
            ),
            TextButton(
              child: Icon(Icons.add),
              onPressed: () {
                PostModel testData = PostModel(
                    image: "https://picsum.photos/1080/1920",
                    author: UserModel(
                      id: "1",
                      name: "Test User",
                      email: "test@gmail.com",
                      profilePicture: profileBase64,
                    ),
                    location: {"longitude": 103.804832, "latitude": 1.439580});
                MongoDB.addPost(testData);
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                  child: Hero(
                      tag: "profile",
                      child: SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: profilePicture,
                              ))))),
              const SizedBox(height: 10),
              Text(name, style: ref.watch(stylesProvider).text.title),
              Text(email, style: ref.watch(stylesProvider).text.bodyBold),
              const SizedBox(height: 200),
            ],
          ),
        ));
  }
}
