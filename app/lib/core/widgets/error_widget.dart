import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class ErrorDisplayWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final IconData? icon;

  const ErrorDisplayWidget({
    super.key,
    required this.message,
    this.onRetry,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacing24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.error_outline,
              size: 64,
              color: AppTheme.errorColor,
            ),
            const SizedBox(height: AppTheme.spacing16),
            Text(
              'Oops! Something went wrong',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.spacing8),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: AppTheme.spacing24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Try Again'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class ErrorCard extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final VoidCallback? onDismiss;

  const ErrorCard({
    super.key,
    required this.message,
    this.onRetry,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.errorColor.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacing16),
        child: Row(
          children: [
            Icon(
              Icons.error_outline,
              color: AppTheme.errorColor,
            ),
            const SizedBox(width: AppTheme.spacing12),
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: AppTheme.errorColor),
              ),
            ),
            if (onRetry != null)
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: onRetry,
                color: AppTheme.errorColor,
              ),
            if (onDismiss != null)
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: onDismiss,
                color: AppTheme.errorColor,
              ),
          ],
        ),
      ),
    );
  }
}
