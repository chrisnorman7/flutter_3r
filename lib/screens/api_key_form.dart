import 'package:backstreets_widgets/icons.dart';
import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/shortcuts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

/// A form for entering the API key.
class ApiKeyForm extends ConsumerStatefulWidget {
  /// Create an instance.
  const ApiKeyForm({
    super.key,
  });

  /// Create state for this widget.
  @override
  ApiKeyFormState createState() => ApiKeyFormState();
}

/// State for [ApiKeyForm].
class ApiKeyFormState extends ConsumerState<ApiKeyForm> {
  /// The form key.
  late final GlobalKey<FormState> formKey;

  /// The controller to use with the text field.
  late final TextEditingController controller;

  /// Initialise state.
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey();
    controller = TextEditingController();
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) => CallbackShortcuts(
        bindings: {
          SingleActivator(
            LogicalKeyboardKey.enter,
            control: useControlKey,
            meta: useMetaKey,
          ): saveApiKey,
        },
        child: SimpleScaffold(
          title: 'Enter API Key',
          body: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  autofocus: true,
                  controller: controller,
                  decoration: const InputDecoration(
                    labelText: 'API Key',
                    helperText: 'The key to use when talking to the API',
                  ),
                  validator: (final value) {
                    if (value == null || value.isEmpty) {
                      return 'You must provide a value';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: saveApiKey,
            tooltip: 'Save API Key',
            child: saveIcon,
          ),
        ),
      );

  /// Save the API key.
  void saveApiKey() {
    if (formKey.currentState?.validate() ?? false) {
      final apiKey = controller.text;
      keyFile.writeAsStringSync(apiKey);
      ref.invalidate(apiKeyProvider);
    }
  }
}
