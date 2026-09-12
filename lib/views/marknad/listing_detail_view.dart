import 'package:flutter/material.dart';

import '../../models/listing.dart';
import '../../ui/common/app_colors.dart';
import '../../ui/common/app_radius.dart';
import '../../ui/common/app_shadows.dart';
import '../../ui/common/app_space.dart';
import '../../ui/shared_widgets/pressable_card.dart';

class ListingDetailView extends StatelessWidget {
  const ListingDetailView({
    super.key,
    required this.listing,
    required this.onBack,
    required this.onInterest,
  });

  final Listing listing;
  final VoidCallback onBack;
  final VoidCallback onInterest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: AppColors.bg,
            leading: IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: onBack,
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                listing.imageAsset,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppSpace.screen),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listing.category,
                    style: const TextStyle(
                      color: AppColors.accent,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: AppSpace.sm),
                  Text(
                    listing.title,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      height: 1.15,
                    ),
                  ),
                  const SizedBox(height: AppSpace.md),
                  Text(
                    listing.formattedPrice,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: AppColors.ink,
                    ),
                  ),
                  const SizedBox(height: AppSpace.xl),
                  _SellerCard(
                    name: listing.sellerName,
                    location: listing.location,
                  ),
                  const SizedBox(height: AppSpace.section),
                  const Text(
                    'Beskrivning',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSpace.md),
                  Text(
                    listing.description,
                    style: const TextStyle(
                      color: AppColors.inkMuted,
                      fontSize: 15,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: AppSpace.section),
                  Container(
                    padding: const EdgeInsets.all(AppSpace.lg),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(AppRadius.card),
                      boxShadow: AppShadows.cardShadow,
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.verified_outlined,
                            color: AppColors.accent, size: 20),
                        const SizedBox(width: AppSpace.md),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Verifierad medlem',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Skick: ${listing.condition}',
                                style: const TextStyle(
                                  color: AppColors.inkMuted,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpace.screen),
          child: GestureDetector(
            onTap: onInterest,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: AppSpace.lg),
              decoration: BoxDecoration(
                color: AppColors.cta,
                borderRadius: BorderRadius.circular(AppRadius.pill),
                boxShadow: AppShadows.liftShadow,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.chat_bubble_outline, color: Colors.white, size: 20),
                  SizedBox(width: AppSpace.sm),
                  Text(
                    'Visa intresse',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SellerCard extends StatelessWidget {
  const _SellerCard({required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return PressableCard(
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.accentSoft,
            child: Text(
              name[0],
              style: const TextStyle(
                color: AppColors.accent,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: AppSpace.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  location,
                  style: const TextStyle(
                    color: AppColors.inkMuted,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const Text(
            'Medlem sedan 2022',
            style: TextStyle(color: AppColors.inkMuted, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
