#!/bin/bash

# Script to set up iOS deployment for Flutter Photo Gallery App

echo "🍎 iOS Deployment Setup"
echo "======================="
echo ""

# Check Flutter
echo "Checking Flutter installation..."
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter not found. Please install Flutter first."
    exit 1
fi
echo "✅ Flutter found"
echo ""

# Check Xcode
echo "Checking Xcode installation..."
if ! command -v xcodebuild &> /dev/null; then
    echo "❌ Xcode not found. Please install Xcode from App Store."
    exit 1
fi
echo "✅ Xcode found"
echo ""

# Check connected devices
echo "Checking for connected devices..."
flutter devices

echo ""
echo "📋 Next Steps:"
echo "=============="
echo ""
echo "1. Open Xcode project:"
echo "   open ios/Runner.xcworkspace"
echo ""
echo "2. In Xcode:"
echo "   • Select 'Runner' in the left panel"
echo "   • Go to 'Signing & Capabilities' tab"
echo "   • Check 'Automatically manage signing'"
echo "   • Select your Team (Apple ID)"
echo "   • Change Bundle Identifier if needed (e.g., com.yourname.photogallery)"
echo ""
echo "3. Connect your iPhone and select it as the target device"
echo ""
echo "4. Trust the app on your iPhone:"
echo "   Settings > General > Device Management > Trust Developer"
echo ""
echo "5. Run: flutter run"
echo ""
