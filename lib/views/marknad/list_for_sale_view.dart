import 'package:flutter/material.dart';

import '../../ui/common/app_colors.dart';
import '../../ui/common/app_radius.dart';
import '../../ui/common/app_shadows.dart';
import '../../ui/common/app_space.dart';
import '../../ui/shared_widgets/brand_field.dart';
import '../../ui/shared_widgets/success_overlay.dart';

class ListForSaleView extends StatefulWidget {
  const ListForSaleView({
    super.key,
    required this.onBack,
    required this.onComplete,
  });

  final VoidCallback onBack;
  final VoidCallback onComplete;

  @override
  State<ListForSaleView> createState() => _ListForSaleViewState();
}

class _ListForSaleViewState extends State<ListForSaleView> {
  int _step = 0;
  bool _showSuccess = false;
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  String _category = 'Klockor';

  final _categories = ['Klockor', 'Bilar', 'Båtar', 'Resor', 'Vin'];

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_step < 2) {
      setState(() => _step++);
    } else {
      setState(() => _showSuccess = true);
      Future<void>.delayed(const Duration(milliseconds: 1800), () {
        if (mounted) widget.onComplete();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.bg,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: widget.onBack,
            ),
            title: const Text('Sälj något'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(AppSpace.screen),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _StepIndicator(current: _step, total: 3),
                const SizedBox(height: AppSpace.xl),
                if (_step == 0) ...[
                  const Text(
                    'Vad vill du sälja?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: AppSpace.lg),
                  BrandField(
                    label: 'Titel',
                    controller: _titleController,
                    hint: 'Titel på annonsen',
                  ),
                  const SizedBox(height: AppSpace.md),
                  Wrap(
                    spacing: AppSpace.sm,
                    runSpacing: AppSpace.sm,
                    children: _categories.map((cat) {
                      final selected = cat == _category;
                      return GestureDetector(
                        onTap: () => setState(() => _category = cat),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpace.lg,
                            vertical: AppSpace.sm,
                          ),
                          decoration: BoxDecoration(
                            color: selected
                                ? AppColors.accent
                                : AppColors.surface,
                            borderRadius:
                                BorderRadius.circular(AppRadius.pill),
                            boxShadow: selected ? null : AppShadows.cardShadow,
                          ),
                          child: Text(
                            cat,
                            style: TextStyle(
                              color: selected ? Colors.white : AppColors.ink,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ] else if (_step == 1) ...[
                  const Text(
                    'Ange pris',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: AppSpace.lg),
                  BrandField(
                    label: 'Pris',
                    controller: _priceController,
                    hint: 'Pris i kr',
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: AppSpace.lg),
                  Container(
                    padding: const EdgeInsets.all(AppSpace.lg),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(AppRadius.card),
                      boxShadow: AppShadows.cardShadow,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: AppColors.accentSoft,
                            borderRadius:
                                BorderRadius.circular(AppRadius.chip),
                          ),
                          child: const Icon(
                            Icons.add_a_photo_outlined,
                            color: AppColors.accent,
                          ),
                        ),
                        const SizedBox(width: AppSpace.md),
                        const Expanded(
                          child: Text(
                            'Lägg till bilder (mock)',
                            style: TextStyle(
                              color: AppColors.inkMuted,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ] else ...[
                  const Text(
                    'Granska annons',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: AppSpace.lg),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(AppSpace.lg),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(AppRadius.card),
                      boxShadow: AppShadows.cardShadow,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _titleController.text.isEmpty
                              ? 'Din annons'
                              : _titleController.text,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: AppSpace.sm),
                        Text(
                          _category,
                          style: const TextStyle(
                            color: AppColors.accent,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: AppSpace.md),
                        Text(
                          _priceController.text.isEmpty
                              ? '—'
                              : '${_priceController.text} kr',
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const Spacer(),
                GestureDetector(
                  onTap: _nextStep,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: AppSpace.lg),
                    decoration: BoxDecoration(
                      color: AppColors.cta,
                      borderRadius: BorderRadius.circular(AppRadius.pill),
                      boxShadow: AppShadows.liftShadow,
                    ),
                    child: Text(
                      _step < 2 ? 'Fortsätt' : 'Publicera annons',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpace.lg),
              ],
            ),
          ),
        ),
        if (_showSuccess)
          Container(
            color: AppColors.ink.withValues(alpha: 0.45),
            child: Center(
              child: SuccessOverlay(
                title: 'Annons publicerad!',
                message: 'Din annons är nu synlig för medlemmar.',
                actionLabel: 'Stäng',
                onAction: widget.onComplete,
              ),
            ),
          ),
      ],
    );
  }
}

class _StepIndicator extends StatelessWidget {
  const _StepIndicator({required this.current, required this.total});

  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(total, (i) {
        final active = i <= current;
        return Expanded(
          child: Container(
            height: 4,
            margin: EdgeInsets.only(right: i < total - 1 ? AppSpace.sm : 0),
            decoration: BoxDecoration(
              color: active ? AppColors.accent : AppColors.hairline,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      }),
    );
  }
}
