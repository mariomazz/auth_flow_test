import 'package:flutter/material.dart';

/// accessibility main points
/// https://docs.flutter.dev/development/accessibility-and-localization/accessibility

/* Large fonts Render text widgets with user-specified font sizes
  Screen readers
  Communicate spoken feedback about UI contents
  Sufficient contrast
  Render widgets with colors that have sufficient contrast
  Details of these features are discussed below. */

class AccessibilityManager {
  bool screenReaderIsEnabled(BuildContext ctx) {
    return MediaQuery.of(ctx).accessibleNavigation;
  }
}
