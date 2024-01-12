import 'package:flutter/material.dart';
import 'package:modular_ui/modular_ui.dart';

Widget footer() {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MUILogoFooter(
            logo: const Icon(Icons.abc),
            items: [
              MUIFooterItem(
                label: "Home",
              ),
              MUIFooterItem(
                label: "Components",
              ),
              MUIFooterItem(
                label: "Footer",
              ),
            ],
            companyName: "Modular UI"),
        const SizedBox(
          height: 20,
        ),
        MUISimpleFooter(items: [
          MUIFooterItem(
            label: "Home",
          ),
          MUIFooterItem(
            label: "Components",
          ),
          MUIFooterItem(
            label: "Footer",
          ),
        ], companyName: "Modular UI"),
        const SizedBox(
          height: 20,
        ),
        MUISitemapFooter(categories: [
          MUISitemapCategory(
            label: "Home",
            items: [
              MUISitemapItem(
                label: "Home",
              ),
              MUISitemapItem(
                label: "Components",
              ),
              MUISitemapItem(
                label: "Footer",
              ),
            ],
          ),
          MUISitemapCategory(
            label: "Components",
            items: [
              MUISitemapItem(
                label: "Home",
              ),
              MUISitemapItem(
                label: "Components",
              ),
              MUISitemapItem(
                label: "Footer",
              ),
            ],
          ),
          MUISitemapCategory(
            label: "Footer",
            items: [
              MUISitemapItem(
                label: "Home",
              ),
              MUISitemapItem(
                label: "Components",
              ),
              MUISitemapItem(
                label: "Footer",
              ),
            ],
          ),
        ], companyName: "Modular UI"),
      ],
    ),
  );
}
