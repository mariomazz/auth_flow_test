import 'package:flutter/material.dart';

class KeyboardDisposable extends StatefulWidget {
  final bool active;
  final FocusNode? node;
  final Widget Function(FocusNode focus, void Function() openKeyboard,
      void Function() closeKeyboard) builder;
  const KeyboardDisposable({
    Key? key,
    this.node,
    required this.builder,
    this.active = true,
  }) : super(key: key);

  @override
  State<KeyboardDisposable> createState() => _KeyboardDisposableState();
}

class _KeyboardDisposableState extends State<KeyboardDisposable> {
  late final FocusNode node;
  @override
  void initState() {
    node = widget.node ?? FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _requestChangeStateKeyboard(node, _KeyboardState.close,
          keyboardChangeStateIsSupported: widget.active),
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      child: widget.builder.call(
        node,
        () => _requestChangeStateKeyboard(node, _KeyboardState.open,
            keyboardChangeStateIsSupported: widget.active),
        () => _requestChangeStateKeyboard(node, _KeyboardState.close,
            keyboardChangeStateIsSupported: widget.active),
      ),
    );
  }

  void _requestChangeStateKeyboard(
    FocusNode node,
    _KeyboardState state, {
    bool keyboardChangeStateIsSupported = true,
  }) {
    if (keyboardChangeStateIsSupported) {
      return _changeStateKeyboard(node, state);
    }
  }

  void _changeStateKeyboard(FocusNode node, _KeyboardState state) {
    switch (state) {
      case _KeyboardState.close:
        return node.unfocus();
      case _KeyboardState.open:
        return node.requestFocus(node);
      default:
        return;
    }
  }
}

enum _KeyboardState { close, open }
