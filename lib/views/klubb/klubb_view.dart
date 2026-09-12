import 'package:flutter/material.dart';

import '../../services/member_service.dart';
import '../../ui/common/app_colors.dart';
import '../../ui/common/app_radius.dart';
import '../../ui/common/app_shadows.dart';
import '../../ui/common/app_space.dart';
import '../../ui/shared_widgets/pressable_card.dart';

class KlubbView extends StatelessWidget {
  const KlubbView({super.key});

  @override
  Widget build(BuildContext context) {
    final member = MemberService().getCurrentMember();

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
                  'Klubb',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: AppSpace.xs),
                const Text(
                  'Din medlemsprofil',
                  style: TextStyle(color: AppColors.inkMuted, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: const SizedBox(height: AppSpace.xl)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.screen),
            child: PressableCard(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: AppColors.accentSoft,
                    child: Text(
                      member.name[0],
                      style: const TextStyle(
                        color: AppColors.accent,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpace.lg),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          member.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Medlem sedan ${member.memberSince}',
                          style: const TextStyle(
                            color: AppColors.inkMuted,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.verified, color: AppColors.accent, size: 22),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(child: const SizedBox(height: AppSpace.section)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.screen),
            child: Row(
              children: [
                Expanded(
                  child: _StatCard(
                    label: 'Annonser',
                    value: '${member.listingsCount}',
                  ),
                ),
                const SizedBox(width: AppSpace.md),
                Expanded(
                  child: _StatCard(
                    label: 'Köp',
                    value: '${member.purchasesCount}',
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: const SizedBox(height: AppSpace.section)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.screen),
            child: const Text(
              'Intressen',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
        ),
        SliverToBoxAdapter(child: const SizedBox(height: AppSpace.md)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.screen),
            child: Wrap(
              spacing: AppSpace.sm,
              runSpacing: AppSpace.sm,
              children: member.interests
                  .map(
                    (i) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpace.lg,
                        vertical: AppSpace.sm,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(AppRadius.pill),
                        boxShadow: AppShadows.cardShadow,
                      ),
                      child: Text(
                        i,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        SliverToBoxAdapter(child: const SizedBox(height: AppSpace.section)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.screen),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.card),
              child: Image.asset(
                'assets/images/magazine_cover.png',
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(AppSpace.screen),
            child: Text(
              'Connoisseur Magazine — senaste numret',
              style: const TextStyle(
                color: AppColors.inkMuted,
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: AppSpace.section)),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpace.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: AppShadows.cardShadow,
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: AppColors.accent,
            ),
          ),
          const SizedBox(height: AppSpace.xs),
          Text(
            label,
            style: const TextStyle(color: AppColors.inkMuted, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
