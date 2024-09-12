import 'package:flutter/material.dart';
{{#hooks}}
import 'package:hooks_riverpod/hooks_riverpod.dart';
{{/hooks}}
{{^hooks}}
import 'package:flutter_riverpod/flutter_riverpod.dart';
{{/hooks}}
import 'package:{{name.snakeCase()}}/l10n/l10n.dart';
import '../controllers/counter.controller.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterControllerProvider);
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body:  Center(child: Text('$count', style: theme.textTheme.displayLarge)),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => ref.read(counterControllerProvider.notifier).increment,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => ref.read(counterControllerProvider.notifier).decrement,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
