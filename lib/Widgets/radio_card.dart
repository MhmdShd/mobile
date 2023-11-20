import 'package:flutter/material.dart';

class RadioCard extends StatelessWidget {
  const RadioCard(
      {Key? key,
      this.onTap,
      this.userIcon,
      required this.active,
      this.text,
      this.iconWidth,
      this.iconheight})
      : super(key: key);
  final double? iconWidth;
  final double? iconheight;
  final bool active;
  final VoidCallback? onTap;
  final String? text;
  final String? userIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        alignment: Alignment.center,
        height: 44,
        decoration: BoxDecoration(
          border: Border.all(
              width: 1.5,
              color: (!active)
                  ? Theme.of(context).colorScheme.secondaryContainer
                  : Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(20),
        ),
        child: (userIcon == null)
            ? Text(
                text!,
                style: TextStyle(
                  color: (active)
                      ? Theme.of(context).colorScheme.onSurface
                          
                      : Theme.of(context)
                          .colorScheme
                          .onSurface.withOpacity(.44),
                ),
              )
            : Padding(
              padding: const EdgeInsets.all(6.0),
              child:  Image.asset(
                    userIcon!,
                    color: (active)
                      ? Theme.of(context).colorScheme.onSurface
                          
                      : Theme.of(context)
                          .colorScheme
                          .onSurface.withOpacity(.44),
                    height: iconWidth,
                    width: iconWidth,
                  
              ),
            ),
      ),
    );
  }
}
