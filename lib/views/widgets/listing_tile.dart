import 'package:flutter/material.dart';

import '../../models/listing.dart';
import '../../ui/common/app_colors.dart';
import '../../ui/common/app_radius.dart';
import '../../ui/common/app_shadows.dart';
import '../../ui/common/app_space.dart';
import '../../ui/shared_widgets/pressable_card.dart';

class ListingTile extends StatelessWidget {
  const ListingTile({
    super.key,
    required this.listing,
    this.onTap,
    this.compact = false,
  });

  final Listing listing;
  final VoidCallback? onTap;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return PressableCard(
      onTap: onTap,
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(AppRadius.card),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppRadius.card),
            ),
            child: AspectRatio(
              aspectRatio: compact ? 1.4 : 1.6,
              child: Image.asset(
                listing.imageAsset,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpace.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  listing.category,
                  style: const TextStyle(
                    color: AppColors.accent,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: AppSpace.xs),
                Text(
                  listing.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.ink,
                    fontSize: compact ? 14 : 16,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: AppSpace.sm),
                Row(
                  children: [
                    Text(
                      listing.formattedPrice,
                      style: TextStyle(
                        color: AppColors.ink,
                        fontSize: compact ? 15 : 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      listing.location,
                      style: const TextStyle(
                        color: AppColors.inkMuted,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListingRowTile extends StatelessWidget {
  const ListingRowTile({
    super.key,
    required this.listing,
    this.onTap,
  });

  final Listing listing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.card),
          boxShadow: AppShadows.cardShadow,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(AppRadius.card),
              ),
              child: Image.asset(
                listing.imageAsset,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppSpace.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listing.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: AppSpace.xs),
                    Text(
                      listing.formattedPrice,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: AppColors.ink,
                      ),
                    ),
                    const SizedBox(height: AppSpace.xs),
                    Text(
                      '${listing.sellerName} · ${listing.location}',
                      style: const TextStyle(
                        color: AppColors.inkMuted,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: AppSpace.md),
              child: Icon(Icons.chevron_right, color: AppColors.inkMuted),
            ),
          ],
        ),
      ),
    );
  }
}
