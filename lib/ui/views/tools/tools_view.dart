import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'tools_viewmodel.dart';

class ToolsView extends StackedView<ToolsViewModel> {
  const ToolsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ToolsViewModel viewModel,
    Widget? child,
  ) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () => {},
                icon: Icon(
                  Icons.filter_list,
                  color: Theme.of(context).colorScheme.secondary,
                ))
          ],
          title: Center(
            child: Text(
              'Tools',
              style: Theme.of(context).typography.white.bodyLarge,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(46.0),
            child: Container(
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).dividerColor,
                    width: 0.5,
                  ),
                ),
              ),
              child: TabBar(
                labelStyle: Theme.of(context).typography.white.bodyMedium,
                unselectedLabelColor: Theme.of(context).colorScheme.onPrimary,
                labelColor: Theme.of(context).colorScheme.secondary,
                padding: const EdgeInsets.only(left: 16.0),
                isScrollable: true,
                tabs: const <Widget>[
                  Tab(
                    text: 'All',
                  ),
                  Tab(
                    text: 'Powered tools',
                  ),
                  Tab(
                    text: 'Unpowered tools',
                  )
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text(
                'click + button to add a tool',
              ),
            ),
            Center(
              child: Text('click + button to add a Power tool'),
            ),
            Center(
              child: Text('click + button to add Unpowered tool'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ToolsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ToolsViewModel();
}
