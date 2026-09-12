import 'package:flutter/material.dart';

import '../../models/listing.dart';
import '../../services/marketplace_service.dart';
import '../../ui/common/app_colors.dart';
import '../../ui/common/app_radius.dart';
import '../../ui/common/app_shadows.dart';
import '../../ui/common/app_space.dart';
import '../../ui/shared_widgets/brand_chip.dart';
import '../../ui/shared_widgets/pressable_card.dart';
import '../../ui/shared_widgets/section_header.dart';
import '../widgets/listing_tile.dart';

class MarknadView extends StatefulWidget {
  const MarknadView({
    super.key,
    required this.onListingTap,
    required this.onSellTap,
  });

  final ValueChanged<Listing> onListingTap;
  final VoidCallback onSellTap;

  @override
  State<MarknadView> createState() => _MarknadViewState();
}

class _MarknadViewState extends State<MarknadView> {
  final _service = MarketplaceService();
  String _selectedCategory = 'Alla';

  List<Listing> get _filtered {
    final all = _service.getFeaturedListings();
    if (_selectedCategory == 'Alla') return all;
    return all.where((l) => l.category == _selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    final listings = _filtered;
    final totalValue = _service
        .getFeaturedListings()
        .fold<int>(0, (sum, l) => sum + l.price);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpace.screen,
              AppSpace.lg,
              AppSpace.screen,
              0,
            ),
            child: Row(
              children: [
                const Text(
                  'CONNOISSEUR',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.notifications_outlined, size: 22),
                  onPressed: () {},
                  color: AppColors.ink,
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.screen),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSpace.md),
                Text(
                  'Hej Elsa,',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: AppSpace.xs),
                const Text(
                  'Medlemmar säljer lyxvaror till varandra',
                  style: TextStyle(color: AppColors.inkMuted, fontSize: 14),
                ),
                const SizedBox(height: AppSpace.xl),
              ],
            ),
          ),
        ),

        // Accent-owned hero card
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.screen),
            child: _MarketHeroCard(
              activeListings: _service.getFeaturedListings().length,
              totalValue: totalValue,
              onSellTap: widget.onSellTap,
            ),
          ),
        ),

        SliverToBoxAdapter(child: const SizedBox(height: AppSpace.section)),

        // Category chips
        SliverToBoxAdapter(
          child: SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppSpace.screen),
              itemCount: _service.getCategories().length,
              separatorBuilder: (_, __) => const SizedBox(width: AppSpace.sm),
              itemBuilder: (context, i) {
                final cat = _service.getCategories()[i];
                return BrandChip(
                  label: cat,
                  selected: cat == _selectedCategory,
                  onTap: () => setState(() => _selectedCategory = cat),
                );
              },
            ),
          ),
        ),

        SliverToBoxAdapter(child: const SizedBox(height: AppSpace.lg)),

        // Secondary row — recently added
        SliverToBoxAdapter(
          child: SectionHeader(
            title: 'Senast tillagda',
            actionLabel: 'Visa alla',
            onAction: () {},
          ),
        ),
        SliverToBoxAdapter(child: const SizedBox(height: AppSpace.md)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 220,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppSpace.screen),
              itemCount: listings.length.clamp(0, 4),
              separatorBuilder: (_, __) => const SizedBox(width: AppSpace.md),
              itemBuilder: (context, i) {
                final listing = listings[i];
                return SizedBox(
                  width: 170,
                  child: ListingTile(
                    listing: listing,
                    compact: true,
                    onTap: () => widget.onListingTap(listing),
                  ),
                );
              },
            ),
          ),
        ),

        SliverToBoxAdapter(child: const SizedBox(height: AppSpace.section)),

        // Break-the-stack featured listing
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.screen),
            child: SectionHeader(title: 'Utvalt av medlemmar'),
          ),
        ),
        SliverToBoxAdapter(child: const SizedBox(height: AppSpace.md)),
        if (listings.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpace.screen),
              child: Transform.translate(
                offset: const Offset(0, -4),
                child: PressableCard(
                  onTap: () => widget.onListingTap(listings.first),
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(AppRadius.card),
                        ),
                        child: Image.asset(
                          listings.first.imageAsset,
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(AppSpace.lg),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    listings.first.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(height: AppSpace.xs),
                                  Text(
                                    listings.first.formattedPrice,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: AppColors.accent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSpace.md,
                                vertical: AppSpace.sm,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.cta,
                                borderRadius:
                                    BorderRadius.circular(AppRadius.pill),
                              ),
                              child: const Text(
                                'Visa',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

        SliverToBoxAdapter(child: const SizedBox(height: AppSpace.section)),

        // Full listing grid
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.screen),
            child: SectionHeader(title: 'Alla annonser'),
          ),
        ),
        SliverToBoxAdapter(child: const SizedBox(height: AppSpace.md)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpace.screen),
          sliver: SliverList.separated(
            itemCount: listings.length,
            separatorBuilder: (_, __) =>
                const SizedBox(height: AppSpace.md),
            itemBuilder: (context, i) => ListingRowTile(
              listing: listings[i],
              onTap: () => widget.onListingTap(listings[i]),
            ),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: AppSpace.section)),
      ],
    );
  }
}

class _MarketHeroCard extends StatelessWidget {
  const _MarketHeroCard({
    required this.activeListings,
    required this.totalValue,
    required this.onSellTap,
  });

  final int activeListings;
  final int totalValue;
  final VoidCallback onSellTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.card + 4),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF8B7A4A),
            AppColors.accent,
            Color(0xFFC4B07A),
          ],
        ),
        boxShadow: AppShadows.liftShadow,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpace.lg),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Medlemsmarknad',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: AppSpace.sm),
                      Text(
                        '$activeListings',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.w800,
                          height: 1,
                        ),
                      ),
                      Text(
                        'aktiva annonser',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.85),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpace.md,
                    vertical: AppSpace.sm,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(AppRadius.pill),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.trending_up,
                        color: Colors.white,
                        size: 16,
                      ),
                      const SizedBox(width: AppSpace.xs),
                      Text(
                        '${(totalValue / 1000000).toStringAsFixed(1)}M kr',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppSpace.lg),
            height: 1,
            color: Colors.white.withValues(alpha: 0.2),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpace.lg),
            child: Row(
              children: [
                _MetricCell(label: 'Klockor', value: '2'),
                _divider(),
                _MetricCell(label: 'Bilar', value: '1'),
                _divider(),
                _MetricCell(label: 'Båtar', value: '1'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpace.lg,
              0,
              AppSpace.lg,
              AppSpace.lg,
            ),
            child: GestureDetector(
              onTap: onSellTap,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: AppSpace.md),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.95),
                  borderRadius: BorderRadius.circular(AppRadius.pill),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_circle_outline,
                        color: AppColors.cta, size: 20),
                    SizedBox(width: AppSpace.sm),
                    Text(
                      'Sälj något',
                      style: TextStyle(
                        color: AppColors.cta,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() => Container(
        width: 1,
        height: 32,
        color: Colors.white.withValues(alpha: 0.25),
      );
}

class _MetricCell extends StatelessWidget {
  const _MetricCell({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.75),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
