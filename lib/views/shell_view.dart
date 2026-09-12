import 'package:flutter/material.dart';

import '../models/listing.dart';
import '../ui/common/app_colors.dart';
import '../ui/common/app_radius.dart';
import '../ui/common/app_shadows.dart';
import '../ui/common/app_space.dart';
import '../ui/shared_widgets/glass_bar.dart';
import '../ui/shared_widgets/tab_pill.dart';
import 'erbjudanden/erbjudanden_view.dart';
import 'event/event_view.dart';
import 'klubb/klubb_view.dart';
import 'marknad/list_for_sale_view.dart';
import 'marknad/listing_detail_view.dart';
import 'marknad/marknad_view.dart';

class ShellView extends StatefulWidget {
  const ShellView({super.key});

  @override
  State<ShellView> createState() => _ShellViewState();
}

class _ShellViewState extends State<ShellView> {
  int _tabIndex = 0;
  Listing? _selectedListing;
  bool _showListForSale = false;

  static const _tabContentPadding = 120.0;

  void _openListing(Listing listing) {
    setState(() => _selectedListing = listing);
  }

  void _closeListing() {
    setState(() => _selectedListing = null);
  }

  void _openListForSale() {
    setState(() => _showListForSale = true);
  }

  void _closeListForSale() {
    setState(() => _showListForSale = false);
  }

  @override
  Widget build(BuildContext context) {
    if (_showListForSale) {
      return ListForSaleView(
        onBack: _closeListForSale,
        onComplete: _closeListForSale,
      );
    }

    if (_selectedListing != null) {
      return ListingDetailView(
        listing: _selectedListing!,
        onBack: _closeListing,
        onInterest: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Intresse skickat till säljaren (mock)'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: AppColors.bg,
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.only(bottom: _tabContentPadding),
        child: IndexedStack(
          index: _tabIndex,
          children: [
            MarknadView(
              onListingTap: _openListing,
              onSellTap: _openListForSale,
            ),
            const EventView(),
            const ErbjudandenView(),
            const KlubbView(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpace.screen,
          0,
          AppSpace.screen,
          AppSpace.lg,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.sheet),
            boxShadow: AppShadows.liftShadow,
          ),
          child: GlassBar(
            borderRadius: BorderRadius.circular(AppRadius.sheet),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpace.sm,
              vertical: AppSpace.sm,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TabPill(
                    icon: Icons.storefront_outlined,
                    label: 'Marknad',
                    selected: _tabIndex == 0,
                    axis: Axis.vertical,
                    onTap: () => setState(() => _tabIndex = 0),
                  ),
                ),
                Expanded(
                  child: TabPill(
                    icon: Icons.event_outlined,
                    label: 'Event',
                    selected: _tabIndex == 1,
                    axis: Axis.vertical,
                    onTap: () => setState(() => _tabIndex = 1),
                  ),
                ),
                Expanded(
                  child: TabPill(
                    icon: Icons.local_offer_outlined,
                    label: 'Erbjudanden',
                    selected: _tabIndex == 2,
                    axis: Axis.vertical,
                    onTap: () => setState(() => _tabIndex = 2),
                  ),
                ),
                Expanded(
                  child: TabPill(
                    icon: Icons.person_outline,
                    label: 'Klubb',
                    selected: _tabIndex == 3,
                    axis: Axis.vertical,
                    onTap: () => setState(() => _tabIndex = 3),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
