#!/usr/bin/env python3

import asyncio
import iterm2
import os

# Light
THEME_LIGHT_BACKGROUND = "Light Background"
THEME_GITHUB_LIGHT_DEFAULT = "GitHub Light Default"
THEME_CATPPUCCIN_LATTE = "catppuccin-latte"

# Dark
THEME_DARK_BACKGROUND = "Dark Background"
THEME_DRACULA = "Dracula"
THEME_KANAGAWA = "kanagawa"
THEME_MONOKAI_PRO = "Monokai Pro"
THEME_CATPPUCCIN_FRAPPE = "catppuccin-frappe"
THEME_CATPPUCCIN_MACCHIATO = "catppuccin-macchiato"
THEME_CATPPUCCIN_MOCHA = "catppuccin-mocha"
THEME_GITHUB_DARK_DIMMED = "GitHub Dark Dimmed"

# Pick themes
LIGHT_THEME = THEME_CATPPUCCIN_LATTE
DARK_THEME = THEME_CATPPUCCIN_FRAPPE 


async def changeTheme(theme_parts, connection):
    # Themes have space-delimited attributes, one of which will be light or dark.
    if "dark" in theme_parts:
        preset = await iterm2.ColorPreset.async_get(connection, DARK_THEME)
    else:
        preset = await iterm2.ColorPreset.async_get(connection, LIGHT_THEME)

    # Update the list of all profiles and iterate over them.
    profiles = await iterm2.PartialProfile.async_query(connection)
    for partial in profiles:
        # Fetch the full profile and then set the color preset in it.
        profile = await partial.async_get_full_profile()
        await profile.async_set_color_preset(preset)


async def main(connection):
    # Set color scheme correctly at app start
    app = await iterm2.async_get_app(connection)
    parts = await app.async_get_theme()
    await changeTheme(parts, connection)

    async with iterm2.VariableMonitor(
        connection, iterm2.VariableScopes.APP, "effectiveTheme", None
    ) as mon:
        while True:
            # Block until theme changes
            theme = await mon.async_get()
            parts = theme.split(" ")
            await changeTheme(parts, connection)


iterm2.run_forever(main)
