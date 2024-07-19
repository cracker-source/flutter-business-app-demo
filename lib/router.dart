import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../screens/products/vegetables/vegetables_screen.dart';
import '../../screens/products/vegetables/select_vegetables_screen.dart';
import '../../screens/products/vegetables/add_vegetables_screen.dart';
import '../../screens/edit_shop/edit_business_email.dart';
import '../../screens/edit_shop/edit_business_name.dart';
import '../../screens/edit_shop/edit_business_number.dart';
import '../../screens/edit_shop/edit_owner_name.dart';
import '../../screens/main_screen.dart';
import '../../screens/otp_screen.dart';
import '../../screens/auth/welcome_screen.dart';

import 'screens/edit_shop/edit_shop_screen.dart';
import 'screens/product_categories/product_categories_screen.dart';
import 'screens/product_categories/add_product_category_screen.dart';
import 'screens/auth/authorization_screen.dart';
import 'screens/auth/signup_verification_screen.dart';
import 'screens/auth/verification_screen.dart';
import 'screens/select_category_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/bottom_tab_navigation/main_tab_screen.dart';
import 'screens/auth/signup_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static routes() {
    return GoRouter(
      initialLocation: "/",
      navigatorKey: navigatorKey,
      // redirect: (context, state) {
      //   BlocBuilder<LoginBloc, LoginState>(builder: (context, state){
      //     if(state is )
      //   });
      //   debugPrint("FIRST REDIRECT");
      //   if (isUserLoggedIn.isLoading == true) {
      //     return null;
      //   }
      //   if (isUserLoggedIn.value == true) {
      //     return null;
      //   } else {
      //     return "/welcome";
      //   }
      // },
      routes: <RouteBase>[
        GoRoute(
          path: "/",
          pageBuilder: (BuildContext _, GoRouterState state) {
            return CupertinoPage(
              child: const MainScreen(),
              key: state.pageKey,
              restorationId: state.pageKey.value,
            );
          },
        ),
        GoRoute(
          path: "/welcome",
          pageBuilder: (BuildContext _, GoRouterState state) {
            return CupertinoPage(
              child: const WelcomeScreen(),
              key: state.pageKey,
              restorationId: state.pageKey.value,
            );
          },
        ),
        GoRoute(
          name: "login",
          path: "/login",
          pageBuilder: (BuildContext _, GoRouterState state) {
            return CupertinoPage(
              child: const LoginScreen(),
              key: state.pageKey,
              restorationId: state.pageKey.value,
            );
          },
        ),
        GoRoute(
          path: "/signup",
          pageBuilder: (BuildContext _, GoRouterState state) {
            return CupertinoPage(
              child: const SignupScreen(),
              key: state.pageKey,
              restorationId: state.pageKey.value,
            );
          },
        ),
        GoRoute(
          path: "/select-category",
          pageBuilder: (BuildContext _, GoRouterState state) {
            return CupertinoPage(
              child: const SelectCategoryScreen(),
              key: state.pageKey,
              restorationId: state.pageKey.value,
            );
          },
        ),

        GoRoute(
          path: "/verification",
          pageBuilder: (BuildContext _, GoRouterState state) {
            return CupertinoPage(
              child: const VerificationScreen(),
              key: state.pageKey,
              restorationId: state.pageKey.value,
            );
          },
        ),
        // GoRoute(
        //   path: "/map-screen",
        //   pageBuilder: (BuildContext _, GoRouterState state) {
        //     return CupertinoPage(
        //       child: const VerificationMapScreen(),
        //       key: state.pageKey,
        //       restorationId: state.pageKey.value,
        //     );
        //   },
        // ),
        GoRoute(
          path: "/authorization",
          pageBuilder: (BuildContext _, GoRouterState state) {
            return CupertinoPage(
              child: AuthorizationScreen(
                key: state.pageKey,
              ),
              key: state.pageKey,
              restorationId: state.pageKey.value,
            );
          },
        ),
        GoRoute(
          path: "/signup/verification",
          pageBuilder: (BuildContext _, GoRouterState state) {
            return CupertinoPage(
              child: SignupVerificationScreen(
                key: state.pageKey,
              ),
              key: state.pageKey,
              restorationId: state.pageKey.value,
            );
          },
        ),
        GoRoute(
          path: "/signup/otp-verification",
          pageBuilder: (BuildContext _, GoRouterState state) {
            return CupertinoPage(
              child: const OTPScreen(),
              key: state.pageKey,
              restorationId: state.pageKey.value,
            );
          },
        ),
        GoRoute(
          path: "/homepage",
          pageBuilder: (BuildContext _, GoRouterState state) {
            return CupertinoPage(
              child: const MainTabScreen(),
              key: state.pageKey,
              restorationId: state.pageKey.value,
            );
          },
        ),

        GoRoute(
          path: "/edit-shop",
          pageBuilder: (BuildContext _, GoRouterState state) {
            return CupertinoPage(
              child: EditShopScreen(),
              key: state.pageKey,
              restorationId: state.pageKey.value,
            );
          },
          routes: [
            GoRoute(
              path: "business-name",
              pageBuilder: (BuildContext _, GoRouterState state) {
                return CupertinoPage(
                  child: const EditBusinessName(),
                  key: state.pageKey,
                  restorationId: state.pageKey.value,
                );
              },
            ),
            GoRoute(
              path: "owner-name",
              pageBuilder: (BuildContext _, GoRouterState state) {
                return CupertinoPage(
                  child: const EditOwnerName(),
                  key: state.pageKey,
                  restorationId: state.pageKey.value,
                );
              },
            ),
            GoRoute(
              path: "business-number",
              pageBuilder: (BuildContext _, GoRouterState state) {
                return CupertinoPage(
                  child: const EditBusinessNumber(),
                  key: state.pageKey,
                  restorationId: state.pageKey.value,
                );
              },
            ),
            GoRoute(
              path: "business-email",
              pageBuilder: (BuildContext _, GoRouterState state) {
                return CupertinoPage(
                  child: const EditBusinessEmail(),
                  key: state.pageKey,
                  restorationId: state.pageKey.value,
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: "/product-categories",
          pageBuilder: (BuildContext _, GoRouterState state) {
            return CupertinoPage(
              child: const ProductCategoriesScreen(),
              key: state.pageKey,
              restorationId: state.pageKey.value,
            );
          },
          routes: [
            GoRoute(
              path: "add",
              pageBuilder: (BuildContext _, GoRouterState state) {
                return CupertinoPage(
                  child: const AddProductCategoryScreen(),
                  key: state.pageKey,
                  restorationId: state.pageKey.value,
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: "/products/vegetables",
          pageBuilder: (BuildContext _, GoRouterState state) {
            return CupertinoPage(
              child: VegetablesScreen(
                vegetableData: state.extra as Map<String, String>,
              ),
              key: state.pageKey,
              restorationId: state.pageKey.value,
            );
          },
          routes: [
            GoRoute(
                path: "select-vegetables",
                pageBuilder: (BuildContext _, GoRouterState state) {
                  return CupertinoPage(
                    child: const SelectVegetablesScreen(),
                    key: state.pageKey,
                    restorationId: state.pageKey.value,
                  );
                },
                routes: [
                  GoRoute(
                    path: "add",
                    pageBuilder: (BuildContext _, GoRouterState state) {
                      return CupertinoPage(
                        child: AddVegetablesScreen(
                          productData: state.extra as Map<String, String>,
                        ),
                        key: state.pageKey,
                        restorationId: state.pageKey.value,
                      );
                    },
                  ),
                ]),
          ],
        )
      ],
    );
  }
}
