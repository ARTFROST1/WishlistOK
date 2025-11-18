import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'loading_widget.dart';
import 'error_widget.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  final AsyncValue<T> asyncValue;
  final Widget Function(T data) data;
  final Widget Function(Object error, StackTrace? stackTrace)? error;
  final Widget? loading;

  const AsyncValueWidget({
    super.key,
    required this.asyncValue,
    required this.data,
    this.error,
    this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return asyncValue.when(
      data: data,
      error: error ?? (err, stackTrace) => ErrorDisplayWidget(
        message: err.toString(),
        onRetry: () {
          // The parent widget should handle retry logic
        },
      ),
      loading: () => loading ?? const LoadingWidget(),
    );
  }
}

// Simplified version for common use cases
class SimpleAsyncValueWidget<T> extends ConsumerWidget {
  final AsyncValue<T> asyncValue;
  final Widget Function(T data) builder;
  final String? loadingMessage;
  final VoidCallback? onRetry;

  const SimpleAsyncValueWidget({
    super.key,
    required this.asyncValue,
    required this.builder,
    this.loadingMessage,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return asyncValue.when(
      data: builder,
      error: (error, stackTrace) => ErrorDisplayWidget(
        message: error.toString(),
        onRetry: onRetry,
      ),
      loading: () => LoadingWidget(message: loadingMessage),
    );
  }
}
