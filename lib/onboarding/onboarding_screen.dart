import 'package:crave/core/models/user_model.dart';
import 'package:crave/core/ui/anon_appbar_widget.dart';
import 'package:crave/db/mongodb.dart';
import 'package:crave/styles/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

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
    "How should we call you?"
  ];

  List<String> placeholders = [
    "Your email",
    "Your name",
  ];

  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
  ];

  List<bool> hasError = [false, false];

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
                    _addNewUser(
                      "1",
                      controllers[0].text,
                      controllers[1].text,
                    ).then((result) {
                      if (result == true) {
                        const storage = FlutterSecureStorage();
                        storage
                            .write(
                                key: 'user',
                                value: userModelToJson(UserModel(
                                    id: "1",
                                    name: controllers[1].text,
                                    email: controllers[0].text)))
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
      default:
        return _step1();
    }
  }

  Future<bool> _addNewUser(String id, String name, String email) async {
    UserModel newUser = UserModel(id: id, name: name, email: email);
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
