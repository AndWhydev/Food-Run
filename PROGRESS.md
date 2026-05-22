# FoodRun Foundation Fixes — Progress as of 20/05/2026

## Branch
All changes are on the `foundation-fixes` branch. Nothing has been merged to main yet.

## Completed and Verified

Fix 1 — Unknown route crash
Status: Done and screenshot verified
File changed: lib/routes/app_routes.dart
What was done: Added errorBuilder to GoRouter. Bad URLs now show a Page Not Found screen with a Go Home button.

Fix 2 — Screen transition bleed-through on Edit Profile and Change Password
Status: Done and screenshot verified
File changed: lib/routes/app_routes.dart
What was done: Replaced builder with pageBuilder using CustomTransitionPage and FadeTransition on the /edit-profile and /change-password routes.

Fix 3 — Change Password screen broken
Status: Done and screenshot verified
Files changed: lib/views/rider/pages/profile/change_password.dart, lib/auth/providers/auth_provider.dart
What was done: Added Confirm New Password field, added mismatch validation snackbar, wired up the Update Password button, updated changePassword in auth_provider to use named params and reauthenticate with old password before updating. Also fixed autofill hints so Chrome only pre-fills the Old Password field.

Fix 4 — Dialogs could not be dismissed
Status: Done and screenshot verified
File changed: lib/views/customer/home/widgets/customer_home_mob.dart
What was done: Added barrierDismissible: true to both active showDialog calls. ESC and backdrop click now close the dialogs.

Fix 6 — Timestamps only showed relative time
Status: Done and screenshot verified
File changed: lib/views/customer/home/widgets/order_card.dart
What was done: Updated _formatTimestamp to return DD/MM/YYYY HH:MM (Xd ago) format instead of just Xd ago.

## Pending — Waiting on Firebase Console Access

Fix 5 — Old delivered/cancelled orders showing in live view
Status: Code done, needs Firebase index
File changed: lib/providers/admin_provider.dart
What was done: listenOrders now filters to active statuses only using whereIn. archiveOldOrders() method added. Also added archived and orderNumber fields to lib/models/order_model.dart.
Remaining action: Create composite Firestore index — collection: orders, field 1: status Ascending, field 2: createdAt Descending.

Fix 7 — Orders showing random ID instead of readable number
Status: Code done, needs Firestore document
Files changed: lib/providers/admin_provider.dart, lib/models/order_model.dart, lib/views/customer/home/widgets/order_card.dart
What was done: createOrder now uses a transaction to increment a counter and stamp orderNumber on each new order. Order cards show Order #1001 style with fallback to old ID format for existing orders.
Remaining action: Create Firestore document at meta/orderCounter with field lastOrderNumber = 1000 (number).

## Firebase Access
Need to be added as Owner on project foodhub-a1ec1.
Email sent to client asking them to have the original developer add andy@allwebbedup.com.au as Owner in Firebase Console under Project Settings > Users and Permissions.

## Next Steps
1. Wait for Firebase owner access
2. Create the composite index (Fix 5)
3. Create the meta/orderCounter document (Fix 7)
4. Open PR from foundation-fixes to main for review
