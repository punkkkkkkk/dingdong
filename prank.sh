#!/bin/bash

# Karan's Ultimate Prank Script v3.0 - Crème de la Crème Edition
# Hidden folder, colorful messages, and unstoppable fun!

set -uo pipefail

# Configuration
SCRIPT_NAME="🎭 Karan's Ultimate Ding Dong Prank"
VERSION="3.0.0"
HIDDEN_DIR="$HOME/Downloads/.Karan"  # Hidden with dot prefix
DELAY=0.005  # Ultra-fast duplication
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

# Funny messages array
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

# Print with enhanced colors and effects
print_colored() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
    echo "$(date): $message" >> "$LOG_FILE" 2>/dev/null || true
}

# Print random funny message
print_funny() {
    local message=${FUNNY_MESSAGES[$RANDOM % ${#FUNNY_MESSAGES[@]}]}
    local colors=("$RED$BOLD" "$GREEN$BOLD" "$YELLOW$BOLD" "$BLUE$BOLD" "$PURPLE$BOLD" "$CYAN$BOLD")
    local color=${colors[$RANDOM % ${#colors[@]}]}
    print_colored "$color$BLINK" "$message"
}

# Help function
show_help() {
    cat << EOF
${SCRIPT_NAME} v${VERSION}

🎭 The ultimate prank experience with hidden folders and colorful chaos!

Usage: $0 [IMAGE_FILE]

Features:
🔒 Hidden .Karan folder (invisible by default)
🎨 Colorful, funny messages during execution  
🔊 Audio announcements and sound effects
⚡ Ultra-fast file duplication
💀 Runs until storage is completely annihilated

Options:
  -h, --help     Show this fabulous help
  -v, --version  Show version info

Examples:
  $0 payload.png
  $0 /path/to/your/doom.jpg

To reveal hidden files: Cmd+Shift+. in Finder
To stop (good luck): killall -9 bash
EOF
}

# Validate macOS
check_macos() {
    if [[ "$(uname)" != "Darwin" ]]; then
        print_colored "$RED$BOLD" "💀 ERROR: This masterpiece only works on macOS!"
        exit 1
    fi
}

# Validate payload
validate_payload() {
    local payload="$1"
    
    if [[ -z "$payload" ]]; then
        print_colored "$RED$BOLD" "🎯 ERROR: Need an image to multiply!"
        show_help
        exit 1
    fi
    
    if [[ ! -f "$payload" ]]; then
        print_colored "$RED$BOLD" "🔍 ERROR: Can't find '$payload'!"
        exit 1
    fi
}

# Setup hidden directory with style
setup_hidden_directory() {
    print_colored "$CYAN$BOLD" "🏗️  Creating the legendary hidden fortress..."
    
    # Create the hidden directory
    mkdir -p "$HIDDEN_DIR"
    
    # Make it extra hidden
    chflags hidden "$HIDDEN_DIR" 2>/dev/null || true
    
    # Create log file
    touch "$LOG_FILE"
    
    print_colored "$GREEN$BOLD" "✅ Hidden fortress '.Karan' established!"
    print_colored "$YELLOW$BOLD" "👁️  Use Cmd+Shift+. to peek into the chaos!"
}

# Epic audio announcements
announce_start() {
    print_colored "$PURPLE$BOLD$BLINK" "🎵 PREPARING AUDIO EXPERIENCE..."
    
    osascript -e "set volume output volume 85" 2>/dev/null || true
    
    # Epic startup announcement
    say "Ding dong! Welcome to Karan's ultimate digital prank! Prepare for storage annihilation!" &
    sleep 1
    say "Initializing chaos protocols in 3... 2... 1... Let the fun begin!" &
}

# Progress announcements
announce_progress() {
    local count=$1
    local funny_progress=(
        "Excellent! Your doom progresses nicely!"
        "Magnificent! The chaos spreads!"
        "Wonderful! Storage space is dying beautifully!"
        "Fantastic! Digital destruction in progress!"
        "Superb! The end is near!"
        "Brilliant! No mercy for empty space!"
        "Outstanding! Your disk is crying!"
        "Phenomenal! Digital apocalypse mode activated!"
    )
    
    local message=${funny_progress[$RANDOM % ${#funny_progress[@]}]}
    say "$message File count: $count" &
}

# Ultimate duplication with style
ultimate_duplication() {
    local source_file="$HIDDEN_DIR/.karan_ultimate_payload"
    local counter=0
    local last_announcement=0
    
    print_colored "$RED$BOLD$BLINK" "🚀 INITIATING ULTIMATE DIGITAL WARFARE!"
    print_funny
    
    # Main duplication loop with style
    while cp "$source_file" "$HIDDEN_DIR/karan_ultimate_$(printf "%08d" $counter).jpg" 2>/dev/null; do
        counter=$((counter + 1))
        
        # Colorful progress every 50 files
        if [[ $((counter % 50)) -eq 0 ]]; then
            print_funny
        fi
        
        # Progress updates every 200 files
        if [[ $((counter % 200)) -eq 0 ]]; then
            print_colored "$BG_GREEN$WHITE$BOLD" "💥 DESTRUCTION LEVEL: $counter files eliminated!"
        fi
        
        # Audio announcements every 500 files
        if [[ $((counter % 500)) -eq 0 ]] && [[ $counter -gt $last_announcement ]]; then
            announce_progress $counter
            last_announcement=$counter
        fi
        
        # Epic milestone celebrations
        case $counter in
            1000)
                print_colored "$BG_YELLOW$RED$BOLD$BLINK" "🎉 FIRST THOUSAND DOWN! LEGENDARY!"
                say "One thousand files down! You're officially in trouble!" &
                ;;
            5000)
                print_colored "$BG_RED$WHITE$BOLD$BLINK" "🔥 FIVE THOUSAND! UNSTOPPABLE FORCE!"
                say "Five thousand files! Your storage is screaming!" &
                ;;
            10000)
                print_colored "$BG_GREEN$YELLOW$BOLD$BLINK" "💎 TEN THOUSAND! DIAMOND LEVEL CHAOS!"
                say "Ten thousand files! Welcome to digital hell!" &
                ;;
        esac
        
        sleep $DELAY
    done
    
    print_colored "$PURPLE$BOLD$BLINK" "🎯 MISSION ACCOMPLISHED! Final body count: $counter files"
    return $counter
}

# Epic completion
announce_completion() {
    local final_count=$1
    
    print_colored "$BG_PURPLE$WHITE$BOLD$BLINK" "🏆 ULTIMATE VICTORY ACHIEVED!"
    print_colored "$GREEN$BOLD" "📊 Final Statistics:"
    print_colored "$CYAN" "   📁 Location: $HIDDEN_DIR"
    print_colored "$YELLOW" "   📸 Files created: $final_count"
    print_colored "$RED" "   💾 Storage remaining: Probably none!"
    
    # Epic completion announcement
    osascript -e "set volume output volume 90" 2>/dev/null || true
    say "Mission accomplished! Karan's ultimate prank has created $final_count files in your hidden dot Karan folder! Your storage has been beautifully annihilated!" &
    
    # Display ASCII art victory
    print_colored "$GREEN$BOLD" "
    🎭 KARAN'S ULTIMATE PRANK 🎭
    ═══════════════════════════
    💀 STORAGE: ELIMINATED 💀
    🎯 FILES: $final_count CREATED 🎯
    🏆 STATUS: LEGENDARY SUCCESS 🏆
    "
}

# Main function
main() {
    case "${1:-}" in
        -h|--help) show_help; exit 0 ;;
        -v|--version) echo "$SCRIPT_NAME v$VERSION"; exit 0 ;;
        "") print_colored "$RED$BOLD" "🎯 Need an image to work with!"; show_help; exit 1 ;;
    esac
    
    local payload="$1"
    
    # Pre-flight checks
    check_macos
    validate_payload "$payload"
    
    # Epic warning
    print_colored "$RED$BOLD$BLINK" "⚠️  ULTIMATE WARNING: This will fill your disk completely!"
    print_colored "$YELLOW$BOLD" "⚠️  Hidden folder: $HIDDEN_DIR"
    print_colored "$PURPLE$BOLD" "⚠️  Files will be invisible until you use Cmd+Shift+."
    echo
    read -p "Ready for ultimate chaos? Type 'BRING_IT_ON': " -r
    if [[ $REPLY != "BRING_IT_ON" ]]; then
        print_colored "$BLUE$BOLD" "🛑 Wise choice. Chaos postponed!"
        exit 0
    fi
    
    # Execute the ultimate prank
    print_colored "$PURPLE$BOLD$BLINK" "$SCRIPT_NAME v$VERSION"
    print_colored "$CYAN$BOLD" "🎯 Target image: $payload"
    
    setup_hidden_directory
    
    # Copy payload
    cp "$payload" "$HIDDEN_DIR/.karan_ultimate_payload"
    
    announce_start
    
    # Start ultimate duplication
    ultimate_duplication
    local final_count=$?
    
    announce_completion $final_count
    
    print_colored "$GREEN$BOLD$BLINK" "🎭 Thank you for playing Karan's Ultimate Prank!"
}

# Execute
main "$@"
