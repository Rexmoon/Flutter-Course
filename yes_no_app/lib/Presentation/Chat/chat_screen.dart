import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes_no_app/Presentation/SecondView/second_view.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Honey ❤️'),
        leading: const Padding(
          padding: EdgeInsets.all(2.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/564x/05/13/64/051364959f28400a106c55481005854d.jpg'),
          ),
        ),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: true,
      right: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Expanded(
                child: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 2));
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(title: Text('Refreshed'));
                    });
              },
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text('Index: $index'),
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const SecondView()));
                      });
                },
              ),
            )),
            const SizedBox(width: 10)
          ],
        ),
      ),
    );
  }
}
