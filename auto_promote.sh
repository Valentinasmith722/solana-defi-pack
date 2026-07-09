#!/bin/bash
# Auto-promotion script for GitHub repos
# Run daily to generate activity and visibility

echo "🚀 Starting auto-promotion cycle..."

# 1. Star trending repos in same niche (gets you on their radar)
curl -s -X PUT -H "Authorization: token $GITHUB_TOKEN"   https://api.github.com/user/starred/coinbase/x402

curl -s -X PUT -H "Authorization: token $GITHUB_TOKEN"   https://api.github.com/user/starred/solana-labs/solana

curl -s -X PUT -H "Authorization: token $GITHUB_TOKEN"   https://api.github.com/user/starred/jup-ag/jupiter-core

echo "✅ Starred trending repos"

# 2. Watch repos for notifications (shows up in activity feed)
curl -s -X PUT -H "Authorization: token $GITHUB_TOKEN"   https://api.github.com/user/subscriptions/coinbase/x402

echo "✅ Watching key repos"

# 3. Follow active developers in Solana ecosystem
curl -s -X PUT -H "Authorization: token $GITHUB_TOKEN"   https://api.github.com/user/following/armaniferrante

curl -s -X PUT -H "Authorization: token $GITHUB_TOKEN"   https://api.github.com/user/following/mvines

echo "✅ Following key developers"

# 4. Create a small commit (shows activity on your profile)
git clone https://github.com/Valentinasmith722/solana-defi-pack.git /tmp/solana-defi-pack
cd /tmp/solana-defi-pack
echo "$(date) - Daily update" >> ACTIVITY.log
git add ACTIVITY.log
git commit -m "Daily activity update $(date +%Y-%m-%d)"
git push origin main

echo "✅ Activity commit pushed"

echo "🎉 Auto-promotion complete!"
