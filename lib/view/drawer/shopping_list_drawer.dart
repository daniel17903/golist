import 'package:flutter/material.dart';
import 'package:go_list/model/app_state_notifier.dart';
import 'package:go_list/model/list_of.dart';
import 'package:go_list/model/shopping_list.dart';
import 'package:go_list/style/colors.dart';
import 'package:go_list/view/dialog/dialog_utils.dart';
import 'package:go_list/view/dialog/settings_dialog.dart';
import 'package:go_list/view/drawer/create_new_list_tile.dart';
import 'package:go_list/view/drawer/my_lists_header_tile.dart';
import 'package:go_list/view/drawer/shopping_list_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShoppingListDrawer extends HookConsumerWidget {
  const ShoppingListDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ListOf<ShoppingList> shoppingLists =
        ref.watch(AppStateNotifier.notDeletedShoppingListsProvider);
    return Drawer(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
              color: Theme.of(context).bottomAppBarTheme.color,
              image: const DecorationImage(
                  image: AssetImage("assets/icons/icon_foreground.png"),
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomRight)),
          child: const Text(
            'GoList',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        const MyListsHeaderTile(),
        Expanded(
          child: ReorderableListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: shoppingLists.length,
            prototypeItem: const MyListsHeaderTile(),
            footer: const CreateNewListTile(),
            itemBuilder: (BuildContext context, int index) =>
                ShoppingListTile(index, key: Key(shoppingLists[index].id)),
            onReorder: (int oldIndex, int newIndex) {
              ref
                  .read(AppStateNotifier.appStateProvider.notifier)
                  .updateListOrder(fromIndex: oldIndex, toIndex: newIndex);
            },
          ),
        ),
        SafeArea(
          child: InkWell(
            onTap: () => DialogUtils.showSmallAlertDialog(
                context: context, contentBuilder: (_) => const SettingsDialog()),
            child: Container(
              color: GoListColors.turquoise,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 28),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)!.settings,
                          style:
                              const TextStyle(fontSize: 16, color: Colors.white)),
                      const Icon(Icons.settings, color: Colors.white),
                    ]),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
