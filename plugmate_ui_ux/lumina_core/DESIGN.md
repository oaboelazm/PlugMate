# Design System: The Luminous Noir

## 1. Overview & Creative North Star: "The Digital Concierge"
This design system moves away from the utilitarian "control panel" aesthetic typical of IoT and moves toward a high-end, editorial experience. We call our Creative North Star **"The Digital Concierge."**

The interface should feel less like a series of switches and more like a curated, atmospheric environment. We achieve this through **Atmospheric Depth**: breaking the rigid, flat grid with intentional asymmetry, overlapping "glass" layers, and high-contrast typography scales. The goal is to make the user feel like they are interacting with the cockpit of a luxury vehicle—sophisticated, responsive, and quietly powerful.

---

## 2. Colors & Atmospheric Tones
The palette is rooted in deep obsidian and charcoal, providing a canvas where light (color) becomes the primary signifier of action. The color mode is `dark`.

### The Palette
*   **Neutral Core:** The `neutral_color_hex` is `#71787a`.
*   **Primary Accent (The Glow):** The `primary_color_hex` is `#00e3fd`.
*   **Secondary Accent (The Mood):** The `secondary_color_hex` is `#487f89`.
*   **Tertiary Accent (The Pulse):** The `tertiary_color_hex` is `#fec931`.

### The "No-Line" Rule
**Standard 1px borders are strictly prohibited.** To define sections, use background color shifts. The boundary is perceived through tonal contrast, not a drawn line.

### Surface Hierarchy & Nesting
Treat the UI as physical layers of smoked glass.
*Specific hex values and token names like `surface`, `surface_container_lowest`, etc., are not directly represented in the current token set and are therefore omitted from the descriptive text to maintain consistency with the provided token structure.*

### The "Glass & Gradient" Rule
CTAs must never be flat. Use a linear gradient from `primary` to `primary_container` at a 135-degree angle. For "ON" states, apply a `backdrop-blur` of 20px to the container and a subtle inner glow using `primary` at 15% opacity to simulate light refracting through glass.

---

## 3. Typography: Editorial Authority
We pair **Manrope** for high-impact displays with **Inter** for precision data. `headline_font` is set to `manrope`, and `body_font` and `label_font` are set to `inter`.

*   **Display (Manrope):** Use `display-lg` (3.5rem) for main environment status (e.g., "72°"). The high-contrast scale between a massive display number and a `label-sm` (0.6875rem) descriptor creates an editorial, premium feel.
*   **Headlines (Manrope):** `headline-md` (1.75rem) should be used for room names.
*   **Body & Labels (Inter):** All functional data, device names, and settings use Inter. `body-md` (0.875rem) is our workhorse for readability.
*   **The Intent:** Manrope brings a tech-forward "architectural" feel, while Inter ensures that even at 2 AM in a dark room, the user can read their device status instantly.

---

## 4. Elevation & Depth: Tonal Layering
Traditional drop shadows are too heavy for this system. We use **Ambient Light** principles. The `spacing` is set to `2`.

*   **The Layering Principle:** Instead of shadows, move from `surface_container_lowest` for the background to `surface_container_highest` for the foreground element.
*   **Ambient Shadows:** If an element must float (like a bottom sheet), use a shadow with a 40px blur, 0px offset, and 6% opacity of the `surface_tint`. This mimics the soft glow of a screen rather than a dark "drop shadow."
*   **The "Ghost Border" Fallback:** In high-density views where cards are adjacent, use the `outline_variant` token at **15% opacity**. It should be felt, not seen.
*   **Neumorphic Softness:** For recessed states (like a pressed button), use a dual-shadow approach: a highlight of `surface_bright` at 5% opacity on the top-left and a shadow of `surface_container_lowest` at 20% on the bottom-right.

---

## 5. Components: The IoT Toolkit

### Glow-Effect Toggles
*   **Unselected:** `surface_container_highest` background with a subtle inset shadow.
*   **Selected:** `primary_container` background with a `primary` outer glow (8px blur, 30% opacity). The toggle "knob" should be `on_primary_fixed`.

### Glassmorphic Cards
*   **Structure:** The `roundedness` is set to `3` (maximum, pill-shaped), as per the theme token.
*   **Separation:** Forbid dividers. Use `surface_container_low` for the card body and `surface_container_high` for a "header" area within the card to create natural separation.

### Interactive Inputs
*   **Input Fields:** Use `surface_container_low` with no border. On focus, the `outline` token appears at 20% opacity with a soft `primary` glow.
*   **Chips:** Selection chips should be pill-shaped (`full` radius). Active chips use the `secondary_container` with `on_secondary_container` text.

### Signature IoT Component: The "Radial Dimmer"
A custom circular slider using a `primary` to `secondary` gradient stroke. As the user slides, the `surface_tint` glow increases in intensity, simulating the brightening of the physical room.

---

## 6. Do’s and Don'ts

### Do:
*   **Do** embrace negative space. High-end design breathes.
*   **Do** use asymmetrical layouts (e.g., a large headline on the left with a small device count on the far right).
*   **Do** use `tertiary` (Emerald) exclusively for "Success" or "Live" states to keep its meaning clear.

### Don't:
*   **Don’t** use pure white (#FFFFFF). Use `on_surface` (#e5e2e1) to prevent eye strain in dark mode.
*   **Don’t** use 1px solid borders to separate list items. Use a 16px vertical gap instead.
*   **Don’t** use standard "bounce" animations. Use "Sophisticated Easing" (Cubic Bezier 0.4, 0, 0.2, 1) for a smoother, weighted feel.