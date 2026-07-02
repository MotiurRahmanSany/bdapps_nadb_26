import 'package:flutter/material.dart';

/// Notes Manager — "Ledger" theme.
class AppTheme {
  // Core palette 
  static const Color _inkGreen = Color(0xFF25453A); // primary — deep ink
  static const Color _inkGreenLight = Color(0xFF3C6153);
  static const Color _paper = Color(0xFFFAF6EC); // light background
  static const Color _paperSurface = Color(0xFFFFFDF7); // cards/inputs
  static const Color _gold = Color(0xFFC79A46); // accent
  static const Color _coral = Color(0xFFC1543A); // delete / error
  static const Color _inkText = Color(0xFF23241F); // near-black warm text
  static const Color _mutedText = Color(0xFF6E6A5E);

  static const Color _charcoal = Color(0xFF17181B); // dark background
  static const Color _charcoalSurface = Color(0xFF1F2124);
  static const Color _mint = Color(0xFF7FB69B); // dark-mode primary
  static const Color _goldDark = Color(0xFFD8B267);

  //  Light theme 
  static ThemeData lightTheme() {
    final colorScheme = const ColorScheme(
      brightness: Brightness.light,
      primary: _inkGreen,
      onPrimary: _paper,
      primaryContainer: _inkGreenLight,
      onPrimaryContainer: Colors.white,
      secondary: _gold,
      onSecondary: _inkText,
      secondaryContainer: Color(0xFFF0E0B8),
      onSecondaryContainer: Color(0xFF4A3A12),
      error: _coral,
      onError: Colors.white,
      errorContainer: Color(0xFFF6DAD1),
      onErrorContainer: Color(0xFF5C1E0F),
      surface: _paperSurface,
      onSurface: _inkText,
      surfaceContainerHighest: Color(0xFFEFE9D8),
      onSurfaceVariant: _mutedText,
      outline: Color(0xFFCFC7AE),
      outlineVariant: Color(0xFFE3DCC7),
      shadow: Colors.black,
      inverseSurface: _inkText,
      onInverseSurface: _paper,
      inversePrimary: _mint,
    );

    return _buildTheme(colorScheme, scaffoldBackground: _paper);
  }

  //  Dark theme
  static ThemeData darkTheme() {
    final colorScheme = const ColorScheme(
      brightness: Brightness.dark,
      primary: _mint,
      onPrimary: Color(0xFF0B2019),
      primaryContainer: Color(0xFF2E4A3F),
      onPrimaryContainer: Color(0xFFCBEBDC),
      secondary: _goldDark,
      onSecondary: Color(0xFF3A2C08),
      secondaryContainer: Color(0xFF4A3A12),
      onSecondaryContainer: Color(0xFFF0E0B8),
      error: Color(0xFFE38167),
      onError: Color(0xFF3A0F05),
      errorContainer: Color(0xFF5C1E0F),
      onErrorContainer: Color(0xFFF6DAD1),
      surface: _charcoalSurface,
      onSurface: Color(0xFFEDE9DD),
      surfaceContainerHighest: Color(0xFF2A2C30),
      onSurfaceVariant: Color(0xFFB1AC9C),
      outline: Color(0xFF4A4C4F),
      outlineVariant: Color(0xFF35373A),
      shadow: Colors.black,
      inverseSurface: _paper,
      onInverseSurface: _inkText,
      inversePrimary: _inkGreen,
    );

    return _buildTheme(colorScheme, scaffoldBackground: _charcoal);
  }

  // Shared builder 
  static ThemeData _buildTheme(
    ColorScheme colorScheme, {
    required Color scaffoldBackground,
  }) {
    final isDark = colorScheme.brightness == Brightness.dark;

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackground,
      splashFactory: InkSparkle.splashFactory,

      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
          color: colorScheme.onSurface,
          height: 1.15,
        ),
        headlineMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.25,
          color: colorScheme.onSurface,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurface,
        ),
        titleMedium: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
          color: colorScheme.onSurface,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.2,
          color: colorScheme.onSurface,
          height: 1.4,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.15,
          color: colorScheme.onSurfaceVariant,
          height: 1.4,
        ),
        labelLarge: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
          color: colorScheme.onSurface,
        ),
      ),

      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 1,
        backgroundColor: scaffoldBackground,
        surfaceTintColor: Colors.transparent,
        foregroundColor: colorScheme.onSurface,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3,
          color: colorScheme.onSurface,
        ),
        iconTheme: IconThemeData(color: colorScheme.onSurface),
      ),

      cardTheme: CardThemeData(
        elevation: 0,
        color: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: BorderSide(color: colorScheme.outlineVariant, width: 1),
        ),
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          disabledBackgroundColor: colorScheme.primary.withValues(alpha: 0.4),
          disabledForegroundColor: colorScheme.onPrimary.withValues(alpha: 0.7),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark
            ? colorScheme.surfaceContainerHighest
            : const Color(0xFFF3EEDF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: colorScheme.outline, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: colorScheme.outline, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: colorScheme.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
        floatingLabelStyle: TextStyle(color: colorScheme.primary),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
        ),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 2,
        backgroundColor: colorScheme.secondary,
        foregroundColor: colorScheme.onSecondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),

      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        iconColor: colorScheme.onSurfaceVariant,
        titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurface,
        ),
        subtitleTextStyle: TextStyle(
          fontSize: 14,
          color: colorScheme.onSurfaceVariant,
        ),
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: colorScheme.onSurface,
        ),
        contentTextStyle: TextStyle(
          fontSize: 14,
          color: colorScheme.onSurfaceVariant,
        ),
      ),

      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: TextStyle(color: colorScheme.onInverseSurface),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),

      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),

      iconTheme: IconThemeData(color: colorScheme.onSurfaceVariant),
    );
  }
}
