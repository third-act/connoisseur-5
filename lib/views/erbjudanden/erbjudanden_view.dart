import 'package:flutter/material.dart';

import '../../models/offer.dart';
import '../../services/offer_service.dart';
import '../../ui/common/app_colors.dart';
import '../../ui/common/app_radius.dart';
import '../../ui/common/app_space.dart';
import '../../ui/shared_widgets/pressable_card.dart';
import '../../ui/shared_widgets/section_header.dart';

class ErbjudandenView extends StatelessWidget {
  const ErbjudandenView({super.key});

  @override
  Widget build(BuildContext context) {
    final offers = OfferService().getPartnerOffers();

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpace.screen,
              AppSpace.xl,
              AppSpace.screen,
              0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Erbjudanden',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: AppSpace.xs),
                const Text(
                  'Partnerförmåner för Connoisseur-medlemmar',
                  style: TextStyle(color: AppColors.inkMuted, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: const SizedBox(height: AppSpace.xl)),
        SliverToBoxAdapter(
          child: SectionHeader(title: 'Aktuella erbjudanden'),
        ),
        SliverToBoxAdapter(child: const SizedBox(height: AppSpace.md)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpace.screen),
          sliver: SliverList.separated(
            itemCount: offers.length,
            separatorBuilder: (_, __) =>
                const SizedBox(height: AppSpace.md),
            itemBuilder: (context, i) => _OfferCard(offer: offers[i]),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: AppSpace.section)),
      ],
    );
  }
}

class _OfferCard extends StatelessWidget {
  const _OfferCard({required this.offer});

  final PartnerOffer offer;

  @override
  Widget build(BuildContext context) {
    return PressableCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppRadius.card),
            ),
            child: Image.asset(
              offer.imageAsset,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpace.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  offer.partner,
                  style: const TextStyle(
                    color: AppColors.accent,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: AppSpace.xs),
                Text(
                  offer.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: AppSpace.sm),
                Text(
                  offer.description,
                  style: const TextStyle(
                    color: AppColors.inkMuted,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                if (offer.validUntil != null) ...[
                  const SizedBox(height: AppSpace.md),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpace.md,
                      vertical: AppSpace.xs,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.accentSoft,
                      borderRadius: BorderRadius.circular(AppRadius.pill),
                    ),
                    child: Text(
                      'Giltigt till ${offer.validUntil}',
                      style: const TextStyle(
                        color: AppColors.accent,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
