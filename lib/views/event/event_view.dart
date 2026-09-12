import 'package:flutter/material.dart';

import '../../models/event.dart';
import '../../services/event_service.dart';
import '../../ui/common/app_colors.dart';
import '../../ui/common/app_radius.dart';
import '../../ui/common/app_shadows.dart';
import '../../ui/common/app_space.dart';
import '../../ui/shared_widgets/pressable_card.dart';
import '../../ui/shared_widgets/section_header.dart';

class EventView extends StatelessWidget {
  const EventView({super.key});

  @override
  Widget build(BuildContext context) {
    final events = EventService().getUpcomingEvents();

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
                  'Event',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: AppSpace.xs),
                const Text(
                  'Exklusiva tillställningar för medlemmar',
                  style: TextStyle(color: AppColors.inkMuted, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(child: const SizedBox(height: AppSpace.xl)),

        // Hero event — break-the-stack
        if (events.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpace.screen),
              child: _FeaturedEventCard(event: events.first),
            ),
          ),

        SliverToBoxAdapter(child: const SizedBox(height: AppSpace.section)),
        SliverToBoxAdapter(
          child: SectionHeader(title: 'Kommande event'),
        ),
        SliverToBoxAdapter(child: const SizedBox(height: AppSpace.md)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpace.screen),
          sliver: SliverList.separated(
            itemCount: events.length,
            separatorBuilder: (_, __) =>
                const SizedBox(height: AppSpace.md),
            itemBuilder: (context, i) => _EventRowCard(event: events[i]),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: AppSpace.section)),
      ],
    );
  }
}

class _FeaturedEventCard extends StatelessWidget {
  const _FeaturedEventCard({required this.event});

  final ClubEvent event;

  @override
  Widget build(BuildContext context) {
    return PressableCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppRadius.card),
            ),
            child: Stack(
              children: [
                Image.asset(
                  event.imageAsset,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: AppSpace.md,
                  right: AppSpace.md,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpace.md,
                      vertical: AppSpace.xs,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.cta,
                      borderRadius: BorderRadius.circular(AppRadius.pill),
                    ),
                    child: Text(
                      '${event.spotsLeft} platser',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpace.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: AppSpace.sm),
                Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined,
                        size: 14, color: AppColors.inkMuted),
                    const SizedBox(width: AppSpace.xs),
                    Text(event.date,
                        style: const TextStyle(
                            color: AppColors.inkMuted, fontSize: 13)),
                    const SizedBox(width: AppSpace.md),
                    const Icon(Icons.location_on_outlined,
                        size: 14, color: AppColors.inkMuted),
                    const SizedBox(width: AppSpace.xs),
                    Text(event.location,
                        style: const TextStyle(
                            color: AppColors.inkMuted, fontSize: 13)),
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

class _EventRowCard extends StatelessWidget {
  const _EventRowCard({required this.event});

  final ClubEvent event;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              event.imageAsset,
              width: 90,
              height: 90,
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
                    event.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: AppSpace.xs),
                  Text(
                    '${event.date} · ${event.location}',
                    style: const TextStyle(
                      color: AppColors.inkMuted,
                      fontSize: 12,
                    ),
                  ),
                  if (event.spotsLeft != null) ...[
                    const SizedBox(height: AppSpace.xs),
                    Text(
                      '${event.spotsLeft} platser kvar',
                      style: const TextStyle(
                        color: AppColors.accent,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
