//LIST OF PACKAGES USED
export 'package:shared_preferences/shared_preferences.dart';
export 'package:flutter/material.dart';
export 'package:flex_color_scheme/flex_color_scheme.dart';
export 'package:google_fonts/google_fonts.dart';
export 'package:flutter_riverpod/flutter_riverpod.dart';
export 'package:searchbar_animation/searchbar_animation.dart';
export 'package:internet_connection_checker/internet_connection_checker.dart';

// UTILS
export './utils/shared_prefs.dart';
export './utils/navigation.dart';
export './utils/app_fontweight.dart';
export './utils/brand_colors.dart';
export './utils/show_top_bar.dart';
export './utils/custom_snack_bar.dart';
export './utils/connectivity.dart';
export './utils/snack_bar.dart';
export './utils/dialogs.dart';
export './utils/util_date_picker.dart';
export 'strings_const.dart';

// MAIN SCREEN
export 'mainscreen/views/mainscreen.dart';
export 'mainscreen/widgets/stocks_card_widgets.dart';
export 'mainscreen/models/stocks_price_model.dart';
export 'mainscreen/services/http_get_request.dart';
export 'mainscreen/models/stocks_symbols_model.dart';
export 'mainscreen/providers/fetch_symbols_provider.dart';
export 'mainscreen/services/fetch_stocks_repo.dart';
export 'mainscreen/providers/is_grid_provider.dart';
export 'mainscreen/providers/fetch_stock_provider.dart';
export 'mainscreen/widgets/stocks_list_grid_view_widget.dart';
export 'mainscreen/widgets/rounded_main_btn.dart';
export 'mainscreen/widgets/search_btn.dart';
export 'mainscreen/widgets/exchanges_tab.dart';

// AUTH SCREEN
export './authscreen/views/login_screen.dart';
