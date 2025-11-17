import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/models/payment.dart';

class ContributionProgressCard extends StatelessWidget {
  final ContributionStats stats;
  final double targetPrice;
  final String currency;
  final VoidCallback? onContribute;
  final bool showContributors;
  final List<Payment>? recentContributions;

  const ContributionProgressCard({
    super.key,
    required this.stats,
    required this.targetPrice,
    required this.currency,
    this.onContribute,
    this.showContributors = true,
    this.recentContributions,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacing16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.people,
                      color: AppTheme.primaryColor,
                      size: 20,
                    ),
                    const SizedBox(width: AppTheme.spacing8),
                    Text(
                      'Group Gift Progress',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                if (stats.fullyFunded)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.spacing8,
                      vertical: AppTheme.spacing4,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.successColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppTheme.radius8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: AppTheme.successColor,
                          size: 16,
                        ),
                        const SizedBox(width: AppTheme.spacing4),
                        Text(
                          'Fully Funded',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppTheme.successColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),

            const SizedBox(height: AppTheme.spacing16),

            // Amount raised
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _formatPrice(stats.totalContributions),
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryColor,
                          ),
                    ),
                    const SizedBox(height: AppTheme.spacing4),
                    Text(
                      'raised of ${_formatPrice(targetPrice)} goal',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                  ],
                ),
                Text(
                  '${stats.progressPercentage.toStringAsFixed(0)}%',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor,
                      ),
                ),
              ],
            ),

            const SizedBox(height: AppTheme.spacing12),

            // Progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.radius8),
              child: LinearProgressIndicator(
                value: stats.progressPercentage / 100,
                backgroundColor: Colors.grey[200],
                valueColor:
                    const AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
                minHeight: 12,
              ),
            ),

            // Remaining amount
            if (!stats.fullyFunded) ...[
              const SizedBox(height: AppTheme.spacing8),
              Text(
                '${_formatPrice(targetPrice - stats.totalContributions)} remaining',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
              ),
            ],

            // Recent contributors
            if (showContributors &&
                recentContributions != null &&
                recentContributions!.isNotEmpty) ...[
              const SizedBox(height: AppTheme.spacing16),
              const Divider(),
              const SizedBox(height: AppTheme.spacing16),
              Row(
                children: [
                  const Icon(
                    Icons.volunteer_activism,
                    size: 18,
                    color: AppTheme.primaryColor,
                  ),
                  const SizedBox(width: AppTheme.spacing8),
                  Text(
                    'Recent Contributors',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: AppTheme.spacing12),
              ...recentContributions!.take(3).map((contribution) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppTheme.spacing8),
                  child: _buildContributorRow(context, contribution),
                );
              }),
              if (recentContributions!.length > 3) ...[
                const SizedBox(height: AppTheme.spacing4),
                Text(
                  '+ ${recentContributions!.length - 3} more contributors',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ],
            ],

            // Contribute button
            if (onContribute != null && !stats.fullyFunded) ...[
              const SizedBox(height: AppTheme.spacing16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: onContribute,
                  icon: const Icon(Icons.volunteer_activism),
                  label: const Text('Contribute to this Gift'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppTheme.spacing12,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildContributorRow(BuildContext context, Payment contribution) {
    final contributor = contribution.contributor;

    return Row(
      children: [
        // Avatar
        CircleAvatar(
          radius: 16,
          backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
          backgroundImage: contributor?.avatarUrl != null
              ? NetworkImage(contributor!.avatarUrl!)
              : null,
          child: contributor?.avatarUrl == null
              ? Text(
                  contributor?.name.substring(0, 1).toUpperCase() ?? '?',
                  style: const TextStyle(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                )
              : null,
        ),

        const SizedBox(width: AppTheme.spacing12),

        // Name and amount
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contributor?.name ?? 'Anonymous',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (contributor?.isGuest == true)
                      Text(
                        'Guest',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey[600],
                              fontSize: 11,
                            ),
                      ),
                  ],
                ),
              ),
              Text(
                contribution.formattedAmount ?? _formatPrice(contribution.amount),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatPrice(double price) {
    final symbol = _getCurrencySymbol();
    return '$symbol${price.toStringAsFixed(2)}';
  }

  String _getCurrencySymbol() {
    switch (currency) {
      case 'RUB':
        return '₽';
      case 'USD':
        return '\$';
      case 'EUR':
        return '€';
      case 'GBP':
        return '£';
      default:
        return currency;
    }
  }
}
