import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:window_manager/window_manager.dart';

import 'desktop_window_bar_button.dart';

class DesktopWindowBar extends StatefulWidget {
  final Widget? child;

  const DesktopWindowBar({super.key, this.child});

  @override
  State<DesktopWindowBar> createState() => _DesktopWindowBarState();
}

class _DesktopWindowBarState extends State<DesktopWindowBar> {
  var _isMaximized = false;

  @override
  Widget build(BuildContext context) {
    final windowManager = WindowManager.instance;

    return GestureDetector(
      onPanUpdate: (details) {
        if (_isMaximized) {
          setState(() {
            _isMaximized = false;
          });
        }
        windowManager.startDragging();
      },
      onSecondaryTap: () {
        windowManager.popUpWindowMenu();
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            )),
        height: 38,
        child: Row(children: [
          Expanded(child: widget.child ?? Container()),
          Row(
            children: [
              const SizedBox(width: 10),
              DesktopWindowBarButton(
                icon: const Icon(Icons.minimize_rounded),
                onPressed: () async {
                  await windowManager.minimize();
                },
              ),
              const SizedBox(width: 15),
              DesktopWindowBarButton(
                icon: _isMaximized
                    ? const Icon(Icons.crop_16_9_rounded)
                    : const Icon(Icons.crop_square_rounded),
                onPressed: () async {
                  if (_isMaximized) {
                    await windowManager.unmaximize();
                  } else {
                    await windowManager.maximize();
                  }
                  setState(() {
                    _isMaximized = !_isMaximized;
                  });
                },
              ),
              const SizedBox(width: 15),
              DesktopWindowBarButton(
                icon: const Icon(Icons.close_rounded),
                onPressed: () {
                  SystemNavigator.pop();
                },
              ),
              const SizedBox(width: 10),
            ],
          ),
        ]),
      ),
    );
  }
}
