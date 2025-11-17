import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/models/wish.dart';
import '../../../../core/models/payment.dart';
import '../../application/payments_provider.dart';

class ContributeModal extends ConsumerStatefulWidget {
  final Wish wish;
  final ContributionStats? stats;

  const ContributeModal({
    super.key,
    required this.wish,
    this.stats,
  });

  @override
  ConsumerState<ContributeModal> createState() => _ContributeModalState();
}

class _ContributeModalState extends ConsumerState<ContributeModal> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  String _selectedCurrency = 'RUB';
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    // Pre-fill with remaining amount if wish has a target price
    if (widget.wish.price != null && widget.stats != null) {
      final remaining = widget.wish.price! - widget.stats!.totalContributions;
      if (remaining > 0) {
        _amountController.text = remaining.toStringAsFixed(2);
      }
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final remainingAmount = widget.wish.price != null && widget.stats != null
        ? (widget.wish.price! - widget.stats!.totalContributions)
        : null;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacing24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Contribute to Gift',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),

                const SizedBox(height: AppTheme.spacing16),

                // Wish info
                Row(
                  children: [
                    // Image
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(AppTheme.radius8),
                      ),
                      child: widget.wish.imageUrl != null
                          ? ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(AppTheme.radius8),
                              child: Image.network(
                                widget.wish.imageUrl!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.image, color: Colors.grey),
                              ),
                            )
                          : const Icon(Icons.image, color: Colors.grey),
                    ),

                    const SizedBox(width: AppTheme.spacing12),

                    // Title and price
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.wish.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (widget.wish.price != null) ...[
                            const SizedBox(height: AppTheme.spacing4),
                            Text(
                              'Target: ${_formatPrice(widget.wish.price!, widget.wish.currency ?? 'USD')}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: AppTheme.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),

                // Progress bar
                if (widget.stats != null && widget.wish.price != null) ...[
                  const SizedBox(height: AppTheme.spacing16),
                  _buildProgressSection(),
                ],

                const SizedBox(height: AppTheme.spacing24),

                // Amount input
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Currency selector
                    SizedBox(
                      width: 80,
                      child: DropdownButtonFormField<String>(
                        initialValue: _selectedCurrency,
                        decoration: const InputDecoration(
                          labelText: 'Currency',
                        ),
                        items: ['RUB', 'USD', 'EUR']
                            .map((currency) => DropdownMenuItem(
                                  value: currency,
                                  child: Text(currency),
                                ),)
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _selectedCurrency = value;
                            });
                          }
                        },
                      ),
                    ),

                    const SizedBox(width: AppTheme.spacing12),

                    // Amount input
                    Expanded(
                      child: TextFormField(
                        controller: _amountController,
                        decoration: InputDecoration(
                          labelText: 'Amount',
                          hintText: '0.00',
                          prefixText: _getCurrencySymbol(_selectedCurrency),
                          suffixIcon: remainingAmount != null &&
                                  remainingAmount > 0
                              ? IconButton(
                                  icon: const Icon(Icons.auto_awesome),
                                  tooltip: 'Fill remaining amount',
                                  onPressed: () {
                                    _amountController.text =
                                        remainingAmount.toStringAsFixed(2);
                                  },
                                )
                              : null,
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}'),),
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an amount';
                          }
                          final amount = double.tryParse(value);
                          if (amount == null || amount <= 0) {
                            return 'Please enter a valid amount';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppTheme.spacing16),

                // Quick amount buttons
                if (widget.wish.price != null) ...[
                  Wrap(
                    spacing: AppTheme.spacing8,
                    children: _getQuickAmounts().map((amount) {
                      return OutlinedButton(
                        onPressed: () {
                          _amountController.text = amount.toStringAsFixed(2);
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppTheme.spacing12,
                            vertical: AppTheme.spacing8,
                          ),
                        ),
                        child: Text(
                            '${_getCurrencySymbol(_selectedCurrency)}${amount.toStringAsFixed(0)}',),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: AppTheme.spacing16),
                ],

                // Info text
                Container(
                  padding: const EdgeInsets.all(AppTheme.spacing12),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppTheme.radius8),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: AppTheme.primaryColor,
                        size: 20,
                      ),
                      const SizedBox(width: AppTheme.spacing8),
                      Expanded(
                        child: Text(
                          'You\'ll be redirected to a secure payment page',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppTheme.primaryColor,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppTheme.spacing24),

                // Contribute button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _isProcessing ? null : _handleContribute,
                    child: _isProcessing
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text('Continue to Payment'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressSection() {
    final stats = widget.stats!;
    final targetPrice = widget.wish.price!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${_formatPrice(stats.totalContributions, widget.wish.currency ?? 'USD')} raised',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Text(
              '${stats.progressPercentage.toStringAsFixed(0)}%',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        const SizedBox(height: AppTheme.spacing8),
        LinearProgressIndicator(
          value: stats.progressPercentage / 100,
          backgroundColor: Colors.grey[200],
          valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
          minHeight: 8,
          borderRadius: BorderRadius.circular(AppTheme.radius8),
        ),
        if (!stats.fullyFunded) ...[
          const SizedBox(height: AppTheme.spacing4),
          Text(
            '${_formatPrice(targetPrice - stats.totalContributions, widget.wish.currency ?? 'USD')} remaining',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
        ],
      ],
    );
  }

  List<double> _getQuickAmounts() {
    final targetPrice = widget.wish.price;
    if (targetPrice == null) return [100, 500, 1000, 5000];

    final remaining = targetPrice -
        (widget.stats?.totalContributions ?? 0);

    if (remaining <= 0) return [100, 500, 1000];

    return [
      (remaining * 0.25).roundToDouble(),
      (remaining * 0.5).roundToDouble(),
      (remaining * 0.75).roundToDouble(),
      remaining.roundToDouble(),
    ].where((amount) => amount > 0).toSet().toList()..sort();
  }

  String _formatPrice(double price, String currency) {
    final symbol = _getCurrencySymbol(currency);
    return '$symbol${price.toStringAsFixed(2)}';
  }

  String _getCurrencySymbol(String currency) {
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

  Future<void> _handleContribute() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isProcessing = true;
    });

    try {
      final amount = double.parse(_amountController.text);

      // Create payment
      final payment = await ref.read(paymentControllerProvider.notifier).contribute(
            wishId: widget.wish.id,
            amount: amount,
            currency: _selectedCurrency,
          );

      if (!mounted) return;

      // Open confirmation URL in browser
      if (payment != null && payment.confirmationUrl != null) {
        final url = Uri.parse(payment.confirmationUrl!);
        if (await canLaunchUrl(url)) {
          await launchUrl(
            url,
            mode: LaunchMode.externalApplication,
          );
        }
      }

      if (!mounted) return;

      Navigator.of(context).pop(true);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Payment initiated! Complete payment in your browser.'),
          backgroundColor: AppTheme.successColor,
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to create payment: ${e.toString()}'),
          backgroundColor: AppTheme.errorColor,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }
}
