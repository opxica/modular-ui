import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

Widget breadcrumbs() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      MUIBreadcrumbs(
        crumbs: [
          MUIBreadcrumbItem(
            label: "Home",
          ),
          MUIBreadcrumbItem(
            label: "Components",
          ),
          MUIBreadcrumbItem(
            label: "Breadcrumbs",
          ),
        ],
      ),
    ],
  );
}
