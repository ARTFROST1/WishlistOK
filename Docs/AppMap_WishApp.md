Это **уровень Senior Product + UX Architecture**, включая:

* Дерево навигации
* Все экраны и состояния
* Логику действий
* Поведение Lite Mode гостей
* Добавление желаний из браузера и расширения
* Feed + категории + промо товары
* Планируемые фичи V2

---

## **Application Structure & Screen-by-Screen Specification (MVP)**

```
PLATFORM: Flutter (iOS / Android / Web)
EXT: Chrome & Safari Extensions + Share-Sheet Integration
BACKEND: Ruby On Rails + Postgres + Supabase Storage (CDN)
```

---

# **1. User Modes**

| Mode                  | Description                                | Capabilities                                                                          |
| --------------------- | ------------------------------------------ | ------------------------------------------------------------------------------------- |
| **Registered User**   | Has full account                           | Create lists, add wishes, share, claim, donate, browse feed, manage profile           |
| **Guest (Lite Mode)** | Arrives via shared link, no signup yet     | View list, claim an item, contribute to group gift → account autoprovisioned silently |
| **Anonymous Visitor** | Just browsing a public list page (web SEO) | View only, *no claim*, CTA leads to Lite Mode                                         |

---

# **2. App Navigation Map**

```
App Root
 ├── Onboarding & Auth
 │     ├── Welcome
 │     ├── Create / Join Choice
 │     ├── Sign in (Google / Apple / VK / Yandex / Email)
 │     └── Lite Mode Auto-Account (server background)
 │
 ├── Home Tabs (Main App UI)
 │     ├── Lists (Default landing)
 │     │     ├── My Wishlists
 │     │     └── Create New Wishlist
 │     │
 │     ├── Feed (Gift Ideas Catalog)
 │     │     ├── Categories Carousel
 │     │     ├── Curated Gift Collections
 │     │     ├── Brand / Promo Highlight Slots
 │     │     └── Popular Stores → In-app Browser
 │     │
 │     ├── Add Wish
 │     │     ├── Manual Entry
 │     │     ├── Paste Link
 │     │     └── Extension Share Capture (metadata auto-fill)
 │     │
 │     └── Profile & Settings
 │
 └── Deep Links / Sharing
       ├── /list/{id}
       └── /wish/{id}
```

---

# **3. Onboarding & Registration Flow**

### **Screens**

### `Welcome Screen`

* Branding
* CTA:

  * **Create Wishlist**
  * **Open Shared Wishlist** (if deep-linked)

### `Choose Auth`

* Google
* Apple
* VK
* Yandex
* Email Sign-in
* **Skip → Continue as Guest (Lite Mode)** *(only shown when arriving through invite link)*

### `Lite Mode Creation (no UI)`

* Server generates:
  `guest_{uuid}`
* Stores identity in device secure storage
* Converts to full account when:

  * User tries to edit their own wishlist
  * User tries to see list history
  * User tries to manage claimed gifts

---

# **4. Wishlists (Main Section)**

### `My Wishlists`

| Component   | Description                                                           |
| ----------- | --------------------------------------------------------------------- |
| Top bar     | "Your Wishlists" + + Create                                           |
| List grid   | Each wishlist card shows: Title, Date/Event, Count of unclaimed items |
| Empty state | "Create your first wish list" →                                       |

### `Create Wishlist`

Fields:

* **List Title** (birthday / wedding / etc)
* **Event Date**
* **Visibility**

  * Public
  * Link-only (default)
  * Private (only invited users)
* **Theme** *(optional aesthetic)*

---

# **5. Wishlist Detail Screen**

### Layout

* Title + Date Countdown (e.g., 12 days left)
* Share Button → Generates sharable link
* Add Wish Button
* **Items grouped by status**:

  * **Available**
  * **Claimed (hidden info for creator)** (*surprise mode*)

### User Roles Behavior:

| Action              | Owner                    | Guest               |
| ------------------- | ----------------         | ------------------- |
| Add Wish            | ✅                      | ❌                   |
| Claim Wish          | ❌ (owner cannot)       | ✅  
| See who claimed     | ❌ (owner does not see) | ✅(guest sees themselves as claimer, but owner sees “claimed”)
| Donate / Group Gift | ✅                      | ✅                   |

---

# **6. Add Wish Flow**

### Option A: **Paste URL**

1. User pastes link
2. Server parses metadata (OpenGraph / price selector / images)
3. Auto-fill fields:

   * Title
   * Image
   * Price
   * Store URL

### Option B: **Manual Entry**

* Upload image (from gallery)
* Add Title
* Optional: price, link, note

### Option C: **Share from Browser / App**

Extension / Share Sheet triggers:

```
POST /wish/parse
→ Shows preview
→ User selects which wishlist to add into
```

---

# **7. Wish (Item) Detail Screen**

| Section                       | Description              |
| ----------------------------- | ------------------------ |
| Image carousel                | Default product image(s) |
| Title + Price                 | Editable by owner        |
| Link Button                   | Opens internal browser   |
| Claim Button *(Guest)*        | Locks the item           |
| Mark As Purchased *(Claimer)* | After buying             |
| Donate Button                 | Opens contribution modal |

---

# **8. Claim System (Lite Mode Highlights)**

### **Guest Claims Item**

```
If anonymous → create guest user silently
wish.status = claimed_by:{guest_id}
```

Owner sees:

```
"Someone has already claimed this 😊"
(no identity revealed, unless wish is non-surprise)
```

Guest sees:

```
"You're gifting this 🎁"
Option → "Mark as Purchased"
```

---

# **9. Feed Section (Gift Ideas Catalog)**

```
Feed Home
 ├── Hero Stories (curated announcements)
 ├── Category Carousel (Birthday, Wedding, Tech, Home, etc)
 └── Featured Collections
       ├── Editor Picks
       ├── Trending Gifts This Week
       ├── Budget Gift Ideas (<$30)
       └── Brand Sponsored Collections (monetization)
```

---

# **10. Popular Stores Section + Internal Browser**

### Flow:

1. User selects: Ozon / Wildberries / IKEA / Lamoda / etc
2. Opens store **inside in-app browser**
3. Floating button: **+ Add to Wishlist**
4. Button triggers auto-parse:

```
Extract: URL, Title, Price, First Image
Show “Add to List” Modal → Choose Wishlist
```

---

# **11. Chrome / Safari Extension Behavior**

### On any product page:

```
Click → "Add to Wish"
→ Parse product metadata
→ Modal: Choose Wishlist
→ Saves instantly
```

Sync via same user ID / guest token.

---

# **12. Planned Next Features (Post-MVP)**

| Feature                       | Priority | Description                        |
| ----------------------------- | -------- | ---------------------------------- |
| User Profiles & Follow System | Medium   | Social layer unlocks recurring use |
| AI Gift Ideas Assistant       | High     | Personalized suggestions           |
| Smart Purchase Reminders      | Medium   | Notifications per event date       |
| Brand Marketplace Dashboard   | High     | Monetization scaling               |
| Group Chat per Wishlist       | Low      | Social gifting coordination        |

---

# **13. Design Style Guidelines**

* Minimalism (Pinterest-like grid)
* Soft color palette
* Warm emotions and delight animation microinteractions
* Smooth transitions between states (Flutter Hero animations)

---

If всё ок — **готов сделать:**

✅ Полные UX Wireframes
✅ UI Component System for Flutter
✅ REST API spec
✅ Entity Database Model

**Сказать?**
→ *"Yes, continue with wireframes"*
