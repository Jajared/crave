import 'dart:convert';
import 'package:crave/core/models/user_model.dart';
import 'package:crave/styles/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

class UserAppBar extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const UserAppBar(
      {super.key, required this.controller, this.isVisible = true});

  final PageController controller;
  final bool isVisible;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(90);
}

class _UserAppBarState extends ConsumerState<UserAppBar> {
  double? page;
  Widget? profilePicture;

  @override
  void initState() {
    super.initState();
    page = 0;
    widget.controller.addListener(() {
      setState(() {
        page = widget.controller.page;
      });
    });
    const FlutterSecureStorage().read(key: 'user').then((user) {
      if (user != null) {
        UserModel currentUser = userModelFromJson(user);
        setState(() {
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
    return Column(
      children: [
        AppBar(
          title: Center(child: Image.asset('assets/img/logo.png', height: 40)),
          toolbarHeight: 40,
          backgroundColor: Colors.transparent,
          actions: [
            TextButton(
              child: Hero(
                  tag: "profile",
                  child: SizedBox(
                      width: 25,
                      height: 25,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: profilePicture,
                          )))),
              onPressed: () {
                context.push('/profile');
              },
            ),
          ],
          leading: TextButton(
            child: const Icon(CupertinoIcons.person_2_fill),
            onPressed: () {
              context.push('/contact');
            },
          ),
        ),
        AnimatedOpacity(
            opacity: widget.isVisible ? 1 : 0,
            duration: const Duration(milliseconds: 200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      widget.controller.animateToPage(0,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    },
                    style: page == 0
                        ? ref.watch(stylesProvider).button.textBtn
                        : ref.watch(stylesProvider).button.textBtnDisabled,
                    child: const Text("My friends")),
                const SizedBox(width: 15),
                TextButton(
                    onPressed: () {
                      widget.controller.animateToPage(1,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    },
                    style: page == 1
                        ? ref.watch(stylesProvider).button.textBtn
                        : ref.watch(stylesProvider).button.textBtnDisabled,
                    child: const Text("Discovery"))
              ],
            ))
      ],
    );
  }
}
