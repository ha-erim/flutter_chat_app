import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(this.message, this.userName, this.userImage, this.isME,
      {required this.key});

  final Key key;
  final String message;
  final bool isME;
  final String userName;
  final String userImage;
  // const MessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              isME ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: isME
                      ? Colors.grey[300]
                      : Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft:
                        !isME ? Radius.circular(0) : Radius.circular(12),
                    bottomRight:
                        isME ? Radius.circular(0) : Radius.circular(12),
                  )),
              width: 140,
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment:
                    isME ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isME
                          ? Colors.black
                          : Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  Text(
                    message,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: isME
                              ? Colors.black
                              : Theme.of(context).colorScheme.onSecondary,
                        ),
                    textAlign: isME ? TextAlign.end : TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: isME ? null : 120,
          right: isME ? 120 : null,
          child: CircleAvatar(
            backgroundImage: NetworkImage(userImage),
          ),
        ),
      ],
      clipBehavior: Clip.none,
    );
  }
}
