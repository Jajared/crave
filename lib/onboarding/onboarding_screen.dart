import 'dart:convert';
import 'dart:io';

import 'package:crave/core/models/user_model.dart';
import 'package:crave/core/ui/anon_appbar_widget.dart';
import 'package:crave/db/mongodb.dart';
import 'package:crave/styles/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key, required this.step});

  final int step;

  @override
  ConsumerState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  int step = 0;

  List<String> titles = [
    "Let’s get started, what's your email?",
    "How should we call you?",
    "Upload a profile picture"
  ];

  List<String> placeholders = [
    "Your email",
    "Your name",
    "Upload a profile picture"
  ];

  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
  ];

  List<bool> hasError = [false, false, false];
  File? _pickedImage;
  bool isPickingImage = false;

  @override
  void initState() {
    super.initState();
    step = widget.step;
  }

  Widget _step1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text(
                titles[step],
                style: ref.watch(stylesProvider).text.bodySmallBold,
              ),
              TextField(
                controller: controllers[step],
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: placeholders[step],
                  hintStyle: ref.watch(stylesProvider).text.hint,
                  errorText: hasError[step] ? 'Value can\'t be empty' : null,
                ),
                style: ref
                    .watch(stylesProvider)
                    .text
                    .hint
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: ElevatedButton(
                style: ref.watch(stylesProvider).button.primaryLarge,
                onPressed: () {
                  if (controllers[step].text.isNotEmpty) {
                    setState(() {
                      titles[step + 1] = titles[step + 1]
                          .replaceAll("#name", controllers[step].text);
                      step = step + 1;
                    });
                  } else {
                    setState(() {
                      hasError[step] = true;
                    });
                  }
                },
                child: const Text('Continue'))),
      ],
    );
  }

  Widget _step2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text(
                titles[step],
                style: ref.watch(stylesProvider).text.bodySmallBold,
              ),
              TextField(
                controller: controllers[step],
                maxLength: 10,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: placeholders[step],
                  hintStyle: ref.watch(stylesProvider).text.hint,
                  errorText: hasError[step] ? 'Value can\'t be empty' : null,
                ),
                style: ref
                    .watch(stylesProvider)
                    .text
                    .hint
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: ElevatedButton(
                style: ref.watch(stylesProvider).button.primaryLarge,
                onPressed: () {
                  if (controllers[step].text.isNotEmpty) {
                    setState(() {
                      step = step + 1;
                    });
                  } else {
                    setState(() {
                      hasError[step] = true;
                    });
                  }
                },
                child: const Text('Continue'))),
      ],
    );
  }

  Widget _step3() {
    void _pickImage(ImageSource source) async {
      if (isPickingImage) return;
      setState(() {
        isPickingImage = true;
      });
      try {
        final pickedFile = await ImagePicker().pickImage(source: source);
        if (pickedFile != null) {
          setState(() {
            _pickedImage = File(pickedFile.path);
          });
        }
      } on PlatformException catch (e) {
        // Handle errors related to image picking
        print('Error picking image: $e');
      } finally {
        setState(() {
          isPickingImage = false;
        });
      }
    }

    void _takePhoto() {
      _pickImage(ImageSource.camera);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text(
                titles[step],
                style: ref.watch(stylesProvider).text.bodySmallBold,
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: _pickedImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.file(
                          _pickedImage!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Icon(
                        Icons.camera_alt,
                        size: 100,
                        color: Colors.grey[600],
                      ),
              ),
              ElevatedButton(
                onPressed: () => _takePhoto(),
                child: Text('Take Picture'),
              ),
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.gallery),
                child: Text('Choose from Gallery'),
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: ElevatedButton(
                style: ref.watch(stylesProvider).button.primaryLarge,
                onPressed: () {
                  if (_pickedImage != null) {
                    String profilePicture =
                        base64Encode(_pickedImage!.readAsBytesSync());
                    _addNewUser("1", controllers[0].text, controllers[1].text,
                            profilePicture)
                        .then((result) {
                      if (result == true) {
                        const storage = FlutterSecureStorage();
                        storage
                            .write(
                                key: 'user',
                                value: userModelToJson(UserModel(
                                    id: "1",
                                    name: controllers[1].text,
                                    email: controllers[0].text,
                                    profilePicture: profilePicture)))
                            .then((_) => context.go('/'));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Error creating user'),
                          ),
                        );
                      }
                    });
                  } else {
                    print("error");
                    setState(() {
                      hasError[step] = true;
                    });
                  }
                },
                child: const Text('Continue'))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AnonAppBar(),
      body: SafeArea(
          child: Center(
        child: _renderStep(),
      )),
    );
  }

  Widget _renderStep() {
    switch (step) {
      case 0:
        return _step1();
      case 1:
        return _step2();
      case 2:
        return _step3();
      default:
        return _step1();
    }
  }

  Future<bool> _addNewUser(
      String id, String name, String email, String profilePicture) async {
    UserModel newUser = UserModel(
        id: id, name: name, email: email, profilePicture: profilePicture);
    var result = await MongoDB.addNewUser(newUser);
    return result;
  }
}

class CustomInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    var buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;

      if ((nonZeroIndex == 2 || nonZeroIndex == 4) &&
          nonZeroIndex != text.length) {
        buffer.write(' ');
      }
    }

    var string = buffer.toString();

    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
